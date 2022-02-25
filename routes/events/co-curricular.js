const router = require('express').Router();
const DB_co_curricular = require('../../DB-codes/events/DB-co-curricular-api');
const { verify } = require('../../middlewares/user-verification');
const { verifyAdmin } = require('../../middlewares/group-verification');
const { verifyAccessToEvent } = require('../../middlewares/event-verification');


router.post('/:group_id', verifyAdmin, async (req,res)=>{   
    await DB_co_curricular.addCoCurricular(req.body, req.params.group_id);
    res.redirect(`/api/co_curricular/upcoming`);
});

router.post('/update/:event_id', verifyAccessToEvent, async (req,res)=>{
    await DB_co_curricular.updateCoCurricular(req.body, req.params.event_id);
    res.redirect(`/api/co_curricular/${req.params.event_id}`);
});

router.post('/delete/:event_id', verifyAccessToEvent , async(req,res)=>{
    await DB_co_curricular.deleteCoCurricular(req.params.event_id);
    res.redirect(`/api/co_curricular/upcoming`);
});

router.get('/upcoming', verify, async(req,res)=>{
    const events = await DB_co_curricular.getUpcomingCoCurriculars(req.user.USER_ID);
    res.render('layout.ejs', {
            title : 'Upcoming Co-curricular Events',
            body : ['events/upcoming-events'],
            events: events,
            cur_user_id: req.user.USER_ID,
            event_type: 'co_curricular'
        });
});

router.get('/popular', verify, async(req, res)=>{
    const events = await DB_co_curricular.getMostPopularCoCurriculars(req.user.USER_ID);
    res.render('layout.ejs', {
            title : 'Popular Co-curricular Events',
            body : ['events/upcoming-events'],
            events: events,
            cur_user_id: req.user.USER_ID,
            event_type: 'co_curricular'
        });
});

router.get('/past', verify, async(req, res)=>{
    res.send(await DB_co_curricular.getPastCoCurriculars(req.user.USER_ID));
    
});

router.get('/search', verify, async(req, res)=>{
    const events = await DB_co_curricular.searchCoCurriculars(req.user.USER_ID, req.query);
    res.render('layout.ejs', {
            title : 'Searched Co-curricular Events',
            body : ['events/upcoming-events'],
            events: events,
            cur_user_id: req.user.USER_ID,
            event_type: 'co_curricular'
        });
});

router.get('/suggested', verify, async(req, res)=>{
    const events = await DB_co_curricular.suggestedCoCurriculars(req.user.USER_ID);
    res.render('layout.ejs', {
            title : 'Suggested Co-curricular Events',
            body : ['events/upcoming-events'],
            events: events,
            cur_user_id: req.user.USER_ID,
            event_type: 'co_curricular'
        });
});

router.get('/:event_id', verify, async(req, res)=>{
    const event = await DB_co_curricular.getCoCurricular(req.user.USER_ID, req.params.event_id);
    res.render('layout.ejs', {
            title : event.EVENT_NAME,
            body : ['events/event'],
            event: event,
            cur_user_id: req.user.USER_ID,
            event_type: 'co_curricular'
        });
});

module.exports = router;