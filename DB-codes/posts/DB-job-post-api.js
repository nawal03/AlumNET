const Database = require('../database');
const database = new Database();


async function addJobPost(job_post, user_id){
    const sql = `BEGIN
                    ADD_JOB_POST(:user_id, :company_name, :job_type, :remote,
                        :latitude, :longitude, :requirements, :designation,
                        :expected_salary, :vacancy, :email, :phone_no, :result);
                END;`;
    const binds={
        user_id : user_id,
        company_name : job_post.company_name,
        job_type : job_post.job_type,
        remote : job_post.remote,
        latitude : job_post.latitude,
        longitude : job_post.longitude,
        requirements : job_post.requirements,
        designation : job_post.designation,
        expected_salary : job_post.expected_salary,
        vacancy : job_post.vacancy,
        email : job_post.email,
        phone_no : job_post.phone_no,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function updateJobPost(job_post, post_id){
    const sql = `BEGIN
                    UPDATE_JOB_POST(:post_id, :company_name, :job_type, :remote,
                        :latitude, :longitude, :requirements, :designation,
                        :expected_salary, :vacancy, :email, :phone_no, :result);
                END;`;
    const binds={
        post_id : post_id,
        company_name : job_post.company_name,
        job_type : job_post.job_type,
        remote : job_post.remote,
        latitude : job_post.latitude,
        longitude : job_post.longitude,
        requirements : job_post.requirements,
        designation : job_post.designation,
        expected_salary : job_post.expected_salary,
        vacancy : job_post.vacancy,
        email : job_post.email,
        phone_no : job_post.phone_no,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function deleteJobPost(post_id){
    const sql =`DELETE FROM POSTS
                WHERE post_id = :post_id`;

    const binds={
        post_id : post_id
    }
    await database.execute(sql, binds);
    return binds;
}

async function getJobPostsSortedByNewest(user_id){
    const sql =`SELECT JP.*, U.FIRST_NAME|| ' '|| U.LAST_NAME USER_NAME, U.PROFILE_PICTURE,
                    (SELECT COUNT(*) FROM LIKES L WHERE L.POST_ID = JP.POST_ID)  LIKE_COUNT,
                    (SELECT COUNT(*) FROM COMMENTS C WHERE C.POST_ID = JP.POST_ID)  COMMENT_COUNT,
                    IS_LIKED(JP.POST_ID, :user_id) IS_LIKED
                FROM JOB_POSTS JP LEFT OUTER JOIN USERS U ON JP.USER_ID = U.USER_ID
                ORDER BY TIMESTAMP DESC`;
    const binds={
        user_id : user_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}

async function getJobPostsByUserId(user_id, cur_user_id){
    const sql =`SELECT JP.*, U.FIRST_NAME|| ' '|| U.LAST_NAME USER_NAME, U.PROFILE_PICTURE,
                    (SELECT COUNT(*) FROM LIKES L WHERE L.POST_ID = JP.POST_ID)  LIKE_COUNT,
                    (SELECT COUNT(*) FROM COMMENTS C WHERE C.POST_ID = JP.POST_ID)  COMMENT_COUNT,
                    IS_LIKED(JP.POST_ID, :cur_user_id) IS_LIKED
                FROM JOB_POSTS JP LEFT OUTER JOIN USERS U ON JP.USER_ID = U.USER_ID
                WHERE JP.USER_ID = :user_id
                ORDER BY TIMESTAMP DESC`;
    const binds={
        user_id : user_id,
        cur_user_id: cur_user_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}

async function searchJobPosts(user_id, query){
    const sql =`SELECT JP.*, U.FIRST_NAME|| ' '|| U.LAST_NAME USER_NAME, U.PROFILE_PICTURE,
                    (SELECT COUNT(*) FROM LIKES L WHERE L.POST_ID = JP.POST_ID)  LIKE_COUNT,
                    (SELECT COUNT(*) FROM COMMENTS C WHERE C.POST_ID = JP.POST_ID)  COMMENT_COUNT,
                    IS_LIKED(JP.POST_ID, :user_id) IS_LIKED
                FROM JOB_POSTS JP LEFT OUTER JOIN USERS U ON JP.USER_ID = U.USER_ID
                WHERE ( U.FIRST_NAME|| ' '|| U.LAST_NAME LIKE UPPER('%'||:str||'%')
                    OR UPPER(JP.COMPANY_NAME) LIKE UPPER('%'||:str||'%')
                    OR UPPER(JP.JOB_TYPE) LIKE UPPER('%'||:str||'%')
                    OR UPPER(JP.REQUIREMENTS) LIKE UPPER('%'||:str||'%')
                    OR UPPER(JP.DESIGNATION) LIKE UPPER('%'||:str||'%') )
                    AND UPPER(JP.REMOTE) LIKE UPPER('%' || :remote || '%')
                    AND EXPECTED_SALARY >= :salary_lower_bound AND EXPECTED_SALARY<= :salary_upper_bound
                    AND IS_NEARBY(JP.LATITUDE, JP.LONGITUDE, :latitude, :longitude) = 'YES'
                ORDER BY TIMESTAMP DESC`;
    const binds={
        user_id : user_id,
        str : query.str,
        latitude : query.latitude,
        longitude : query.longitude,
        remote : query.remote,
        salary_upper_bound : query.salary_upper_bound,
        salary_lower_bound : query.salary_lower_bound
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}

async function getJobPost(user_id, post_id){
    const sql =`SELECT JP.*, U.FIRST_NAME|| ' '|| U.LAST_NAME USER_NAME, U.PROFILE_PICTURE,
                    (SELECT COUNT(*) FROM LIKES L WHERE L.POST_ID = JP.POST_ID)  LIKE_COUNT,
                    (SELECT COUNT(*) FROM COMMENTS C WHERE C.POST_ID = JP.POST_ID)  COMMENT_COUNT,
                    IS_LIKED(JP.POST_ID, :user_id) IS_LIKED
                FROM JOB_POSTS JP LEFT OUTER JOIN USERS U ON JP.USER_ID = U.USER_ID
                WHERE JP.POST_ID = :post_id`;
    const binds={
        user_id: user_id,
        post_id : post_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result[0];
}

async function getCV(user_id){
    const sql =`BEGIN
                    CREATE_CV(:user_id, :result);
                END;`;
    const binds={
        user_id: user_id,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.CLOB
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function postCV(user_id, post_id){
    const sql =`BEGIN
                    CREATE_CV(:user_id, :result);
                    INSERT INTO JOB_APPLICATION(POST_ID, USER_ID, CV)
                    VALUES(:post_id, :user_id, :result);
                END;`;
    const binds={
        user_id: user_id,
        post_id : post_id,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.CLOB
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function getApplicants(post_id){
    const sql =`SELECT * FROM JOB_APPLICATION WHERE POST_ID = :post_id`;
    const binds={
        post_id : post_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}

async function hasApplied(user_id, post_id){
    const sql =`SELECT COUNT(*) COUNT FROM JOB_APPLICATION
                 WHERE POST_ID = :post_id AND USER_ID = :user_id`;
    const binds={
        user_id : user_id,
        post_id : post_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result[0];
}

module.exports = {
    addJobPost,
    updateJobPost,
    deleteJobPost,
    getJobPostsSortedByNewest,
    getJobPostsByUserId,
    searchJobPosts,
    getJobPost,
    getCV,
    postCV,
    getApplicants,
    hasApplied
}