const router = require('express').Router();
const DB_achievement = require('../../DB-codes/users/DB-achievement-api');
const { verify, verifyAccessToAchievement } = require('../../middlewares/user-verification');

router.post('',verify, async (req,res)=>{
    await DB_achievement.addAchievement(req.body, req.user.USER_ID);
    res.redirect('/api/user');
});

router.get('/edit/:achievement_id',verifyAccessToAchievement, async (req,res)=>{
    //get specific achievement   
    res.send(await DB_achievement.getAchievement(req.params.achievement_id));
});

router.post('/edit/:achievement_id',verifyAccessToAchievement, async (req,res)=>{
    //update work_experience
    const result = await DB_achievement.updateAchievement(req.body, req.params.achievement_id);
    //if (result.result != 'Update is successful')        
    res.redirect('/api/user');
});

router.post('/delete/:achievement_id', verifyAccessToAchievement , async(req,res)=>{
    await DB_achievement.deleteAchievement(req.params.achievement_id);
    res.redirect('/api/user');
});

router.get('', verify, async(req, res)=>{
    let user_id = req.user.USER_ID;
    if(req.query.user_id) user_id = req.query.user_id;
    res.send(await DB_achievement.getAchievements(user_id));
});

module.exports = router;