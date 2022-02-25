const router = require('express').Router();
const DB_job_post = require('../../DB-codes/posts/DB-job-post-api');
const { verify } = require('../../middlewares/user-verification');
const { verifyAccessToUpdatePost, verifyAccessToDeletePost } = require('../../middlewares/post-verification');

//add job post
router.post('',verify, async (req,res)=>{   
    await DB_job_post.addJobPost(req.body, req.user.USER_ID);
    res.redirect('/api/job_post/all');
});

//update job post
router.post('/update/:post_id',verifyAccessToUpdatePost, async (req,res)=>{
    const result = await DB_job_post.updateJobPost(req.body, req.params.post_id);
    res.redirect(`/api/job_post/${req.params.post_id}`);
});

//delete job post
router.post('/delete/:post_id', verifyAccessToDeletePost , async(req,res)=>{
    const result = await DB_job_post.deleteJobPost(req.params.post_id);
    res.redirect('/api/job_post/all');
});

//get all job post
router.get('/all', verify, async(req,res)=>{
    let job_posts = [];
    job_posts = await DB_job_post.getJobPostsSortedByNewest(req.user.USER_ID);
    res.render('layout.ejs', {
            title : 'All Job Posts',
            body : ['posts/job-posts'],
            job_posts: job_posts,
            cur_user_id : req.user.USER_ID
        });
});

//get job post by user id
router.get('', verify, async(req, res)=>{
    let user_id = req.user.USER_ID;
    const job_posts = await DB_job_post.getJobPostsByUserId(user_id, req.user.USER_ID);
    res.render('layout.ejs', {
            title : 'My Job Posts',
            body : ['posts/job-posts'],
            job_posts: job_posts,
            cur_user_id: user_id
        })
});

router.get('/search', verify, async (req, res) => {
    const job_posts = await DB_job_post.searchJobPosts(req.user.USER_ID, req.query);
    res.render('layout.ejs', {
            title : 'Searched Job Posts',
            body : ['posts/job-posts'],
            job_posts: job_posts,
            cur_user_id: req.user.USER_ID
        })
});

//get CV
router.get('/CV', verify, async(req, res)=>{
    const result = await DB_job_post.getCV(req.user.USER_ID);
    res.send(await result.result.getData());
});

//post CV
router.post('/CV/:post_id', verify, async(req, res)=>{
    const result = await DB_job_post.postCV(req.user.USER_ID, req.params.post_id);
    await result.result.getData()
    res.redirect(`/api/job_post/${req.params.post_id}`);
});

router.get('/CV/:post_id', verifyAccessToUpdatePost, async(req, res)=>{
    const cvs = await DB_job_post.getApplicants(req.params.post_id)
    res.render('layout.ejs', {
            title : 'Job Post',
            body : ['posts/CV'],
            cvs: cvs,
            cur_user_id: req.user.USER_ID
        })
});

//check if applied or not
router.get('/applied/:post_id', verify, async(req, res)=>{
    res.send(await DB_job_post.hasApplied(req.user.USER_ID, req.params.post_id));
});

//get a particular job post
router.get('/:post_id', verify, async(req, res)=>{
    const job_post = await DB_job_post.getJobPost(req.user.USER_ID, req.params.post_id);
    res.render('layout.ejs', {
            title : 'Job Post',
            body : ['posts/job-post'],
            job_post: job_post,
            cur_user_id: req.user.USER_ID
        })
});

module.exports = router;