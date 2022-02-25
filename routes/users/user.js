const router = require('express').Router();
const bcrypt= require('bcryptjs');
const DB_user = require('../../DB-codes/users/DB-user-api');
const {verify} = require('../../middlewares/user-verification');

router.get('/edit', verify, async(req,res)=>{
    //save update
    const user = await DB_user.getUserById(req.user.USER_ID);
    res.render('layout.ejs', {
            title : 'User Info Edit',
            body : ['users/editInfo'],
            user: user,
            errors: req.query.errors
        })
});

router.post('/edit', verify, async(req,res)=>{
    //save update
    const user = await DB_user.updateUser(req.body, req.user.USER_ID);
    res.redirect('/api/user');
});

router.post('/password',verify, async(req,res)=>{
    //validate current pass
    //let errors = [];
    const validPass = await bcrypt.compare(req.body.current_password, req.user.PASSWORD);
    if (!validPass) {
        //errors.push('Invalid Current Password');
        res.redirect('/api/user/edit?errors=Invalid Current Password');
    }
    else {
        //hash new pass
        const hashedPassword = await bcrypt.hash(req.body.new_password, await bcrypt.genSalt(10));

        //update pass
        user_id = await DB_user.updatePassword(hashedPassword, req.user.USER_ID)

        //res.send('Password changed!')
        res.redirect('/api/user');
    }
    
});

router.get('/search', verify, async (req, res) => {
    const users = await DB_user.getUsers(req.query);
    res.render('layout.ejs', {
                title : 'Users',
                body: ['users/users'],
                users: users,
                cur_user_id: req.user.USER_ID
            });
});

router.get('/:user_id', verify, async (req, res) => {
    const cur_user_id = req.user.USER_ID;
    const user = await DB_user.getUserById(req.params.user_id);
    res.render('layout.ejs', {
                title : 'Profile',
                body: ['users/user-profile'],
                user: user,
                cur_user_id: cur_user_id
            });
});

router.get('', verify, async (req, res) => {
    const user = await DB_user.getUserById(req.user.USER_ID);
    res.render('layout.ejs', {
                title : 'Profile',
                body: ['users/user-profile'],
                user: user,
                cur_user_id: user.USER_ID
            });
});

module.exports = router;