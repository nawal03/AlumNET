const Database = require('../database');
const database = new Database();


async function addReunion(reunion, group_id){
    const sql = `BEGIN
                    ADD_REUNION(:group_id, :event_name, :event_date, :cover_photo, :description,
                        :latitude, :longitude, :platform, :fees, :batch, :department, :result);
                END;`;
    
    const binds={
        group_id : group_id,
        event_name : reunion.event_name,
        event_date : reunion.event_date,
        cover_photo : reunion.cover_photo,
        description : reunion.description,
        latitude : reunion.latitude,
        longitude : reunion.longitude,
        platform : reunion.platform,
        fees : reunion.fees,
        batch : reunion.batch,
        department : reunion.department,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function updateReunion(reunion, event_id){
    const sql = `BEGIN
                    UPDATE_REUNION(:event_id, :event_name, :event_date, :cover_photo, :description,
                        :latitude, :longitude, :platform, :fees, :batch, :department, :result);
                END;`;
    const binds={
        event_id : event_id,
        event_name : reunion.event_name,
        event_date : reunion.event_date,
        cover_photo : reunion.cover_photo,
        description : reunion.description,
        latitude : reunion.latitude,
        longitude : reunion.longitude,
        platform : reunion.platform,
        fees : reunion.fees,
        batch : reunion.batch,
        department : reunion.department,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function deleteReunion(event_id){
    const sql =`DELETE FROM EVENTS
                WHERE event_id = :event_id`;

    const binds={
        event_id : event_id
    }

    await database.execute(sql, binds);
    return binds;
}

async function getUpcomingReunions(user_id){
    const sql =`SELECT R.*, G.GROUP_NAME, G.COVER_PHOTO GROUP_COVER_PHOTO, G.ADMIN_ID GROUP_ADMIN_ID,
                    (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP WHERE EP.EVENT_ID = R.EVENT_ID)  GOING_COUNT,
                    IS_GOING(R.EVENT_ID, :user_id) IS_GOING
                FROM REUNIONS R JOIN GROUPS G ON R.GROUP_ID = G.GROUP_ID
                WHERE R.EVENT_DATE >= SYSDATE
                ORDER BY R.EVENT_DATE ASC`;
    const binds={
        user_id : user_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}


async function getMostPopularReunios(user_id){
    const sql =`SELECT R.*, G.GROUP_NAME, G.COVER_PHOTO GROUP_COVER_PHOTO, G.ADMIN_ID GROUP_ADMIN_ID,
                    (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP WHERE EP.EVENT_ID = R.EVENT_ID)  GOING_COUNT,
                    IS_GOING(R.EVENT_ID, :user_id) IS_GOING
                FROM REUNIONS R JOIN GROUPS G ON R.GROUP_ID = G.GROUP_ID
                WHERE R.EVENT_DATE >= SYSDATE
                ORDER BY GOING_COUNT DESC`;
    const binds={
        user_id : user_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}


async function getPastReunions(user_id){
    const sql =`SELECT R.*, G.GROUP_NAME, G.COVER_PHOTO GROUP_COVER_PHOTO, G.ADMIN_ID GROUP_ADMIN_ID,
                    (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP WHERE EP.EVENT_ID = R.EVENT_ID)  GOING_COUNT,
                    IS_GOING(R.EVENT_ID, :user_id) IS_GOING
                FROM REUNIONS R JOIN GROUPS G ON R.GROUP_ID = G.GROUP_ID
                WHERE R.EVENT_DATE < SYSDATE
                ORDER BY R.EVENT_DATE DESC`;
    const binds={
        user_id : user_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}


async function searchReunions(user_id, query){
    const sql =`SELECT R.*, G.GROUP_NAME, G.COVER_PHOTO GROUP_COVER_PHOTO, G.ADMIN_ID GROUP_ADMIN_ID,
                    (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP WHERE EP.EVENT_ID = R.EVENT_ID)  GOING_COUNT,
                    IS_GOING(R.EVENT_ID, :user_id) IS_GOING
                FROM REUNIONS R JOIN GROUPS G ON R.GROUP_ID = G.GROUP_ID
                WHERE (UPPER(G.GROUP_NAME) LIKE UPPER('%'||:str||'%')
                    OR UPPER(R.EVENT_NAME) LIKE UPPER('%'||:str||'%')
                    OR UPPER(R.DESCRIPTION) LIKE UPPER('%'||:str||'%')
                    OR UPPER(R.PLATFORM) LIKE UPPER('%'||:str||'%')
                    OR UPPER(R.BATCH) LIKE UPPER('%'||:str||'%')
                    OR UPPER(R.DEPARTMENT) LIKE UPPER('%'||:str||'%'))
                    AND IS_NEARBY(LATITUDE, LONGITUDE, :latitude, :longitude) = 'YES'
                    AND R.EVENT_DATE >= SYSDATE
                ORDER BY R.EVENT_DATE ASC`;
    const binds={
        user_id : user_id,
        str : query.str,
        latitude : query.latitude,
        longitude : query.longitude
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}

async function suggestedReunions(user_id){
    const sql =`SELECT R.*, G.GROUP_NAME, G.COVER_PHOTO GROUP_COVER_PHOTO, G.ADMIN_ID GROUP_ADMIN_ID,
                    (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP WHERE EP.EVENT_ID = R.EVENT_ID)  GOING_COUNT,
                    IS_GOING(R.EVENT_ID, :user_id) IS_GOING,
                    (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP JOIN FOLLOWS F ON EP.USER_ID = F.FOLLOWING
                                        WHERE EP.EVENT_ID = R.EVENT_ID
                                        AND F.FOLLOWER = :user_id)  EVENT_FOLLOWING_COUNT
                FROM REUNIONS R JOIN GROUPS G ON R.GROUP_ID = G.GROUP_ID
                WHERE R.EVENT_DATE >= SYSDATE AND
                        (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP JOIN FOLLOWS F ON EP.USER_ID = F.FOLLOWING
                        WHERE EP.EVENT_ID = R.EVENT_ID
                        AND F.FOLLOWER = :user_id)>0
                ORDER BY GOING_COUNT DESC`;
    const binds={
        user_id : user_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}

async function getReunion(user_id, event_id){
    const sql =`SELECT R.*, G.GROUP_NAME, G.COVER_PHOTO GROUP_COVER_PHOTO, G.ADMIN_ID GROUP_ADMIN_ID,
                    (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP WHERE EP.EVENT_ID = R.EVENT_ID)  GOING_COUNT,
                    IS_GOING(R.EVENT_ID, :user_id) IS_GOING
                FROM REUNIONS R JOIN GROUPS G ON R.GROUP_ID = G.GROUP_ID
                WHERE R.EVENT_ID = :event_id`;
    const binds={
        user_id: user_id,
        event_id : event_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result[0];
}

module.exports = {
    addReunion,
    updateReunion,
    deleteReunion,
    getUpcomingReunions,
    getMostPopularReunios,
    getPastReunions,
    searchReunions,
    suggestedReunions,
    getReunion
}