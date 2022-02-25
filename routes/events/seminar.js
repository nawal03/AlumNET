const router = require('express').Router();
const DB_seminar = require('../../DB-codes/events/DB-seminar-api');
const { verify } = require('../../middlewares/user-verification');
const { verifyAdmin } = require('../../middlewares/group-verification');
const { verifyAccessToEvent } = require('../../middlewares/event-verification');


router.post('/:group_id', verifyAdmin, async (req,res)=>{   
    await DB_seminar.addSeminar(req.body, req.params.group_id);
    res.redirect(`/api/seminar/upcoming`);
});

router.post('/update/:event_id', verifyAccessToEvent, async (req,res)=>{
    await DB_seminar.updateSeminar(req.body, req.params.event_id);
    res.redirect(`/api/seminar/${req.params.event_id}`);
});

router.post('/delete/:event_id', verifyAccessToEvent , async(req,res)=>{
    await DB_seminar.deleteSeminar(req.params.event_id);
    res.redirect(`/api/seminar/upcoming`);
});

router.get('/upcoming', verify, async(req,res)=>{
    const events = await DB_seminar.getUpcomingSeminar(req.user.USER_ID);
    res.render('layout.ejs', {
            title : 'Upcoming Seminars',
            body : ['events/upcoming-events'],
            events: events,
            cur_user_id: req.user.USER_ID,
            event_type: 'seminar'
        });
});

router.get('/popular', verify, async(req, res)=>{
    const events = await DB_seminar.getMostPopularSeminar(req.user.USER_ID);
    res.render('layout.ejs', {
            title : 'Popular Seminars',
            body : ['events/upcoming-events'],
            events: events,
            cur_user_id: req.user.USER_ID,
            event_type: 'seminar'
        });
});

router.get('/past', verify, async(req, res)=>{
    res.send(await DB_seminar.getPastSeminar(req.user.USER_ID));
});

router.get('/search', verify, async(req, res)=>{
    const events = await DB_seminar.searchSeminar(req.user.USER_ID, req.query);
    res.render('layout.ejs', {
            title : 'Searched Seminars',
            body : ['events/upcoming-events'],
            events: events,
            cur_user_id: req.user.USER_ID,
            event_type: 'seminar'
        });
});

router.get('/suggested', verify, async(req, res)=>{
    const events = await DB_seminar.suggestedSeminar(req.user.USER_ID);
    res.render('layout.ejs', {
            title : 'Suggested Seminars',
            body : ['events/upcoming-events'],
            events: events,
            cur_user_id: req.user.USER_ID,
            event_type: 'seminar'
        });
});

router.get('/:event_id', verify, async(req, res)=>{
    const event = await DB_seminar.getSeminar(req.user.USER_ID, req.params.event_id);
    res.render('layout.ejs', {
            title : event.EVENT_NAME,
            body : ['events/event'],
            event: event,
            cur_user_id: req.user.USER_ID,
            event_type: 'seminar'
        });
});

module.exports = router;