const router = require('express').Router();
const DB_group = require('../../DB-codes/groups/DB-group-api');
const DB_group_post = require('../../DB-codes/posts/DB-group-post-api');
const {verify} = require('../../middlewares/user-verification');
const {verifyAdmin} = require('../../middlewares/group-verification');

//create group
router.post('', verify, async(req,res)=>{
    await DB_group.createGroup(req.body, req.user.USER_ID);
    res.redirect('/api/group/all');
});

//update group admin
router.post('/updateAdmin/:group_id', verifyAdmin, async (req, res) => {
    await DB_group.updateGroupAdmin(req.params.group_id, req.body.admin_id);
    res.redirect(`/api/group/${req.params.group_id}`);
});

//update group info
router.post('/:group_id',verifyAdmin, async(req,res)=>{
    await DB_group.updateGroup(req.body, req.params.group_id);
    res.redirect(`/api/group/${req.params.group_id}`);
});

//delete group
router.post('/delete/:group_id', verifyAdmin, async(req, res)=>{
    await DB_group.deleteGroup(req.params.group_id);
    res.redirect('/api/group/all');
});

//get all groups
router.get('/all', verify, async(req,res)=>{
    let groups = [];
    groups = await DB_group.getGroups(req.user.USER_ID);
    res.render('layout.ejs', {
            title : 'All Groups',
            body : ['groups/groups'],
            groups: groups,
            cur_user_id : req.user.USER_ID
        });
});

router.get('/suggested', verify, async(req,res)=>{
    let groups = [];
    groups = await DB_group.getSuggestedGroups(req.user.USER_ID);
    res.render('layout.ejs', {
            title : 'Suggested Groups',
            body : ['groups/groups'],
            groups: groups,
            cur_user_id : req.user.USER_ID
        });
});

//get my groups(only member)
router.get('/group_member', verify, async(req,res)=>{
    let groups = [];
    groups = await DB_group.getGroupsByUserId(req.user.USER_ID);
    res.render('layout.ejs', {
            title : 'My Groups',
            body : ['groups/groups'],
            groups: groups,
            cur_user_id : req.user.USER_ID
        });
});

//get my pending groups
router.get('/pending_member', verify, async(req,res)=>{
    let groups = [];
    groups = await DB_group.getPendingGroupsByUserId(req.user.USER_ID);
    res.render('layout.ejs', {
            title : 'My Pending Groups',
            body : ['groups/groups'],
            groups: groups,
            cur_user_id : req.user.USER_ID
        });
});

//get my managed group
router.get('/admin', verify, async(req,res)=>{
    let groups = [];
    groups = await DB_group.getGroupsByAdminId(req.user.USER_ID);
    res.render('layout.ejs', {
            title : 'My Managed Groups',
            body : ['groups/groups'],
            groups: groups,
            cur_user_id : req.user.USER_ID
        });
});

//search group
router.get('/search', verify, async(req,res)=>{
    const groups = await DB_group.searchGroups(req.user.USER_ID, req.query.search);
    res.render(
        'layout.ejs', {
            title : 'Searched Groups',
            body : ['groups/groups'],
            groups: groups,
            cur_user_id: req.user.USER_ID
        }
    )
});

//get a particular group
router.get('/:group_id', verify, async (req, res) => {
    const group = await DB_group.getGroup(req.params.group_id, req.user.USER_ID);
    res.render('layout.ejs', {
            title : group.GROUP_NAME,
            body : ['groups/group'],
            group: group,
            cur_user_id: req.user.USER_ID,
        });
});
module.exports = router;