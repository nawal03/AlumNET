const Database = require('../database');
const database = new Database();


async function addEducation(education, user_id){
    const sql = `BEGIN
                    ADD_EDUCATION(:user_id, :institute, :field_of_study, :degree, :grade, :start_date, :end_date, :result);
                END;`;
    
    const binds={
        user_id : user_id,
        institute : education.institute,
        field_of_study : education.field_of_study,
        degree : education.degree,
        grade : education.grade,
        start_date : education.start_date,
        end_date : education.end_date,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function updateEducation(education, education_id){
    const sql = `BEGIN
                    UPDATE_EDUCATION(:education_id, :institute, :field_of_study, :degree, :grade, :start_date, :end_date, :result);
                END;`;
    
    const binds={
        education_id : education_id,
        institute : education.institute,
        field_of_study : education.field_of_study,
        degree : education.degree,
        grade : education.grade,
        start_date : education.start_date,
        end_date : education.end_date,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function deleteEducation(education_id){
    const sql =`DELETE FROM education
                WHERE education_id = :education_id`;

    const binds={
        education_id : education_id
    }
    await database.execute(sql, binds);
    return binds;
}

async function getEducations(user_id){
    const sql =`SELECT * FROM education
                WHERE user_id = :user_id`;

    const binds={
        user_id : user_id,
    }

    return (await database.execute(sql, binds)).rows;
    
}

async function getEducation(education_id){
    const sql =`SELECT * FROM education
                WHERE education_id = :education_id`;

    const binds={
        education_id : education_id,
    }

    result = (await database.execute(sql, binds)).rows;
    return result[0];
}

module.exports = {
    addEducation,
    updateEducation,
    deleteEducation,
    getEducations,
    getEducation
}