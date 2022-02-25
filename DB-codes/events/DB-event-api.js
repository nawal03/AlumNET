const Database = require('../database');
const database = new Database();

async function getEvent(event_id){
    const sql = `SELECT G.ADMIN_ID ADMIN_ID, E.* FROM EVENTS E JOIN CO_CURRICULARS CC on E.EVENT_ID = CC.EVENT_ID
                    JOIN GROUPS G ON G.GROUP_ID = CC.GROUP_ID
                    WHERE E.EVENT_ID = :event_id
                    UNION
                    SELECT G.ADMIN_ID ADMIN_ID, E.* FROM EVENTS E JOIN REUNIONS R on E.EVENT_ID = R.EVENT_ID
                    JOIN GROUPS G ON G.GROUP_ID = R.GROUP_ID
                    WHERE E.EVENT_ID = :event_id
                    UNION
                    SELECT G.ADMIN_ID ADMIN_ID, E.* FROM EVENTS E JOIN SEMINARS S on E.EVENT_ID = S.EVENT_ID
                    JOIN GROUPS G ON G.GROUP_ID = S.GROUP_ID
                    WHERE E.EVENT_ID = :event_id`;
    const binds={
        event_id : event_id
    }
    let result = (await database.execute(sql, binds)).rows;
    return result[0];
}

async function getGoingEvents(user_id){
    const sql = `SELECT CC.EVENT_NAME, CC.EVENT_DATE, CC.COVER_PHOTO, E.*, G.GROUP_NAME, G.GROUP_ID FROM EVENTS E JOIN CO_CURRICULARS CC on E.EVENT_ID = CC.EVENT_ID
                    JOIN GROUPS G ON G.GROUP_ID = CC.GROUP_ID
                    WHERE IS_GOING(E.EVENT_ID, :user_id) = 'YES'
                    AND CC.EVENT_DATE>=SYSDATE
                    UNION
                    SELECT R.EVENT_NAME, R.EVENT_DATE, R.COVER_PHOTO, E.*, G.GROUP_NAME, G.GROUP_ID FROM EVENTS E JOIN REUNIONS R on E.EVENT_ID = R.EVENT_ID
                    JOIN GROUPS G ON G.GROUP_ID = R.GROUP_ID
                    WHERE IS_GOING(E.EVENT_ID, :user_id) = 'YES'
                    AND R.EVENT_DATE>=SYSDATE
                    UNION
                    SELECT S.EVENT_NAME, S.EVENT_DATE, S.COVER_PHOTO, E.*, G.GROUP_NAME, G.GROUP_ID FROM EVENTS E JOIN SEMINARS S on E.EVENT_ID = S.EVENT_ID
                    JOIN GROUPS G ON G.GROUP_ID = S.GROUP_ID
                    WHERE IS_GOING(E.EVENT_ID, :user_id) = 'YES'
                    AND S.EVENT_DATE>=SYSDATE`;
    const binds={
        user_id : user_id
    }
    let result = (await database.execute(sql, binds)).rows;
    return result;
}

async function getManagedEvents(user_id){
    const sql = `SELECT CC.EVENT_NAME, CC.EVENT_DATE, CC.COVER_PHOTO, E.*, G.GROUP_NAME, G.GROUP_ID FROM EVENTS E JOIN CO_CURRICULARS CC on E.EVENT_ID = CC.EVENT_ID
                    JOIN GROUPS G ON G.GROUP_ID = CC.GROUP_ID
                    WHERE G.ADMIN_ID = :user_id
                    AND CC.EVENT_DATE>=SYSDATE
                    UNION
                    SELECT R.EVENT_NAME, R.EVENT_DATE, R.COVER_PHOTO, E.*, G.GROUP_NAME, G.GROUP_ID FROM EVENTS E JOIN REUNIONS R on E.EVENT_ID = R.EVENT_ID
                    JOIN GROUPS G ON G.GROUP_ID = R.GROUP_ID
                    WHERE G.ADMIN_ID = :user_id
                    AND R.EVENT_DATE>=SYSDATE
                    UNION
                    SELECT S.EVENT_NAME, S.EVENT_DATE, S.COVER_PHOTO, E.*, G.GROUP_NAME, G.GROUP_ID FROM EVENTS E JOIN SEMINARS S on E.EVENT_ID = S.EVENT_ID
                    JOIN GROUPS G ON G.GROUP_ID = S.GROUP_ID
                    WHERE G.ADMIN_ID = :user_id
                    AND S.EVENT_DATE>=SYSDATE`;
    const binds={
        user_id : user_id
    }
    let result = (await database.execute(sql, binds)).rows;
    return result;
}

async function getEventsByGroup(group_id){
    const sql = `SELECT CC.EVENT_NAME, CC.EVENT_DATE, CC.COVER_PHOTO, E.* FROM EVENTS E JOIN CO_CURRICULARS CC on E.EVENT_ID = CC.EVENT_ID
                    WHERE CC.GROUP_ID = :group_id
                    UNION
                    SELECT R.EVENT_NAME, R.EVENT_DATE, R.COVER_PHOTO, E.* FROM EVENTS E JOIN REUNIONS R on E.EVENT_ID = R.EVENT_ID
                    WHERE R.GROUP_ID = :group_id
                    UNION
                    SELECT S.EVENT_NAME, S.EVENT_DATE, S.COVER_PHOTO, E.* FROM EVENTS E JOIN SEMINARS S on E.EVENT_ID = S.EVENT_ID
                    WHERE S.GROUP_ID = :group_id`;
    const binds={
        group_id : group_id
    }
    let result = (await database.execute(sql, binds)).rows;
    return result;
}

async function addGoing(user_id, event_id){
    const sql = `INSERT INTO EVENT_PARTICIPANTS(USER_ID, EVENT_ID)
                    VALUES(:user_id, :event_id)`;
    
    const binds={
        user_id : user_id,
        event_id : event_id
    }
    await database.execute(sql, binds);
    return;
}

async function removeGoing(user_id, event_id){
    const sql = `DELETE FROM EVENT_PARTICIPANTS 
                    WHERE USER_ID = :user_id AND EVENT_ID = :event_id`;
    
    const binds={
        user_id : user_id,
        event_id : event_id
    }
    await database.execute(sql, binds);
    return;
}

async function getGoings(event_id){
    const sql = `SELECT U.USER_ID, U.FIRST_NAME|| ' '|| U.LAST_NAME USER_NAME, U.PROFILE_PICTURE 
                FROM EVENT_PARTICIPANTS EP JOIN USERS U on U.USER_ID = EP.USER_ID
                WHERE EVENT_ID= :event_id`;
    const binds = {
        event_id : event_id
    }
    const result = (await database.execute(sql, binds)).rows;
    return result;
}

async function addSchedule(event_id, schedule){
    const sql = `INSERT INTO SCHEDULES(SCHEDULE_ID, EVENT_ID, START_TIME, END_TIME, DESCRIPTION)
                    VALUES(SCHEDULE_SEQ.nextval, :event_id, TO_TIMESTAMP(:start_time, 'YYYY-MM-DD"T"HH24:MI:SS'), 
                        TO_TIMESTAMP(:end_time,'YYYY-MM-DD"T"HH24:MI:SS') ,:description)`;
    
    const binds={
        event_id : event_id,
        start_time : schedule.start_time,
        end_time : schedule.end_time,
        description : schedule.description
    }
    await database.execute(sql, binds);
    return;
}


async function updateSchedule(schedule_id, schedule){
    const sql = `UPDATE SCHEDULES
                    SET START_TIME = TO_TIMESTAMP(:start_time, 'YYYY-MM-DD"T"HH24:MI:SS'),
                    END_TIME = TO_TIMESTAMP(:end_time, 'YYYY-MM-DD"T"HH24:MI:SS'),
                    DESCRIPTION = :description
                WHERE SCHEDULE_ID = :schedule_id`;
    
    const binds={
        schedule_id : schedule_id,
        start_time : schedule.start_time,
        end_time : schedule.end_time,
        description : schedule.description
    }
    await database.execute(sql, binds);
    return;
}


async function deleteSchedule(schedule_id){
    const sql = `DELETE FROM SCHEDULES 
                    WHERE SCHEDULE_ID = :schedule_id`;
    
    const binds={
        schedule_id : schedule_id
    }
    await database.execute(sql, binds);
    return;
}

async function getSchedules(event_id){
    const sql = `SELECT *
                FROM SCHEDULES
                WHERE EVENT_ID= :event_id
                ORDER BY START_TIME ASC`
    const binds = {
        event_id : event_id
    }
    const result = (await database.execute(sql, binds)).rows;
    return result;
}

async function getSchedule(schedule_id){
    const sql = `SELECT S.*
                FROM SCHEDULES S JOIN EVENTS E ON S.EVENT_ID = E.EVENT_ID
                WHERE S.SCHEDULE_ID = :schedule_id`
    const binds = {
        schedule_id : schedule_id
    }
    const result = (await database.execute(sql, binds)).rows;
    return result[0];
}

module.exports = {
    getEvent,
    getGoingEvents,
    getManagedEvents,
    getEventsByGroup,
    addGoing,
    removeGoing,
    getGoings,
    addSchedule,
    updateSchedule,
    deleteSchedule,
    getSchedules,
    getSchedule
}