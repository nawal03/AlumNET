const Database = require('../database');
const database = new Database();

async function addInterest(interest, user_id){
    const sql =`BEGIN
                    ADD_INTEREST(:interest, :user_id, :result);
                END;`;

    const binds={
        user_id : user_id,
        interest : interest,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function updateInterest(interest, interest_id){
    const sql =`BEGIN
                    UPDATE_INTEREST(:interest_id, :interest, :result);
                END;`;

    const binds={
        interest : interest,
        interest_id : interest_id,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function deleteInterest(interest_id){
    const sql =`DELETE FROM interests
                WHERE interest_id = :interest_id`;

    const binds={
        interest_id : interest_id
    }
    await database.execute(sql, binds);
    return binds;
}

async function getInterests(user_id){
    const sql =`SELECT * FROM interests
                WHERE user_id = :user_id`;

    const binds={
        user_id : user_id,
    }

    return (await database.execute(sql, binds)).rows;
    
}

async function getInterest(interest_id){
    const sql =`SELECT * FROM interests
                WHERE interest_id = :interest_id`;

    const binds={
        interest_id : interest_id,
    }

    result = (await database.execute(sql, binds)).rows;
    return result[0];
}

module.exports = {
    addInterest,
    updateInterest,
    deleteInterest,
    getInterests,
    getInterest
}