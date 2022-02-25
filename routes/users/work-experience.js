const router = require('express').Router();
const DB_work_experience = require('../../DB-codes/users/DB-work-experience-api');
const { verify, verifyAccessToWorkExperience } = require('../../middlewares/user-verification');

router.post('', verify, async (req, res) => {
    await DB_work_experience.addWorkExperience(req.body, req.user.USER_ID);
    res.redirect('/api/user');
});

router.get('/edit/:work_experience_id',verifyAccessToWorkExperience, async (req,res)=>{
    //get specific work_experience   
    res.send(await DB_work_experience.getWorkExperience(req.params.work_experience_id));
});

router.post('/edit/:work_experience_id',verifyAccessToWorkExperience, async (req,res)=>{
    //update work_experience
    const result = await DB_work_experience.updateWorkExperience(req.body, req.params.work_experience_id);
    //if (result.result != 'Update is successful')        
    res.redirect('/api/user');
});

router.post('/delete/:work_experience_id', verifyAccessToWorkExperience , async(req,res)=>{
    const result = await DB_work_experience.deleteWorkExperience(req.params.work_experience_id);
    res.redirect('/api/user');
});

router.get('', verify, async(req, res)=>{
    let user_id = req.user.USER_ID;
    if(req.query.user_id) user_id = req.query.user_id;
    res.send(await DB_work_experience.getWorkExperiences(user_id));
});

module.exports = router;