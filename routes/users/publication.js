const router = require('express').Router();
const DB_publication = require('../../DB-codes/users/DB-publication-api');
const { verify, verifyAccessToPublication,  } = require('../../middlewares/user-verification');

router.post('', verify, async (req, res) => {
    await DB_publication.addPublication(req.body, req.user.USER_ID);
    res.redirect('/api/user');
});

router.get('/edit/::publication_id',verifyAccessToPublication, async (req,res)=>{
    //get specific achievement   
    res.send(await DB_publication.getPublication(req.params.publication_id));
});

router.post('/edit/:publication_id',verifyAccessToPublication, async (req,res)=>{
    //update work_experience
    const result = await DB_publication.updatePublication(req.body, req.params.publication_id);
    //if (result.result != 'Update is successful')        
    res.redirect('/api/user');
});

router.post('/delete/:publication_id', verifyAccessToPublication , async(req,res)=>{
    await DB_publication.deletePublication(req.params.publication_id);
    res.redirect('/api/user');
});

router.get('', verify, async(req, res)=>{
    let user_id = req.user.USER_ID;
    if(req.query.user_id) user_id = req.query.user_id;
    res.send(await DB_publication.getPublications(user_id));
});

module.exports = router;