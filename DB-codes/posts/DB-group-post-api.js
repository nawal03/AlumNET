const Database = require('../database');
const database = new Database();


async function addGroupPost(group_post, user_id, group_id){
    const sql = `BEGIN
                    ADD_GROUP_POST(:user_id, :group_id, :topic, :description, :result);
                END;`;

    const binds={
        user_id : user_id,
        group_id : group_id,
        topic : group_post.topic,
        description : group_post.description,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function updateGroupPost(group_post, post_id){
    const sql = `BEGIN
                    UPDATE_GROUP_POST(:post_id, :topic, :description, :result);
                END;`;
    const binds={
        post_id : post_id,
        topic : group_post.topic,
        description : group_post.description,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function deleteGroupPost(post_id){
    const sql =`DELETE FROM POSTS
                WHERE post_id = :post_id`;

    const binds={
        post_id : post_id
    }
    await database.execute(sql, binds);
    return binds;
}

async function getGroupPostsSortedByNewest(user_id, group_id){
    const sql =`SELECT GP.*, U.USER_ID, U.FIRST_NAME||' '|| U.LAST_NAME USER_NAME, U.PROFILE_PICTURE, G.ADMIN_ID,
                    (SELECT COUNT(*) FROM LIKES L WHERE L.POST_ID = GP.POST_ID)  LIKE_COUNT,
                    (SELECT COUNT(*) FROM COMMENTS C WHERE C.POST_ID = GP.POST_ID)  COMMENT_COUNT,
                    IS_LIKED(GP.POST_ID, :user_id) IS_LIKED
                FROM GROUP_POSTS GP JOIN GROUP_MEMBERS GM ON GM.GROUP_MEMBER_ID = GP.GROUP_MEMBER_ID
                JOIN USERS U ON GM.USER_ID = U.USER_ID
                JOIN GROUPS G ON G.GROUP_ID = GM.GROUP_ID
                WHERE GM.GROUP_ID = :group_id
                ORDER BY TIMESTAMP DESC`
    const binds={
        user_id : user_id,
        group_id: group_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}

async function searchGroupPosts(user_id, group_id, str){
    const sql =`SELECT GP.*, U.USER_ID, U.FIRST_NAME|| ' '|| U.LAST_NAME USER_NAME, U.PROFILE_PICTURE, G.ADMIN_ID,
                    (SELECT COUNT(*) FROM LIKES L WHERE L.POST_ID = GP.POST_ID)  LIKE_COUNT,
                    (SELECT COUNT(*) FROM COMMENTS C WHERE C.POST_ID = GP.POST_ID)  COMMENT_COUNT,
                    IS_LIKED(GP.POST_ID, :user_id) IS_LIKED
                FROM GROUP_POSTS GP JOIN GROUP_MEMBERS GM ON GM.GROUP_MEMBER_ID = GP.GROUP_MEMBER_ID
                JOIN USERS U ON GM.USER_ID = U.USER_ID
                JOIN GROUPS G ON G.GROUP_ID = GM.GROUP_ID
                WHERE ( U.FIRST_NAME||' '|| U.LAST_NAME LIKE UPPER('%'||:str||'%')
                    OR GP.TOPIC LIKE UPPER('%'||:str||'%')
                    OR UPPER(GP.DESCRIPTION) LIKE UPPER('%'||:str||'%') )
                    AND GM.GROUP_ID = :group_id
                ORDER BY TIMESTAMP DESC`
    const binds={
        user_id : user_id,
        group_id : group_id,
        str : str
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}


async function getGroupPost(user_id, post_id){
    const sql =`SELECT GP.*, U.USER_ID, U.FIRST_NAME|| ' '|| U.LAST_NAME USER_NAME, U.PROFILE_PICTURE, GM.GROUP_ID, G.ADMIN_ID,
                    (SELECT COUNT(*) FROM LIKES L WHERE L.POST_ID = GP.POST_ID)  LIKE_COUNT,
                    (SELECT COUNT(*) FROM COMMENTS C WHERE C.POST_ID = GP.POST_ID)  COMMENT_COUNT,
                    IS_LIKED(GP.POST_ID, :user_id) IS_LIKED
                FROM GROUP_POSTS GP JOIN GROUP_MEMBERS GM ON GM.GROUP_MEMBER_ID = GP.GROUP_MEMBER_ID
                JOIN USERS U ON GM.USER_ID = U.USER_ID
                JOIN GROUPS G ON G.GROUP_ID = GM.GROUP_ID
                WHERE GP.POST_ID = :post_id`
    const binds={
        user_id: user_id,
        post_id : post_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result[0];
}

module.exports = {
    addGroupPost,
    updateGroupPost,
    deleteGroupPost,
    getGroupPostsSortedByNewest,
    searchGroupPosts,
    getGroupPost
}