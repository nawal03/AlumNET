const router = require('express').Router();
const DB_post = require('../../DB-codes/posts/DB-post-api');
const { verifyAccessToUpdateComment, verifyAccessToDeleteComment, verifyAccessToLikeAndComment } = require('../../middlewares/post-verification');


router.post('/like/:post_id',verifyAccessToLikeAndComment, async (req,res)=>{   
    await DB_post.addLike(req.user.USER_ID, req.params.post_id);
    if(req.body.type === 'group_post')
        res.redirect(`/api/${req.body.type}/${req.body.group_id}/${req.params.post_id}`);
    else
        res.redirect(`/api/${req.body.type}/${req.params.post_id}`);
});

router.post('/unlike/:post_id',verifyAccessToLikeAndComment, async (req,res)=>{   
    await DB_post.removeLike(req.user.USER_ID, req.params.post_id);
    if(req.body.type === 'group_post')
        res.redirect(`/api/${req.body.type}/${req.body.group_id}/${req.params.post_id}`);
    else
        res.redirect(`/api/${req.body.type}/${req.params.post_id}`);
});

router.get('/like/:post_id', verifyAccessToLikeAndComment, async(req,res)=>{
    res.send(await DB_post.getLikes(req.params.post_id));
});

router.post('/comment/:post_id',verifyAccessToLikeAndComment, async (req,res)=>{
    await DB_post.addComment(req.params.post_id, req.user.USER_ID, req.body.body);
    if(req.body.type === 'group_post')
        res.redirect(`/api/${req.body.type}/${req.body.group_id}/${req.params.post_id}`);
    else
        res.redirect(`/api/${req.body.type}/${req.params.post_id}`);
});

router.post('/comment/update/:comment_id', verifyAccessToUpdateComment, async (req, res) => {
    await DB_post.updateComment(req.params.comment_id, req.body.body);
    if(req.body.type === 'group_post')
        res.redirect(`/api/${req.body.type}/${req.body.group_id}/${req.body.post_id}`);
    else
        res.redirect(`/api/${req.body.type}/${req.body.post_id}`);
});

router.post('/comment/delete/:comment_id', verifyAccessToDeleteComment , async(req,res)=>{
    await DB_post.deleteComment(req.params.comment_id);
    if(req.body.type === 'group_post')
        res.redirect(`/api/${req.body.type}/${req.body.group_id}/${req.body.post_id}`);
    else
        res.redirect(`/api/${req.body.type}/${req.body.post_id}`);
});

router.get('/comment/:post_id', verifyAccessToLikeAndComment, async(req,res)=>{
    res.send(await DB_post.getComments(req.params.post_id));
})

module.exports = router;