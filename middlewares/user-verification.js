require('dotenv').config();
const jwt = require('jsonwebtoken');
const DB_user = require('../DB-codes/users/DB-user-api');
const DB_interest = require('../DB-codes/users/DB-interest-api');
const DB_skill = require('../DB-codes/users/DB-skill-api');
const DB_research_interest = require('../DB-codes/users/DB-research-interest-api');
const DB_education = require('../DB-codes/users/DB-education-api');
const DB_work_experience = require('../DB-codes/users/DB-work-experience-api');
const DB_achievement = require('../DB-codes/users/DB-achievement-api');
const DB_publication = require('../DB-codes/users/DB-publication-api');


//middleware function to verify the jwt token and find the user who is currently logged in
async function verify(req,res,next){
    const cookie  = req.header('cookie');
    if(!cookie) return res.redirect('/api/auth/login?status=Access Denied');
    const token = cookie.slice(11);
    try{
        const verified = jwt.verify(token, process.env.JWT_TOKEN_HELPER);
        req.user =await DB_user.getUserById(verified.user_id);
        next();

    }catch(err){
        res.status(400).send('Invalid Token');
    }
}

async function verifyAccessToInterest(req,res,next){
    const cookie  = req.header('cookie');
    if(!cookie) return res.redirect('/api/auth/login?status=Access Denied');
    const token = cookie.slice(11);
    try{
        const verified = jwt.verify(token, process.env.JWT_TOKEN_HELPER);
        req.user =await DB_user.getUserById(verified.user_id);

        const interest = await DB_interest.getInterest(req.params.interest_id);
        if(interest.USER_ID != req.user.USER_ID) return res.redirect('/api/auth/login?status=Access Denied');
        
        next();

    }catch(err){
        res.status(400).send('Invalid Token');
    }
}

async function verifyAccessToResearchInterest(req,res,next){
    const cookie  = req.header('cookie');
    if(!cookie) return res.redirect('/api/auth/login?status=Access Denied');
    const token = cookie.slice(11);
    try{
        const verified = jwt.verify(token, process.env.JWT_TOKEN_HELPER);
        req.user =await DB_user.getUserById(verified.user_id);

        const research_interest = await DB_research_interest.getResearchInterest(req.params.research_interest_id);
        if(research_interest.USER_ID != req.user.USER_ID) return res.redirect('/api/auth/login?status=Access Denied');
        
        next();

    }catch(err){
        res.status(400).send('Invalid Token');
    }
}

async function verifyAccessToSkill(req,res,next){
    const cookie  = req.header('cookie');
    if(!cookie) return res.redirect('/api/auth/login?status=Access Denied');
    const token = cookie.slice(11);
    try{
        const verified = jwt.verify(token, process.env.JWT_TOKEN_HELPER);
        req.user =await DB_user.getUserById(verified.user_id);

        const skill = await DB_skill.getSkill(req.params.skill_id);
        if(skill.USER_ID != req.user.USER_ID) return res.redirect('/api/auth/login?status=Access Denied');
        
        next();

    }catch(err){
        res.status(400).send('Invalid Token');
    }
}

async function verifyAccessToEducation(req,res,next){
    const cookie  = req.header('cookie');
    if(!cookie) return res.redirect('/api/auth/login?status=Access Denied');
    const token = cookie.slice(11);
    try{
        const verified = jwt.verify(token, process.env.JWT_TOKEN_HELPER);
        req.user =await DB_user.getUserById(verified.user_id);

        const education = await DB_education.getEducation(req.params.education_id);
        if(education.USER_ID != req.user.USER_ID) return res.redirect('/api/auth/login?status=Access Denied');
        
        next();

    }catch(err){
        res.status(400).send('Invalid Token');
    }
}

async function verifyAccessToWorkExperience(req,res,next){
    const cookie  = req.header('cookie');
    if(!cookie) return res.redirect('/api/auth/login?status=Access Denied');
    const token = cookie.slice(11);
    try{
        const verified = jwt.verify(token, process.env.JWT_TOKEN_HELPER);
        req.user =await DB_user.getUserById(verified.user_id);
        
        const experience = await DB_work_experience.getWorkExperience(req.params.work_experience_id);
        
        if(experience.USER_ID != req.user.USER_ID) return res.redirect('/api/auth/login?status=Access Denied');
        
        next();

    }catch(err){
        res.status(400).send('Invalid Token');
    }
}

async function verifyAccessToAchievement(req,res,next){
    const cookie  = req.header('cookie');
    if(!cookie) return res.redirect('/api/auth/login?status=Access Denied');
    const token = cookie.slice(11);
    try{
        const verified = jwt.verify(token, process.env.JWT_TOKEN_HELPER);
        req.user =await DB_user.getUserById(verified.user_id);
        
        const achievement = await DB_achievement.getAchievement(req.params.achievement_id);
        
        if(achievement.USER_ID != req.user.USER_ID) return res.redirect('/api/auth/login?status=Access Denied');
        
        next();

    }catch(err){
        res.status(400).send('Invalid Token');
    }
}

async function verifyAccessToPublication(req,res,next){
    const cookie  = req.header('cookie');
    if(!cookie) return res.redirect('/api/auth/login?status=Access Denied');
    const token = cookie.slice(11);
    try{
        const verified = jwt.verify(token, process.env.JWT_TOKEN_HELPER);
        req.user =await DB_user.getUserById(verified.user_id);
        
        const publication = await DB_publication.getPublication(req.params.publication_id);
        
        if(publication.USER_ID != req.user.USER_ID) return res.redirect('/api/auth/login?status=Access Denied');
        
        next();

    }catch(err){
        res.status(400).send('Invalid Token');
    }
}

module.exports = {
    verify,
    verifyAccessToInterest,
    verifyAccessToResearchInterest,
    verifyAccessToSkill,
    verifyAccessToEducation,
    verifyAccessToWorkExperience,
    verifyAccessToAchievement,
    verifyAccessToPublication
}