const Database = require('../database');
const database = new Database();

async function addResearchInterest(research_interest, user_id){
    const sql =`BEGIN
                    ADD_RESEARCH_INTEREST(:research_interest, :user_id, :result);
                END;`;

    const binds={
        user_id : user_id,
        research_interest : research_interest,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function updateResearchInterest(research_interest, research_interest_id){
    const sql =`BEGIN
                    UPDATE_RESEARCH_INTEREST(:research_interest_id, :research_interest, :result);
                END;`;

    const binds={
        research_interest : research_interest,
        research_interest_id : research_interest_id,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function deleteResearchInterest(research_interest_id){
    const sql =`DELETE FROM research_interests
                WHERE research_interest_id = :research_interest_id`;

    const binds={
        research_interest_id : research_interest_id
    }
    await database.execute(sql, binds);
    return binds;
}

async function getResearchInterests(user_id){
    const sql =`SELECT * FROM research_interests
                WHERE user_id = :user_id`;

    const binds={
        user_id : user_id,
    }

    return (await database.execute(sql, binds)).rows;
    
}

async function getResearchInterest(research_interest_id){
    const sql =`SELECT * FROM research_interests
                WHERE research_interest_id = :research_interest_id`;

    const binds={
        research_interest_id : research_interest_id,
    }

    result = (await database.execute(sql, binds)).rows;
    return result[0];
}

module.exports = {
    addResearchInterest,
    updateResearchInterest,
    deleteResearchInterest,
    getResearchInterests,
    getResearchInterest
}