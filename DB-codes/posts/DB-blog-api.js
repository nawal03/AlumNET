const Database = require('../database');
const database = new Database();


async function addBlog(blog, user_id){
    const sql = `BEGIN
                    ADD_BLOG(:user_id, :topic, :title, :description, :result);
                END;`;
    
    const binds={
        user_id : user_id,
        topic : blog.topic,
        title : blog.title,
        description : blog.description,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function updateBlog(blog, post_id){
    const sql = `BEGIN
                    UPDATE_BLOG(:post_id, :topic, :title, :description, :result);
                END;`;
    const binds={
        post_id : post_id,
        topic : blog.topic,
        title : blog.title,
        description : blog.description,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function deleteBlog(post_id){
    const sql =`DELETE FROM POSTS
                WHERE post_id = :post_id`;

    const binds={
        post_id : post_id
    }
    await database.execute(sql, binds);
    return binds;
}

async function getBlogsSortedByNewest(user_id){
    const sql =`SELECT B.*, U.FIRST_NAME|| ' '|| U.LAST_NAME USER_NAME, U.PROFILE_PICTURE,
                    (SELECT COUNT(*) FROM LIKES L WHERE L.POST_ID = B.POST_ID)  LIKE_COUNT,
                    (SELECT COUNT(*) FROM COMMENTS C WHERE C.POST_ID = B.POST_ID)  COMMENT_COUNT,
                    IS_LIKED(B.POST_ID, :user_id) IS_LIKED
                FROM BLOGS B LEFT OUTER JOIN USERS U ON B.USER_ID = U.USER_ID
                ORDER BY TIMESTAMP DESC`;
    const binds={
        user_id : user_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}

async function getBlogsSortedByMostPopular(user_id){
    const sql =`SELECT B.*, U.FIRST_NAME|| ' '|| U.LAST_NAME USER_NAME, U.PROFILE_PICTURE,
                    (SELECT COUNT(*) FROM LIKES L WHERE L.POST_ID = B.POST_ID)  LIKE_COUNT,
                    (SELECT COUNT(*) FROM COMMENTS C WHERE C.POST_ID = B.POST_ID)  COMMENT_COUNT,
                    IS_LIKED(B.POST_ID, :user_id) IS_LIKED
                FROM BLOGS B LEFT OUTER JOIN USERS U ON B.USER_ID = U.USER_ID
                ORDER BY LIKE_COUNT+COMMENT_COUNT DESC`;
    const binds={
        user_id : user_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}

async function getBlogsByUserId(user_id, cur_user_id){
    const sql =`SELECT B.*, U.FIRST_NAME|| ' '|| U.LAST_NAME USER_NAME, U.PROFILE_PICTURE,
                    (SELECT COUNT(*) FROM LIKES L WHERE L.POST_ID = B.POST_ID)  LIKE_COUNT,
                    (SELECT COUNT(*) FROM COMMENTS C WHERE C.POST_ID = B.POST_ID)  COMMENT_COUNT,
                    IS_LIKED(B.POST_ID, :cur_user_id) IS_LIKED
                FROM BLOGS B LEFT OUTER JOIN USERS U ON B.USER_ID = U.USER_ID
                WHERE B.USER_ID = :user_id
                ORDER BY TIMESTAMP DESC`;
    const binds={
        user_id : user_id,
        cur_user_id: cur_user_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}

async function searchBlogs(user_id, str){
    const sql =`SELECT B.*, U.FIRST_NAME|| ' '|| U.LAST_NAME USER_NAME, U.PROFILE_PICTURE,
                    (SELECT COUNT(*) FROM LIKES L WHERE L.POST_ID = B.POST_ID)  LIKE_COUNT,
                    (SELECT COUNT(*) FROM COMMENTS C WHERE C.POST_ID = B.POST_ID)  COMMENT_COUNT,
                    IS_LIKED(B.POST_ID, :user_id) IS_LIKED
                FROM BLOGS B LEFT OUTER JOIN USERS U ON B.USER_ID = U.USER_ID
                WHERE U.FIRST_NAME|| ' '|| U.LAST_NAME LIKE UPPER('%'||:str||'%')
                    OR B.TOPIC LIKE UPPER('%'||:str||'%')
                    OR UPPER(B.TITLE) LIKE UPPER('%'||:str||'%')
                    OR UPPER(B.DESCRIPTION) LIKE UPPER('%'||:str||'%')
                ORDER BY TIMESTAMP DESC`;
    const binds={
        user_id : user_id,
        str : str
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}

async function suggestedBlogs(user_id){
    const sql =`SELECT B.*, U.FIRST_NAME|| ' '|| U.LAST_NAME USER_NAME, U.PROFILE_PICTURE,
                    (SELECT COUNT(*) FROM LIKES L WHERE L.POST_ID = B.POST_ID)  LIKE_COUNT,
                    (SELECT COUNT(*) FROM COMMENTS C WHERE C.POST_ID = B.POST_ID)  COMMENT_COUNT,
                    (SELECT COUNT(*) FROM LIKES L JOIN FOLLOWS F ON L.USER_ID = F.FOLLOWING
                                        WHERE L.POST_ID = B.POST_ID
                                        AND F.FOLLOWER = :user_id)  LIKE_FOLLOWING_COUNT,
                    (SELECT COUNT(*) FROM COMMENTS C JOIN FOLLOWS F ON C.USER_ID = F.FOLLOWING
                                        WHERE C.POST_ID = B.POST_ID
                                        AND F.FOLLOWER = :user_id)  COMMENT_FOLLOWING_COUNT,
                    IS_LIKED(B.POST_ID, :user_id) IS_LIKED
                FROM BLOGS B LEFT OUTER JOIN USERS U ON B.USER_ID = U.USER_ID
                WHERE (SELECT COUNT(*) FROM LIKES L JOIN FOLLOWS F ON L.USER_ID = F.FOLLOWING
                                        WHERE L.POST_ID = B.POST_ID
                                        AND F.FOLLOWER = :user_id)+
                    (SELECT COUNT(*) FROM COMMENTS C JOIN FOLLOWS F ON C.USER_ID = F.FOLLOWING
                                        WHERE C.POST_ID = B.POST_ID
                                        AND F.FOLLOWER = :user_id)  > 0
                ORDER BY LIKE_FOLLOWING_COUNT+COMMENT_FOLLOWING_COUNT DESC, TIMESTAMP DESC`;
    const binds={
        user_id : user_id,
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}

async function getBlog(user_id, post_id){
    const sql =`SELECT B.*, U.FIRST_NAME|| ' '|| U.LAST_NAME USER_NAME, U.PROFILE_PICTURE,
                    (SELECT COUNT(*) FROM LIKES L WHERE L.POST_ID = B.POST_ID)  LIKE_COUNT,
                    (SELECT COUNT(*) FROM COMMENTS C WHERE C.POST_ID = B.POST_ID)  COMMENT_COUNT,
                    IS_LIKED(B.POST_ID, :user_id) IS_LIKED
                FROM BLOGS B LEFT OUTER JOIN USERS U ON B.USER_ID = U.USER_ID
                WHERE B.POST_ID = :post_id`;
    const binds={
        user_id: user_id,
        post_id : post_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result[0];
}

module.exports = {
    addBlog,
    updateBlog,
    deleteBlog,
    getBlogsSortedByNewest,
    getBlogsSortedByMostPopular,
    getBlogsByUserId,
    searchBlogs,
    suggestedBlogs,
    getBlog
}