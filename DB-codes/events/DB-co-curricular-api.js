const Database = require('../database');
const database = new Database();


async function addCoCurricular(co_curricular, group_id){
    const sql = `BEGIN
                    ADD_CO_CURRICULAR(:group_id, :event_name, :event_date, :cover_photo, :description,
                        :latitude, :longitude, :platform, :fees, :available_for, :result);
                END;`;
    
    const binds={
        group_id : group_id,
        event_name : co_curricular.event_name,
        event_date : co_curricular.event_date,
        cover_photo : co_curricular.cover_photo,
        description : co_curricular.description,
        latitude : co_curricular.latitude,
        longitude : co_curricular.longitude,
        platform : co_curricular.platform,
        fees : co_curricular.fees,
        available_for : co_curricular.available_for,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function updateCoCurricular(co_curricular, event_id){
    const sql = `BEGIN
                    UPDATE_CO_CURRICULAR(:event_id, :event_name, :event_date, :cover_photo, :description,
                        :latitude, :longitude, :platform, :fees, :available_for, :result);
                END;`;
    const binds={
        event_id : event_id,
        event_name : co_curricular.event_name,
        event_date : co_curricular.event_date,
        cover_photo : co_curricular.cover_photo,
        description : co_curricular.description,
        latitude : co_curricular.latitude,
        longitude : co_curricular.longitude,
        platform : co_curricular.platform,
        fees : co_curricular.fees,
        available_for : co_curricular.available_for,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function deleteCoCurricular(event_id){
    const sql =`DELETE FROM EVENTS
                WHERE event_id = :event_id`;

    const binds={
        event_id : event_id
    }

    await database.execute(sql, binds);
    return binds;
}

async function getUpcomingCoCurriculars(user_id){
    const sql =`SELECT CC.*, G.GROUP_NAME, G.COVER_PHOTO GROUP_COVER_PHOTO, G.ADMIN_ID GROUP_ADMIN_ID,
                    (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP WHERE EP.EVENT_ID = CC.EVENT_ID)  GOING_COUNT,
                    IS_GOING(CC.EVENT_ID, :user_id) IS_GOING
                FROM CO_CURRICULARS CC JOIN GROUPS G ON CC.GROUP_ID = G.GROUP_ID
                WHERE CC.EVENT_DATE >= SYSDATE
                ORDER BY CC.EVENT_DATE ASC`;
    const binds={
        user_id : user_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}


async function getMostPopularCoCurriculars(user_id){
    const sql =`SELECT CC.*, G.GROUP_NAME, G.COVER_PHOTO GROUP_COVER_PHOTO, G.ADMIN_ID GROUP_ADMIN_ID,
                    (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP WHERE EP.EVENT_ID = CC.EVENT_ID)  GOING_COUNT,
                    IS_GOING(CC.EVENT_ID, :user_id) IS_GOING
                FROM CO_CURRICULARS CC JOIN GROUPS G ON CC.GROUP_ID = G.GROUP_ID
                WHERE CC.EVENT_DATE >= SYSDATE
                ORDER BY GOING_COUNT DESC`;
    const binds={
        user_id : user_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}


async function getPastCoCurriculars(user_id){
    const sql =`SELECT CC.*, G.GROUP_NAME, G.COVER_PHOTO GROUP_COVER_PHOTO, G.ADMIN_ID GROUP_ADMIN_ID,
                    (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP WHERE EP.EVENT_ID = CC.EVENT_ID)  GOING_COUNT,
                    IS_GOING(CC.EVENT_ID, :user_id) IS_GOING
                FROM CO_CURRICULARS CC JOIN GROUPS G ON CC.GROUP_ID = G.GROUP_ID
                WHERE CC.EVENT_DATE < SYSDATE
                ORDER BY CC.EVENT_DATE DESC`;
    const binds={
        user_id : user_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}


async function searchCoCurriculars(user_id, query){
    const sql =`SELECT CC.*, G.GROUP_NAME, G.COVER_PHOTO GROUP_COVER_PHOTO, G.ADMIN_ID GROUP_ADMIN_ID,
                    (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP WHERE EP.EVENT_ID = CC.EVENT_ID)  GOING_COUNT,
                    IS_GOING(CC.EVENT_ID, :user_id) IS_GOING
                FROM CO_CURRICULARS CC JOIN GROUPS G ON CC.GROUP_ID = G.GROUP_ID
                WHERE (UPPER(G.GROUP_NAME) LIKE UPPER('%'||:str||'%')
                    OR UPPER(CC.EVENT_NAME) LIKE UPPER('%'||:str||'%')
                    OR UPPER(CC.DESCRIPTION) LIKE UPPER('%'||:str||'%')
                    OR UPPER(CC.PLATFORM) LIKE UPPER('%'||:str||'%')
                    OR UPPER(CC.AVAILABLE_FOR) LIKE UPPER('%'||:str||'%'))
                    AND IS_NEARBY(LATITUDE, LONGITUDE, :latitude, :longitude) = 'YES'
                    AND CC.EVENT_DATE >= SYSDATE
                ORDER BY CC.EVENT_DATE ASC`;
    const binds={
        user_id : user_id,
        str : query.str,
        latitude : query.latitude,
        longitude : query.longitude
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}

async function suggestedCoCurriculars(user_id){
    const sql =`SELECT CC.*, G.GROUP_NAME, G.COVER_PHOTO GROUP_COVER_PHOTO, G.ADMIN_ID GROUP_ADMIN_ID,
                    (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP WHERE EP.EVENT_ID = CC.EVENT_ID)  GOING_COUNT,
                    IS_GOING(CC.EVENT_ID, :user_id) IS_GOING,
                    (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP JOIN FOLLOWS F ON EP.USER_ID = F.FOLLOWING
                                        WHERE EP.EVENT_ID = CC.EVENT_ID
                                        AND F.FOLLOWER = :user_id)  EVENT_FOLLOWING_COUNT
                FROM CO_CURRICULARS CC JOIN GROUPS G ON CC.GROUP_ID = G.GROUP_ID
                WHERE CC.EVENT_DATE >= SYSDATE AND
                        (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP JOIN FOLLOWS F ON EP.USER_ID = F.FOLLOWING
                        WHERE EP.EVENT_ID = CC.EVENT_ID
                        AND F.FOLLOWER = :user_id)>0
                ORDER BY GOING_COUNT DESC`;
    const binds={
        user_id : user_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}

async function getCoCurricular(user_id, event_id){
    const sql =`SELECT CC.*, G.GROUP_NAME, G.COVER_PHOTO GROUP_COVER_PHOTO, G.ADMIN_ID GROUP_ADMIN_ID,
                    (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP WHERE EP.EVENT_ID = CC.EVENT_ID)  GOING_COUNT,
                    IS_GOING(CC.EVENT_ID, :user_id) IS_GOING
                FROM CO_CURRICULARS CC JOIN GROUPS G ON CC.GROUP_ID = G.GROUP_ID
                WHERE CC.EVENT_ID = :event_id`;
    const binds={
        user_id: user_id,
        event_id : event_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result[0];
}

module.exports = {
    addCoCurricular,
    updateCoCurricular,
    deleteCoCurricular,
    getUpcomingCoCurriculars,
    getMostPopularCoCurriculars,
    getPastCoCurriculars,
    searchCoCurriculars,
    suggestedCoCurriculars,
    getCoCurricular
}