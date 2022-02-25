const Database = require('../database');
const database = new Database();


async function addWorkExperience(experience, user_id){
    const sql = `BEGIN
                    ADD_WORK_EXPERIENCE(:user_id, :organization, :employment_type, :designation, :start_date, :end_date, :result);
                END;`;
    
    const binds={
        user_id : user_id,
        organization : experience.organization,
        employment_type : experience.employment_type,
        designation : experience.designation,
        start_date : experience.start_date,
        end_date : experience.end_date,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function updateWorkExperience(experience, work_experience_id){
    const sql = `BEGIN
                    UPDATE_WORK_EXPERIENCE(:work_experience_id, :organization, :employment_type, :designation, :start_date, :end_date, :result);
                END;`;
    
    const binds={
        work_experience_id : work_experience_id,
        organization : experience.organization,
        employment_type : experience.employment_type,
        designation : experience.designation,
        start_date : experience.start_date,
        end_date : experience.end_date,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function deleteWorkExperience(work_experience_id){
    const sql =`DELETE FROM work_experience
                WHERE work_experience_id = :work_experience_id`;

    const binds={
        work_experience_id : work_experience_id
    }
    await database.execute(sql, binds);
    return binds;
}

async function getWorkExperiences(user_id){
    const sql =`SELECT * FROM work_experience
                WHERE user_id = :user_id`;

    const binds={
        user_id : user_id,
    }

    return (await database.execute(sql, binds)).rows;
    
}

async function getWorkExperience(work_experience_id){
    const sql =`SELECT * FROM work_experience
                WHERE work_experience_id = :work_experience_id`;

    const binds={
        work_experience_id : work_experience_id,
    }
    
    result = (await database.execute(sql, binds)).rows;
    return result[0];
}

module.exports = {
    addWorkExperience,
    updateWorkExperience,
    deleteWorkExperience,
    getWorkExperiences,
    getWorkExperience
}