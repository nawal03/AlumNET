const router = require('express').Router();
const DB_skill = require('../../DB-codes/users/DB-skill-api');
const { verify, verifyAccessToSkill } = require('../../middlewares/user-verification');


router.post('',verify, async (req,res)=>{   
    //add skill
    await DB_skill.addSkill(req.body.skill, req.user.USER_ID);
    res.redirect('/api/user');
});

router.get('/edit/:skill_id',verifyAccessToSkill, async (req,res)=>{
    //get specific skill    
    res.send(await DB_skill.getSkill(req.params.skill_id));
});

router.post('/edit/:skill_id',verifyAccessToSkill, async (req,res)=>{
    //update skill
    const result = await DB_skill.updateSkill(req.body.skill, req.params.skill_id);
    //if (result.result != 'Update is successful')        
    res.redirect('/api/user');
});


router.post('/delete/:skill_id', verifyAccessToSkill, async(req,res)=>{
    await DB_skill.deleteSkill(req.params.skill_id);
    res.redirect('/api/user');
});

router.get('', verify, async(req, res)=>{
    let user_id = req.user.USER_ID;
    if(req.query.user_id) user_id = req.query.user_id;
    res.send(await DB_skill.getSkills(user_id));
});

module.exports = router;