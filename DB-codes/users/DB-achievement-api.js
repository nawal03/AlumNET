const Database = require('../database');
const database = new Database();


async function addAchievement(achievement, user_id){
    const sql = `BEGIN
                    ADD_ACHIEVEMENT(:user_id, :achievement_name, :achievement_date, :position, :organized_by, :result);
                END;`;
    
    const binds={
        user_id : user_id,
        achievement_name : achievement.achievement_name,
        achievement_date : achievement.achievement_date,
        position : achievement.position,
        organized_by : achievement.organized_by,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function updateAchievement(achievement, achievement_id){
    const sql = `BEGIN
                    UPDATE_ACHIEVEMENT(:achievement_id, :achievement_name, :achievement_date, :position, :organized_by, :result);
                END;`;
    const binds={
        achievement_id : achievement_id,
        achievement_name : achievement.achievement_name,
        achievement_date : achievement.achievement_date,
        position : achievement.position,
        organized_by : achievement.organized_by,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function deleteAchievement(achievement_id){
    const sql =`DELETE FROM achievements
                WHERE achievement_id = :achievement_id`;

    const binds={
        achievement_id : achievement_id
    }
    await database.execute(sql, binds);
    return binds;
}

async function getAchievements(user_id){
    const sql =`SELECT * FROM achievements
                WHERE user_id = :user_id`;

    const binds={
        user_id : user_id,
    }

    return (await database.execute(sql, binds)).rows;
    
}

async function getAchievement(achievement_id){
    const sql =`SELECT * FROM achievements
                WHERE achievement_id = :achievement_id`;

    const binds={
        achievement_id : achievement_id,
    }

    result = (await database.execute(sql, binds)).rows;
    return result[0];
}

module.exports = {
    addAchievement,
    updateAchievement,
    deleteAchievement,
    getAchievements,
    getAchievement
}