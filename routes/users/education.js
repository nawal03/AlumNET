const router = require('express').Router();
const DB_education = require('../../DB-codes/users/DB-education-api');
const { verify, verifyAccessToEducation } = require('../../middlewares/user-verification');

router.post('',verify, async (req,res)=>{
    await DB_education.addEducation(req.body, req.user.USER_ID);
    res.redirect('/api/user');
});

router.get('/edit/:education_id',verifyAccessToEducation, async (req,res)=>{
    //get specific education   
    res.send(await DB_education.getEducation(req.params.education_id));
});

router.post('/edit/:education_id',verifyAccessToEducation, async (req,res)=>{
    //update interest
    const result = await DB_education.updateEducation(req.body, req.params.education_id);
    res.redirect('/api/user');
});

router.post('/delete/:education_id', verifyAccessToEducation , async(req,res)=>{
    await DB_education.deleteEducation(req.params.education_id);
    res.redirect('/api/user');
});

router.get('', verify, async(req, res)=>{
    let user_id = req.user.USER_ID;
    if(req.query.user_id) user_id = req.query.user_id;
    res.send(await DB_education.getEducations(user_id));
});

module.exports = router;