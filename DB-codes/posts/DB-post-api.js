const res = require('express/lib/response');
const Database = require('../database');
const database = new Database();

async function getPost(post_id){
    const sql = `SELECT B.USER_ID USER_ID, P.* FROM POSTS P JOIN BLOGS B on P.POST_ID = B.POST_ID
                    WHERE P.POST_ID = :post_id
                    UNION
                    SELECT JP.USER_ID USER_ID, P.* FROM POSTS P JOIN JOB_POSTS JP on P.POST_ID = JP.POST_ID
                    WHERE P.POST_ID = :post_id
                    UNION
                    SELECT M.USER_ID USER_ID, P.* FROM POSTS P JOIN MERCHS M on P.POST_ID = M.POST_ID
                    WHERE P.POST_ID = :post_id
                    UNION
                    SELECT GM.USER_ID,P.* FROM POSTS P JOIN GROUP_POSTS GP on P.POST_ID = GP.POST_ID
                    JOIN GROUP_MEMBERS GM ON GM.GROUP_MEMBER_ID = GP.GROUP_MEMBER_ID
                    WHERE P.POST_ID = :post_id`;
    
    const binds={
        post_id : post_id
    }
    let result = (await database.execute(sql, binds)).rows;
    return result[0];
}

async function addLike(user_id, post_id){
    const sql = `INSERT INTO LIKES(LIKE_ID, USER_ID, POST_ID)
                    VALUES(LIKE_SEQ.nextval, :user_id, :post_id)`;
    
    const binds={
        user_id : user_id,
        post_id : post_id
    }
    await database.execute(sql, binds);
    return;
}


async function removeLike(user_id, post_id){
    const sql = `DELETE FROM LIKES 
                    WHERE USER_ID = :user_id AND post_id = :post_id`;
    
    const binds={
        user_id : user_id,
        post_id : post_id
    }
    await database.execute(sql, binds);
    return;
}

async function getLikes(post_id){
    const sql = `
    SELECT L.*, U.FIRST_NAME|| ' '|| U.LAST_NAME USER_NAME, U.PROFILE_PICTURE FROM LIKES L JOIN USERS U on U.USER_ID = L.USER_ID
    WHERE POST_ID= :post_id`;
    const binds = {
        post_id : post_id
    }
    const result = (await database.execute(sql, binds)).rows;
    return result;
}

async function addComment(post_id, user_id, body){
    const sql = `INSERT INTO COMMENTS(COMMENT_ID, USER_ID, POST_ID, BODY)
                    VALUES(COMMENT_SEQ.nextval, :user_id, :post_id, :body)`;
    
    const binds={
        user_id : user_id,
        post_id : post_id,
        body: body
    }
    await database.execute(sql, binds);
    return;
}

async function updateComment(comment_id, body){
    const sql = `UPDATE COMMENTS
                    SET BODY = :body
                WHERE COMMENT_ID = :comment_id`;
    
    const binds={
        comment_id : comment_id,
        body: body
    }
    await database.execute(sql, binds);
    return;
}

async function deleteComment(comment_id){
    const sql = `DELETE FROM COMMENTS 
                    WHERE COMMENT_ID = :comment_id`;
    
    const binds={
        comment_id : comment_id
    }
    await database.execute(sql, binds);
    return;
}


async function getComments(post_id){
    const sql = `
    SELECT C.*, U.FIRST_NAME|| ' '|| U.LAST_NAME USER_NAME, U.PROFILE_PICTURE FROM COMMENTS C JOIN USERS U on U.USER_ID = C.USER_ID
    WHERE POST_ID= :post_id
    ORDER BY TIMESTAMP ASC`
    const binds = {
        post_id : post_id
    }
    const result = (await database.execute(sql, binds)).rows;
    return result;
}

async function getComment(comment_id){
    const sql = `SELECT * FROM COMMENTS WHERE COMMENT_ID = :comment_id`;
    const binds={
        comment_id : comment_id
    }
    const result = (await database.execute(sql, binds)).rows;
    return result[0];
}

module.exports = {
    getPost,
    addLike,
    removeLike,
    getLikes,
    addComment,
    updateComment,
    deleteComment,
    getComments,
    getComment
}