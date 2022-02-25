const router = require('express').Router();
const DB_blog = require('../../DB-codes/posts/DB-blog-api');
const { verify } = require('../../middlewares/user-verification');
const { verifyAccessToUpdatePost, verifyAccessToDeletePost } = require('../../middlewares/post-verification');

router.post('',verify, async (req,res)=>{   
    const result = await DB_blog.addBlog(req.body, req.user.USER_ID);
    res.redirect('/api/blog');
});

router.post('/update/:post_id',verifyAccessToUpdatePost, async (req,res)=>{
    const result = await DB_blog.updateBlog(req.body, req.params.post_id);
    res.redirect(`/api/blog/${req.params.post_id}`);
});

router.post('/delete/:post_id', verifyAccessToDeletePost , async(req,res)=>{
    const result = await DB_blog.deleteBlog(req.params.post_id);
    res.redirect('/api/blog/all');
});

router.get('/all', verify, async(req,res)=>{
    let blogs = [], title='All Blogs';
    if (req.query.sort === 'mostPopular') {
        blogs = await DB_blog.getBlogsSortedByMostPopular(req.user.USER_ID);
        title = 'Popular Blogs';
    }
    else blogs = await DB_blog.getBlogsSortedByNewest(req.user.USER_ID);
    res.render('layout.ejs', {
            title : title,
            body : ['posts/blogs'],
            blogs: blogs,
            cur_user_id : req.user.USER_ID
        });
});

router.get('', verify, async (req, res) => {
    let user_id = req.user.USER_ID;
    if(req.query.user_id) user_id = req.query.user_id;
    const blogs = await DB_blog.getBlogsByUserId(user_id, req.user.USER_ID);
    res.render('layout.ejs', {
            title : 'My Blogs',
            body : ['posts/blogs'],
            blogs: blogs,
            cur_user_id: user_id
        })
});

router.get('/search', verify, async(req, res)=>{
    const blogs = await DB_blog.searchBlogs(req.user.USER_ID, req.query.search);
    res.render(
        'layout.ejs', {
            title : 'Searched Blogs',
            body : ['posts/blogs'],
            blogs: blogs,
            cur_user_id: req.user.USER_ID
        }
    )
});

router.get('/suggestion', verify, async(req, res)=>{
    const blogs = await DB_blog.suggestedBlogs(req.user.USER_ID);
    res.render(
        'layout.ejs', {
            title : 'Suggested Blogs',
            body : ['posts/blogs'],
            blogs: blogs,
            cur_user_id: req.user.USER_ID
        }
    )
});

router.get('/:post_id', verify, async (req, res) => {
    const blog = await DB_blog.getBlog(req.user.USER_ID, req.params.post_id);
    res.render(
        'layout.ejs', {
            title : 'Blog',
            body : ['posts/blog'],
            blog: blog,
            cur_user_id: req.user.USER_ID
        }
    )
});

module.exports = router;