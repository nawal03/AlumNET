require('dotenv').config();
const jwt = require('jsonwebtoken');
const DB_user = require('../DB-codes/users/DB-user-api');
const DB_event = require('../DB-codes/events/DB-event-api');

async function verifyAccessToEvent(req,res,next){
    const cookie  = req.header('cookie');
    if(!cookie) return res.redirect('/api/auth/login?status=Access Denied');
    const token = cookie.slice(11);
    try{
        const verified = jwt.verify(token, process.env.JWT_TOKEN_HELPER);
        req.user =await DB_user.getUserById(verified.user_id);
        const event = await DB_event.getEvent(req.params.event_id);
        if(event.ADMIN_ID != req.user.USER_ID) return res.redirect('/api/auth/login?status=Access Denied');
        
        next();

    }catch(err){
        res.status(400).send('Invalid Token');
    }
}

async function verifyAccessToSchedule(req,res,next){
    const cookie  = req.header('cookie');
    if(!cookie) return res.redirect('/api/auth/login?status=Access Denied');
    const token = cookie.slice(11);
    try{
        const verified = jwt.verify(token, process.env.JWT_TOKEN_HELPER);
        req.user =await DB_user.getUserById(verified.user_id);
        const schedule = await DB_event.getSchedule(req.params.schedule_id);
        const event = await DB_event.getEvent(schedule.EVENT_ID);
        if(event.ADMIN_ID != req.user.USER_ID) return res.redirect('/api/auth/login?status=Access Denied');
        
        next();

    }catch(err){
        res.status(400).send('Invalid Token');
    }
}


module.exports = {
    verifyAccessToEvent,
    verifyAccessToSchedule
}