const router = require('express').Router();
const DB_group_post = require('../../DB-codes/posts/DB-group-post-api');
const { verifyGroupMember } = require('../../middlewares/group-verification');
const { verifyAccessToUpdatePost, verifyAccessToDeletePost } = require('../../middlewares/post-verification');

//add group post
router.post('/:group_id',verifyGroupMember, async (req,res)=>{   
    await DB_group_post.addGroupPost(req.body, req.user.USER_ID, req.params.group_id);
    res.redirect(`/api/group/${req.params.group_id}`);
});

//update group post
router.post('/update/:post_id',verifyAccessToUpdatePost, async (req,res)=>{
    await DB_group_post.updateGroupPost(req.body, req.params.post_id);
    res.redirect(`/api/group_post/${req.body.group_id}/${req.params.post_id}`);
});

//delete group post
router.post('/delete/:post_id', verifyAccessToDeletePost , async(req,res)=>{
    await DB_group_post.deleteGroupPost(req.params.post_id);
    res.redirect(`/api/group/${req.body.group_id}`);
});

//get all post
router.get('/all/:group_id', verifyGroupMember, async(req,res)=>{
    res.send(await DB_group_post.getGroupPostsSortedByNewest(req.user.USER_ID, req.params.group_id));
});

//search post
router.get('/search/:group_id', verifyGroupMember, async(req, res)=>{
    res.send(await DB_group_post.searchGroupPosts(req.user.USER_ID, req.params.group_id, req.query.str));
});

//get a particular group post
router.get('/:group_id/:post_id', verifyGroupMember, async(req, res)=>{
    const group_post = await DB_group_post.getGroupPost(req.user.USER_ID, req.params.post_id);
    res.render('layout.ejs', {
            title : 'Group Post',
            body : ['posts/group-post'],
            group_post: group_post,
            cur_user_id: req.user.USER_ID,
            group_id: req.params.group_id
        });
});

module.exports = router;