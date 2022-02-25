const res = require('express/lib/response');
const Database = require('../database');
const database = new Database();

async function getUnseenNotifications(user_id){
    const sql1 = `SELECT * FROM NOTIFICATION WHERE USER_ID = :user_id AND seen = 'NO'
                    ORDER BY TIMESTAMP DESC`;
    const sql = `UPDATE NOTIFICATION
                    SET seen = 'YES'
                    WHERE USER_ID = :user_id`;
    
    const binds={
        user_id : user_id
    }
    let result = (await database.execute(sql1, binds)).rows;
    await database.execute(sql, binds);
    return result;
}

async function getAllNotifications(user_id){
    const sql = `SELECT * FROM NOTIFICATION WHERE USER_ID = :user_id
                    ORDER BY TIMESTAMP DESC`
    
    const binds={
        user_id : user_id
    }
    let result = (await database.execute(sql, binds)).rows;
    return result;
}

async function getUnseenNotificationCount(user_id){
    const sql = `SELECT COUNT(*) COUNT FROM NOTIFICATION WHERE USER_ID = :user_id AND seen = 'NO'`;
    
    const binds={
        user_id : user_id
    }
    let result = (await database.execute(sql, binds)).rows;
    return result[0];
}




module.exports = {
    getUnseenNotifications,
    getAllNotifications,
    getUnseenNotificationCount
}