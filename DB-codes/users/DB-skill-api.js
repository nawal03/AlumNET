const Database = require('../database');
const database = new Database();

async function addSkill(skill, user_id){
    const sql =`BEGIN
                    ADD_SKILL(:skill, :user_id, :result);
                END;`;

    const binds={
        user_id : user_id,
        skill : skill,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function updateSkill(skill, skill_id){
    const sql =`BEGIN
                    UPDATE_SKILL(:skill_id, :skill, :result);
                END;`;

    const binds={
        skill : skill,
        skill_id : skill_id,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function deleteSkill(skill_id){
    const sql =`DELETE FROM skills
                WHERE skill_id = :skill_id`;

    const binds={
        skill_id : skill_id
    }
    await database.execute(sql, binds);
    return binds;
}

async function getSkills(user_id){
    const sql =`SELECT * FROM skills
                WHERE user_id = :user_id`;

    const binds={
        user_id : user_id,
    }

    return (await database.execute(sql, binds)).rows;
    
}

async function getSkill(skill_id){
    const sql =`SELECT * FROM skills
                WHERE skill_id = :skill_id`;

    const binds={
        skill_id : skill_id,
    }

    result = (await database.execute(sql, binds)).rows;
    return result[0];
}


module.exports = {
    addSkill,
    updateSkill,
    deleteSkill,
    getSkills,
    getSkill
}