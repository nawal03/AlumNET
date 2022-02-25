const router = require('express').Router();
const DB_research_interest = require('../../DB-codes/users/DB-research-interest-api')
const { verify, verifyAccessToResearchInterest } = require('../../middlewares/user-verification');

router.post('',verify, async (req,res)=>{
    await DB_research_interest.addResearchInterest(req.body.research_interest, req.user.USER_ID);
    res.redirect('/api/user');
});

router.get('/edit/:research_interest_id',verifyAccessToResearchInterest, async (req,res)=>{
    //get specific research_interest   
    res.send(await DB_research_interest.getResearchInterest(req.params.research_interest_id));
});

router.post('/edit/:research_interest_id',verifyAccessToResearchInterest, async (req,res)=>{
    //update interest
    const result = await DB_research_interest.updateResearchInterest(req.body.research_interest, req.params.research_interest_id);
    //if (result.result != 'Update is successful')        
    res.redirect('/api/user');
});

router.post('/delete/:research_interest_id', verifyAccessToResearchInterest , async(req,res)=>{
    await DB_research_interest.deleteResearchInterest(req.params.research_interest_id);
    res.redirect('/api/user');
});

router.get('', verify, async(req, res)=>{
    let user_id = req.user.USER_ID;
    if(req.query.user_id) user_id = req.query.user_id;
    res.send(await DB_research_interest.getResearchInterests(user_id));
});

module.exports = router;