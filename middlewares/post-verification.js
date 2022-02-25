require('dotenv').config();
const jwt = require('jsonwebtoken');
const DB_user = require('../DB-codes/users/DB-user-api');
const DB_post= require('../DB-codes/posts/DB-post-api');
const DB_group_post = require ('../DB-codes/posts/DB-group-post-api');
const DB_group = require('../DB-codes/groups/DB-group-api');
const DB_group_member = require('../DB-codes/groups/DB-group-member-api');

async function verifyAccessToUpdatePost(req,res,next){
    const cookie  = req.header('cookie');
    if(!cookie) return res.redirect('/api/auth/login?status=Access Denied');
    const token = cookie.slice(11);
    try{
        const verified = jwt.verify(token, process.env.JWT_TOKEN_HELPER);
        req.user =await DB_user.getUserById(verified.user_id);
    
        const post = await DB_post.getPost(req.params.post_id);
        if(post.USER_ID != req.user.USER_ID) return res.redirect('/api/auth/login?status=Access Denied');
        
        next();

    }catch(err){
        res.status(400).send('Invalid Token');
    }
}

async function verifyAccessToDeletePost(req,res,next){
    const cookie  = req.header('cookie');
    if(!cookie) return res.redirect('/api/auth/login?status=Access Denied');
    const token = cookie.slice(11);
    try{
        const verified = jwt.verify(token, process.env.JWT_TOKEN_HELPER);
        req.user =await DB_user.getUserById(verified.user_id);
    
        const post = await DB_post.getPost(req.params.post_id);

        if(post.POST_TYPE === 'group_post'){
            const group_post = await DB_group_post.getGroupPost(req.user.USER_ID, req.params.post_id);
            const group = await DB_group.getGroup(group_post.GROUP_ID, req.user.USER_ID);
            if(post.USER_ID != req.user.USER_ID && group.ADMIN_ID != req.user.USER_ID)return res.redirect('/api/auth/login?status=Access Denied');
        }
        else{
            if(post.USER_ID != req.user.USER_ID) return res.redirect('/api/auth/login?status=Access Denied');
        }
        
        next();

    }catch(err){
        res.status(400).send('Invalid Token');
    }
}

async function verifyAccessToLikeAndComment(req,res,next){
    const cookie  = req.header('cookie');
    if(!cookie) return res.redirect('/api/auth/login?status=Access Denied');
    const token = cookie.slice(11);
    try{
        const verified = jwt.verify(token, process.env.JWT_TOKEN_HELPER);
        req.user =await DB_user.getUserById(verified.user_id);
        const post = await DB_post.getPost(req.params.post_id);
        if(post.POST_TYPE === 'group_post'){
            const group_post = await DB_group_post.getGroupPost(req.user.USER_ID, req.params.post_id);
            const group_member = await DB_group_member.getGroupMember(req.user.USER_ID,group_post.GROUP_ID);
            if(group_member === undefined) return res.redirect('/api/auth/login?status=Access Denied');
        }
        next();

    }catch(err){
        res.status(400).send('Invalid Token');
    }
}

async function verifyAccessToUpdateComment(req,res,next){
    const cookie  = req.header('cookie');
    if(!cookie) return res.redirect('/api/auth/login?status=Access Denied');
    const token = cookie.slice(11);
    try{
        const verified = jwt.verify(token, process.env.JWT_TOKEN_HELPER);
        req.user =await DB_user.getUserById(verified.user_id);
    
        const comment = await DB_post.getComment(req.params.comment_id);
        if(comment.USER_ID != req.user.USER_ID) return res.redirect('/api/auth/login?status=Access Denied');
        
        next();

    }catch(err){
        res.status(400).send('Invalid Token');
    }
}

async function verifyAccessToDeleteComment(req,res,next){
    const cookie  = req.header('cookie');
    if(!cookie) return res.redirect('/api/auth/login?status=Access Denied');
    const token = cookie.slice(11);
    try{
        const verified = jwt.verify(token, process.env.JWT_TOKEN_HELPER);
        req.user =await DB_user.getUserById(verified.user_id);
        
        const comment = await DB_post.getComment(req.params.comment_id);
        const post = await DB_post.getPost(comment.POST_ID);

        if(post.POST_TYPE === 'group_post'){
            const group_post = await DB_group_post.getGroupPost(req.user.USER_ID, post.POST_ID);
            const group = await DB_group.getGroup(group_post.GROUP_ID, req.user.USER_ID);
            if(comment.USER_ID != req.user.USER_ID && post.USER_ID != req.user.USER_ID && group.ADMIN_ID != req.user.USER_ID)
                    return res.redirect('/api/auth/login?status=Access Denied');
        }
        else{
            if(comment.USER_ID != req.user.USER_ID && post.USER_ID != req.user.USER_ID) return res.redirect('/api/auth/login?status=Access Denied');
        }
        next();

    }catch(err){
        console.log(err);
        res.status(400).send('Invalid Token');
    }
}


module.exports = {
    verifyAccessToUpdatePost,
    verifyAccessToDeletePost,
    verifyAccessToLikeAndComment,
    verifyAccessToUpdateComment,
    verifyAccessToDeleteComment
}