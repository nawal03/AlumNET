const router = require('express').Router();
const DB_reunion = require('../../DB-codes/events/DB-reunion-api');
const { verify } = require('../../middlewares/user-verification');
const { verifyAdmin } = require('../../middlewares/group-verification');
const { verifyAccessToEvent } = require('../../middlewares/event-verification');


router.post('/:group_id', verifyAdmin, async (req,res)=>{   
    await DB_reunion.addReunion(req.body, req.params.group_id);
    res.redirect(`/api/reunion/upcoming`);
});

router.post('/update/:event_id', verifyAccessToEvent, async (req,res)=>{
    await DB_reunion.updateReunion(req.body, req.params.event_id);
    res.redirect(`/api/reunion/${req.params.event_id}`);
});

router.post('/delete/:event_id', verifyAccessToEvent , async(req,res)=>{
    await DB_reunion.deleteReunion(req.params.event_id);
    res.redirect(`/api/reunion/upcoming`);
});

router.get('/upcoming', verify, async(req,res)=>{
    const events = await DB_reunion.getUpcomingReunions(req.user.USER_ID);
    res.render('layout.ejs', {
            title : 'Upcoming Reunions',
            body : ['events/upcoming-events'],
            events: events,
            cur_user_id: req.user.USER_ID,
            event_type: 'reunion'
        });
});

router.get('/popular', verify, async(req, res)=>{
    const events = await DB_reunion.getMostPopularReunios(req.user.USER_ID);
    res.render('layout.ejs', {
            title : 'Popular Reunions',
            body : ['events/upcoming-events'],
            events: events,
            cur_user_id: req.user.USER_ID,
            event_type: 'reunion'
        });
});

router.get('/past', verify, async(req, res)=>{
    res.send(await DB_reunion.getPastReunions(req.user.USER_ID));
});

router.get('/search', verify, async(req, res)=>{
    const events = await DB_reunion.searchReunions(req.user.USER_ID, req.query);
    res.render('layout.ejs', {
            title : 'Searched Reunions',
            body : ['events/upcoming-events'],
            events: events,
            cur_user_id: req.user.USER_ID,
            event_type: 'reunion'
        });
});

router.get('/suggested', verify, async(req, res)=>{
    const events = await DB_reunion.suggestedReunions(req.user.USER_ID);
    res.render('layout.ejs', {
            title : 'Suggested Reunions',
            body : ['events/upcoming-events'],
            events: events,
            cur_user_id: req.user.USER_ID,
            event_type: 'reunion'
        });
});

router.get('/:event_id', verify, async(req, res)=>{
    const event = await DB_reunion.getReunion(req.user.USER_ID, req.params.event_id);
    res.render('layout.ejs', {
            title : event.EVENT_NAME,
            body : ['events/event'],
            event: event,
            cur_user_id: req.user.USER_ID,
            event_type: 'reunion'
        });
});

module.exports = router;