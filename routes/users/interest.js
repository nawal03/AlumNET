const router = require('express').Router();
const DB_interest = require('../../DB-codes/users/DB-interest-api')
const { verify, verifyAccessToInterest } = require('../../middlewares/user-verification');


router.post('',verify, async (req,res)=>{
    await DB_interest.addInterest(req.body.interest, req.user.USER_ID);
    res.redirect('/api/user');
});

router.get('/edit/:interest_id',verifyAccessToInterest, async (req,res)=>{
    //get specific interest   
    res.send(await DB_interest.getInterest(req.params.interest_id));
});

router.post('/edit/:interest_id',verifyAccessToInterest, async (req,res)=>{
    //update interest
    const result = await DB_interest.updateInterest(req.body.interest, req.params.interest_id);
    //if (result.result != 'Update is successful')        
    res.redirect('/api/user');
});

router.post('/delete/:interest_id', verifyAccessToInterest, async(req,res)=>{
    await DB_interest.deleteInterest(req.params.interest_id);
    res.redirect('/api/user');
});

router.get('', verify, async(req, res)=>{
    let user_id = req.user.USER_ID;

    if(req.query.user_id) user_id = req.query.user_id;

    res.send(await DB_interest.getInterests(user_id));
});

module.exports = router;