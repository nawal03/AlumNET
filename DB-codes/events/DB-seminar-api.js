const Database = require('../database');
const database = new Database();


async function addSeminar(seminar, group_id){
    const sql = `BEGIN
                    ADD_SEMINAR(:group_id, :event_name, :event_date, :cover_photo, :description,
                        :latitude, :longitude, :platform, :fees, :topic, :special_guests, :available_for, :result);
                END;`;
    
    const binds={
        group_id : group_id,
        event_name : seminar.event_name,
        event_date : seminar.event_date,
        cover_photo : seminar.cover_photo,
        description : seminar.description,
        latitude : seminar.latitude,
        longitude : seminar.longitude,
        platform : seminar.platform,
        fees : seminar.fees,
        topic : seminar.topic,
        special_guests : seminar.special_guests,
        available_for : seminar.available_for,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function updateSeminar(seminar, event_id){
    const sql = `BEGIN
                    UPDATE_SEMINAR(:event_id, :event_name, :event_date, :cover_photo, :description,
                        :latitude, :longitude, :platform, :fees, :topic, :special_guests, :available_for, :result);
                END;`;
    const binds={
        event_id : event_id,
        event_name : seminar.event_name,
        event_date : seminar.event_date,
        cover_photo : seminar.cover_photo,
        description : seminar.description,
        latitude : seminar.latitude,
        longitude : seminar.longitude,
        platform : seminar.platform,
        fees : seminar.fees,
        topic : seminar.topic,
        special_guests : seminar.special_guests,
        available_for : seminar.available_for,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function deleteSeminar(event_id){
    const sql =`DELETE FROM EVENTS
                WHERE event_id = :event_id`;

    const binds={
        event_id : event_id
    }

    await database.execute(sql, binds);
    return binds;
}

async function getUpcomingSeminar(user_id){
    const sql =`SELECT S.*, G.GROUP_NAME, G.COVER_PHOTO GROUP_COVER_PHOTO, G.ADMIN_ID GROUP_ADMIN_ID,
                    (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP WHERE EP.EVENT_ID = S.EVENT_ID)  GOING_COUNT,
                    IS_GOING(S.EVENT_ID, :user_id) IS_GOING
                FROM SEMINARS S JOIN GROUPS G ON S.GROUP_ID = G.GROUP_ID
                WHERE S.EVENT_DATE >= SYSDATE
                ORDER BY S.EVENT_DATE ASC`;
    const binds={
        user_id : user_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}


async function getMostPopularSeminar(user_id){
    const sql =`SELECT S.*, G.GROUP_NAME, G.COVER_PHOTO GROUP_COVER_PHOTO, G.ADMIN_ID GROUP_ADMIN_ID,
                    (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP WHERE EP.EVENT_ID = S.EVENT_ID)  GOING_COUNT,
                    IS_GOING(S.EVENT_ID, :user_id) IS_GOING
                FROM SEMINARS S JOIN GROUPS G ON S.GROUP_ID = G.GROUP_ID
                WHERE S.EVENT_DATE >= SYSDATE
                ORDER BY GOING_COUNT DESC`;
    const binds={
        user_id : user_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}


async function getPastSeminar(user_id){
    const sql =`SELECT S.*, G.GROUP_NAME, G.COVER_PHOTO GROUP_COVER_PHOTO, G.ADMIN_ID GROUP_ADMIN_ID,
                    (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP WHERE EP.EVENT_ID = S.EVENT_ID)  GOING_COUNT,
                    IS_GOING(S.EVENT_ID, :user_id) IS_GOING
                FROM SEMINARS S JOIN GROUPS G ON S.GROUP_ID = G.GROUP_ID
                WHERE S.EVENT_DATE < SYSDATE
                ORDER BY S.EVENT_DATE DESC`;
    const binds={
        user_id : user_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}


async function searchSeminar(user_id, query){
    const sql =`SELECT S.*, G.GROUP_NAME, G.COVER_PHOTO GROUP_COVER_PHOTO, G.ADMIN_ID GROUP_ADMIN_ID,
                    (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP WHERE EP.EVENT_ID = S.EVENT_ID)  GOING_COUNT,
                    IS_GOING(S.EVENT_ID, :user_id) IS_GOING
                FROM SEMINARS S JOIN GROUPS G ON S.GROUP_ID = G.GROUP_ID
                WHERE (UPPER(G.GROUP_NAME) LIKE UPPER('%'||:str||'%')
                    OR UPPER(S.EVENT_NAME) LIKE UPPER('%'||:str||'%')
                    OR UPPER(S.DESCRIPTION) LIKE UPPER('%'||:str||'%')
                    OR UPPER(S.PLATFORM) LIKE UPPER('%'||:str||'%')
                    OR UPPER(S.TOPIC) LIKE UPPER('%'||:str||'%')
                    OR UPPER(S.SPECIAL_GUESTS) LIKE UPPER('%'||:str||'%')
                    OR UPPER(S.AVAILABLE_FOR) LIKE UPPER('%'||:str||'%'))
                    AND IS_NEARBY(LATITUDE, LONGITUDE, :latitude, :longitude) = 'YES'
                    AND S.EVENT_DATE >= SYSDATE
                ORDER BY S.EVENT_DATE ASC`;
    const binds={
        user_id : user_id,
        str : query.str,
        latitude : query.latitude,
        longitude : query.longitude
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}

async function suggestedSeminar(user_id){
    const sql =`SELECT S.*, G.GROUP_NAME, G.COVER_PHOTO GROUP_COVER_PHOTO, G.ADMIN_ID GROUP_ADMIN_ID,
                    (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP WHERE EP.EVENT_ID = S.EVENT_ID)  GOING_COUNT,
                    IS_GOING(S.EVENT_ID, :user_id) IS_GOING,
                    (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP JOIN FOLLOWS F ON EP.USER_ID = F.FOLLOWING
                                        WHERE EP.EVENT_ID = S.EVENT_ID
                                        AND F.FOLLOWER = :user_id)  EVENT_FOLLOWING_COUNT
                FROM SEMINARS S JOIN GROUPS G ON S.GROUP_ID = G.GROUP_ID
                WHERE S.EVENT_DATE >= SYSDATE AND
                        (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP JOIN FOLLOWS F ON EP.USER_ID = F.FOLLOWING
                        WHERE EP.EVENT_ID = S.EVENT_ID
                        AND F.FOLLOWER = :user_id)>0
                ORDER BY GOING_COUNT DESC`;
    const binds={
        user_id : user_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result;
}

async function getSeminar(user_id, event_id){
    const sql =`SELECT S.*, G.GROUP_NAME, G.COVER_PHOTO GROUP_COVER_PHOTO, G.ADMIN_ID GROUP_ADMIN_ID,
                    (SELECT COUNT(*) FROM EVENT_PARTICIPANTS EP WHERE EP.EVENT_ID = S.EVENT_ID)  GOING_COUNT,
                    IS_GOING(S.EVENT_ID, :user_id) IS_GOING
                FROM SEMINARS S JOIN GROUPS G ON S.GROUP_ID = G.GROUP_ID
                WHERE S.EVENT_ID = :event_id`;
    const binds={
        user_id: user_id,
        event_id : event_id
    }
    result = (await database.execute(sql, binds)).rows;
    return result[0];
}

module.exports = {
    addSeminar,
    updateSeminar,
    deleteSeminar,
    getUpcomingSeminar,
    getMostPopularSeminar,
    getPastSeminar,
    searchSeminar,
    suggestedSeminar,
    getSeminar
}