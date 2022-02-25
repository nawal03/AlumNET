const router = require('express').Router();
const DB_merch = require('../../DB-codes/posts/DB-merch-api');
const { verify } = require('../../middlewares/user-verification');
const { verifyAccessToUpdatePost, verifyAccessToDeletePost } = require('../../middlewares/post-verification');

//add merch
router.post('', verify, async (req, res) => {
    await DB_merch.addMerch(req.body, req.user.USER_ID);
    res.redirect('/api/merch/all');
});

//update merch
router.post('/update/:post_id', verifyAccessToUpdatePost, async (req, res) => {
    await DB_merch.updateMerch(req.body, req.params.post_id);
    res.redirect('/api/merch/all');
});

//delete merch
router.post('/delete/:post_id', verifyAccessToDeletePost , async(req,res)=>{
    await DB_merch.deleteMerch(req.params.post_id);
    res.redirect('/api/merch/all');
});

//order=asc||order=desc
//get all merch
router.get('/all', verify, async(req,res)=>{
    let merchs = [], title='All Merchandise';
    if (req.query.sort === 'price') {
        merchs = await DB_merch.getMerchsSortedByPrice(req.user.USER_ID, req.query.order);
        title = 'Sorted Merchandise';
    }
    else if (req.query.sort === 'mostPopular') {
        merchs = await DB_merch.getMerchsSortedByMostPopular(req.user.USER_ID);
        title = 'Popular Merchandise';
    }
    else merchs = await DB_merch.getMerchsSortedByNewest(req.user.USER_ID);
    res.render('layout.ejs', {
            title : title,
            body : ['posts/merchs'],
            merchs: merchs,
            cur_user_id : req.user.USER_ID
        });
});

//get merch by user id
router.get('', verify, async(req, res)=>{
    let user_id = req.user.USER_ID;
    if(req.query.user_id) user_id = req.query.user_id;
    const merchs = await DB_merch.getMerchsByUserId(user_id, req.user.USER_ID);
    res.render('layout.ejs', {
            title : 'My Merchandise',
            body : ['posts/merchs'],
            merchs: merchs,
            cur_user_id : req.user.USER_ID
        });
});


router.get('/search', verify, async (req, res) => {
    const merchs = await DB_merch.searchMerchs(req.user.USER_ID, req.query);
    res.render('layout.ejs', {
            title : 'Searched Merchandise',
            body : ['posts/merchs'],
            merchs: merchs,
            cur_user_id : req.user.USER_ID
        });
});

// get  a particular merch post
router.get('/:post_id', verify, async(req, res)=>{
    const merch = await DB_merch.getMerch(req.user.USER_ID, req.params.post_id);
    res.render(
        'layout.ejs', {
            title : 'Merch',
            body : ['posts/merch'],
            merch: merch,
            cur_user_id: req.user.USER_ID
        }
    )
});
module.exports = router;