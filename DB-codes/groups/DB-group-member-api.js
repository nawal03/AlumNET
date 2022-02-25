const Database = require('../database');
const database = new Database();

async function addPendingMember(user_id, group_id){
    const sql = `BEGIN
                    ADD_PENDING_MEMBER(:user_id, :group_id, :result);
                END;`;
    
    const binds={
        user_id : user_id,
        group_id : group_id,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function processPendingMember(user_id, group_id, status){
    const sql =`BEGIN
                    PROCESS_PENDING_MEMBER(:user_id, :group_id, :status, :result);
                END;`;

    const binds={
        user_id : user_id,
        group_id : group_id,
        status : status,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function deleteGroupMember(user_id, group_id){
    const sql =`BEGIN
                    DELETE_GROUP_MEMBER(:user_id, :group_id, :result);
                END;`;
                
    const binds={
        user_id : user_id,
        group_id : group_id,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;     
}

async function getGroupMember(user_id, group_id){
    const sql =`SELECT * FROM GROUP_MEMBERS
                WHERE USER_ID = :user_id AND GROUP_ID = :group_id`;

    const binds={
        user_id : user_id,
        group_id : group_id,
    }
    const result = (await database.execute(sql, binds)).rows;
    return result[0];
}

async function getGroupMembers(group_id){
    const sql =`SELECT U.USER_ID, U.FIRST_NAME || ' ' || U.LAST_NAME NAME , U.PROFILE_PICTURE
                FROM GROUP_MEMBERS GM JOIN USERS U on GM.USER_ID = U.USER_ID
                WHERE GROUP_ID = :group_id`;

    const binds={
        group_id : group_id,
    }
    const result = (await database.execute(sql, binds)).rows;
    return result;
}

async function getPendingGroupMembers(group_id){
    const sql =`SELECT U.USER_ID, U.FIRST_NAME || ' ' || U.LAST_NAME NAME , U.PROFILE_PICTURE
                FROM PENDING_MEMBERS PM JOIN USERS U on PM.USER_ID = U.USER_ID
                WHERE GROUP_ID = :group_id`;
    const binds={
        group_id : group_id,
    }
    const result = (await database.execute(sql, binds)).rows;
    return result;
}

module.exports = {
    addPendingMember,
    processPendingMember,
    deleteGroupMember,
    getGroupMember,
    getGroupMembers,
    getPendingGroupMembers
}