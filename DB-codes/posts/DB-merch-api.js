const Database = require('../database');
const database = new Database();


async function addMerch(merch, user_id){
    const sql = `BEGIN
                    ADD_MERCH(:user_id, :product_name, :image, :price,
                                 :email, :phone_no, :description, :result);
                END;`;
    const binds={
        user_id : user_id,
        product_name : merch.product_name,
        image : merch.image,
        price : merch.price,
        email : merch.email,
        phone_no : merch.phone_no,
        description : merch.description,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function updateMerch(merch, post_id){
    const sql = `BEGIN
                    UPDATE_MERCH(:post_id, :product_name, :image, :price,
                                :email, :phone_no, :description, :result);
                END;`;
    const binds={
        post_id : post_id,
        product_name : merch.product_name,
        image : merch.image,
        price : merch.price,
        email : merch.email,
        phone_no : merch.phone_no,
        description : merch.description,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function deleteMerch(post_id){
    const sql =`DELETE FROM POSTS
                WHERE post_id = :post_id`;

    const binds={
        post_id : post_id
    }
    await database.execute(sql, binds);
    return binds;
}

async function getMerchsSortedByNewest(user_id){
    const sql =`SELECT M.*, U.FIRST_NAME|| ' '|| U.LAST_NAME USER_NAME, U.PROFILE_PICTURE,
                    (SELECT COUNT(*) FROM LIKES L WHERE L.POST_ID = M.POST_ID)  LIKE_COUNT,
                    (SELECT COUNT(*) FROM COMMENTS C WHERE C.POST_ID = M.POST_ID)  COMMENT_COUNT,
                    IS_LIKED(M.POST_ID, :user_id) IS_LIKED
                FROM MERCHS M LEFT OUTER JOIN USERS U ON M.USER_ID = U.USER_ID
                ORDER BY TIMESTAMP DESC`;
    const binds={
        user_id : user_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}

async function getMerchsSortedByMostPopular(user_id){
    const sql =`SELECT M.*, U.FIRST_NAME|| ' '|| U.LAST_NAME USER_NAME, U.PROFILE_PICTURE,
                    (SELECT COUNT(*) FROM LIKES L WHERE L.POST_ID = M.POST_ID)  LIKE_COUNT,
                    (SELECT COUNT(*) FROM COMMENTS C WHERE C.POST_ID = M.POST_ID)  COMMENT_COUNT,
                    IS_LIKED(M.POST_ID, :user_id) IS_LIKED
                FROM MERCHS M LEFT OUTER JOIN USERS U ON M.USER_ID = U.USER_ID
                ORDER BY LIKE_COUNT+COMMENT_COUNT DESC, TIMESTAMP DESC`;
    const binds={
        user_id : user_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}

async function getMerchsSortedByPrice(user_id, order){
    let sql;
    if(order === 'desc')
        sql =`SELECT M.*, U.FIRST_NAME|| ' '|| U.LAST_NAME USER_NAME, U.PROFILE_PICTURE,
                        (SELECT COUNT(*) FROM LIKES L WHERE L.POST_ID = M.POST_ID)  LIKE_COUNT,
                        (SELECT COUNT(*) FROM COMMENTS C WHERE C.POST_ID = M.POST_ID)  COMMENT_COUNT,
                        IS_LIKED(M.POST_ID, :user_id) IS_LIKED
                    FROM MERCHS M LEFT OUTER JOIN USERS U ON M.USER_ID = U.USER_ID
                    ORDER BY M.PRICE DESC, TIMESTAMP DESC`;
    else 
        sql =`SELECT M.*, U.FIRST_NAME|| ' '|| U.LAST_NAME USER_NAME, U.PROFILE_PICTURE,
                    (SELECT COUNT(*) FROM LIKES L WHERE L.POST_ID = M.POST_ID)  LIKE_COUNT,
                    (SELECT COUNT(*) FROM COMMENTS C WHERE C.POST_ID = M.POST_ID)  COMMENT_COUNT,
                    IS_LIKED(M.POST_ID, :user_id) IS_LIKED
                FROM MERCHS M LEFT OUTER JOIN USERS U ON M.USER_ID = U.USER_ID
                ORDER BY M.PRICE ASC, TIMESTAMP DESC`;
    const binds={
        user_id : user_id,
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}

async function getMerchsByUserId(user_id, cur_user_id){
    const sql =`SELECT M.*, U.FIRST_NAME|| ' '|| U.LAST_NAME USER_NAME, U.PROFILE_PICTURE,
                    (SELECT COUNT(*) FROM LIKES L WHERE L.POST_ID = M.POST_ID)  LIKE_COUNT,
                    (SELECT COUNT(*) FROM COMMENTS C WHERE C.POST_ID = M.POST_ID)  COMMENT_COUNT,
                    IS_LIKED(M.POST_ID, :cur_user_id) IS_LIKED
                FROM MERCHS M LEFT OUTER JOIN USERS U ON M.USER_ID = U.USER_ID
                WHERE M.USER_ID = :user_id
                ORDER BY TIMESTAMP DESC`;
    const binds={
        user_id : user_id,
        cur_user_id: cur_user_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}

async function searchMerchs(user_id, query){
    const sql =`SELECT M.*, U.FIRST_NAME|| ' '|| U.LAST_NAME USER_NAME, U.PROFILE_PICTURE,
                    (SELECT COUNT(*) FROM LIKES L WHERE L.POST_ID = M.POST_ID)  LIKE_COUNT,
                    (SELECT COUNT(*) FROM COMMENTS C WHERE C.POST_ID = M.POST_ID)  COMMENT_COUNT,
                    IS_LIKED(M.POST_ID, :user_id) IS_LIKED
                FROM MERCHS M LEFT OUTER JOIN USERS U ON M.USER_ID = U.USER_ID
                WHERE ( U.FIRST_NAME|| ' '|| U.LAST_NAME LIKE UPPER('%'||:str||'%')
                    OR UPPER(M.PRODUCT_NAME) LIKE UPPER('%'||:str||'%')
                    OR UPPER(M.DESCRIPTION) LIKE UPPER('%'||:str||'%'))
                    AND PRICE >= :price_lower_bound AND PRICE<= :price_upper_bound
                ORDER BY TIMESTAMP DESC`;
    const binds={
        user_id : user_id,
        str : query.str,
        price_lower_bound : query.price_lower_bound,
        price_upper_bound : query.price_upper_bound
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}

async function getMerch(user_id, post_id){
    const sql =`SELECT M.*, U.FIRST_NAME|| ' '|| U.LAST_NAME USER_NAME, U.PROFILE_PICTURE,
                    (SELECT COUNT(*) FROM LIKES L WHERE L.POST_ID = M.POST_ID)  LIKE_COUNT,
                    (SELECT COUNT(*) FROM COMMENTS C WHERE C.POST_ID = M.POST_ID)  COMMENT_COUNT,
                    IS_LIKED(M.POST_ID, :user_id) IS_LIKED
                FROM MERCHS M LEFT OUTER JOIN USERS U ON M.USER_ID = U.USER_ID
                WHERE M.POST_ID = :post_id`;
    const binds={
        user_id: user_id,
        post_id : post_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result[0];
}

module.exports = {
    addMerch,
    updateMerch,
    deleteMerch,
    getMerchsSortedByNewest,
    getMerchsSortedByMostPopular,
    getMerchsSortedByPrice,
    getMerchsByUserId,
    searchMerchs,
    getMerch
}