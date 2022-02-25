const router = require('express').Router();
const DB_follow = require('../../DB-codes/users/DB-follow-api');
const { verify } = require('../../middlewares/user-verification');

router.post('/:following',verify, async (req,res)=>{
    const follower = req.user.USER_ID;
    await DB_follow.follow(follower, req.params.following);
    res.redirect(`/api/user/${req.params.following}`);
});

router.post('/delete/:following', verify , async(req,res)=>{
    const follower = req.user.USER_ID;
    await DB_follow.unfollow(follower, req.params.following);
    res.redirect(`/api/user/${req.params.following}`);
});

router.get('/following', verify, async(req, res)=>{
    let user_id = req.user.USER_ID;
    
    if (req.query.user_id) {
        user_id = req.query.user_id;
    }
    res.send(await DB_follow.getFollowing(user_id));
    
});

router.get('/following/count', verify, async(req, res)=>{
    let user_id = req.user.USER_ID;
    if(req.query.user_id) user_id = req.query.user_id;
    res.send(await DB_follow.getFollowingCount(user_id));
});

router.get('/follower', verify, async(req, res)=>{
    let user_id = req.user.USER_ID;
    if (req.query.user_id) {
        user_id = req.query.user_id;
    }
    res.send(await DB_follow.getFollower(user_id));
});

router.get('/follower/count', verify, async(req, res)=>{
    let user_id = req.user.USER_ID;
    if(req.query.user_id) user_id = req.query.user_id;
    res.send(await DB_follow.getFollowerCount(user_id));
});

router.get('/:user_id', verify, async(req, res)=>{
    res.send(await DB_follow.getIsFollowing(req.user.USER_ID, req.params.user_id));
});

module.exports = router;