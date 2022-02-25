require('dotenv').config();
const jwt = require('jsonwebtoken');
const DB_user = require('../DB-codes/users/DB-user-api');
const DB_group = require('../DB-codes/groups/DB-group-api');
const DB_group_member = require('../DB-codes/groups/DB-group-member-api');

async function verifyAdmin(req,res,next){
    const cookie  = req.header('cookie');
    if(!cookie) return res.redirect('/api/auth/login?status=Access Denied');
    const token = cookie.slice(11);
    try{
        const verified = jwt.verify(token, process.env.JWT_TOKEN_HELPER);
        req.user =await DB_user.getUserById(verified.user_id);
        const group = await DB_group.getGroup(req.params.group_id, req.user.USER_ID);
        if(group.ADMIN_ID != req.user.USER_ID) return res.redirect('/api/auth/login?status=Access Denied');
        next();

    }catch(err){
        res.status(400).send('Invalid Token');
    }
}

async function verifyGroupMember(req,res,next){
    const cookie  = req.header('cookie');
    if(!cookie) return res.redirect('/api/auth/login?status=Access Denied');
    const token = cookie.slice(11);
    try{
        const verified = jwt.verify(token, process.env.JWT_TOKEN_HELPER);
        req.user =await DB_user.getUserById(verified.user_id);

        const group_member = await DB_group_member.getGroupMember(req.user.USER_ID,req.params.group_id);
        if(group_member === undefined) return res.redirect('/api/auth/login?status=Access Denied');
        
        next();

    }catch(err){
        res.status(400).send('Invalid Token');
    }
}


module.exports = {
    verifyAdmin,
    verifyGroupMember
}