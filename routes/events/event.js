const router = require('express').Router();
const DB_event = require('../../DB-codes/events/DB-event-api');
const { verify } = require('../../middlewares/user-verification');
const { verifyAccessToEvent, verifyAccessToSchedule } = require('../../middlewares/event-verification');
const { verifyGroupMember } = require('../../middlewares/group-verification');

//my going events
router.get('/going',verify, async (req,res)=>{   
    const events = await DB_event.getGoingEvents(req.user.USER_ID);
    res.render('layout.ejs', {
            title : 'My Going Events',
            body : ['events/upcoming-events'],
            events: events,
            cur_user_id: req.user.USER_ID,
            event_type: 'my_going'
        });
});

//my managed events
router.get('/managed',verify, async (req,res)=>{   
    const events = await DB_event.getManagedEvents(req.user.USER_ID);
    res.render('layout.ejs', {
            title : 'My Managed Events',
            body : ['events/upcoming-events'],
            events: events,
            cur_user_id: req.user.USER_ID,
            event_type: 'my_managed'
        });
});

//all past events
router.get('/past', verify, async (req, res) => {
    let ts = Date.now();
    res.render('layout.ejs', {
            title : 'Past Events',
            body : ['events/past-events'],
            cur_user_id: req.user.USER_ID
        });
});

//events of particular group
router.get('/:group_id', verifyGroupMember, async (req, res) => {  
    res.send(await DB_event.getEventsByGroup(req.params.group_id));
});

//add going
router.post('/going/:event_id',verify, async (req,res)=>{   
    await DB_event.addGoing(req.user.USER_ID,req.params.event_id);
    res.redirect(`/api/${req.body.event_type}/${req.params.event_id}`);
});

//remove going
router.post('/remove_going/:event_id',verify, async (req,res)=>{   
    await DB_event.removeGoing(req.user.USER_ID,req.params.event_id);
    res.redirect(`/api/${req.body.event_type}/${req.params.event_id}`);
});

//particular event goings
router.get('/going/:event_id', verify, async (req, res) => {
    res.send(await DB_event.getGoings(req.params.event_id));
});

//add schedule
router.post('/schedule/:event_id', verifyAccessToEvent, async (req, res) => {
    await DB_event.addSchedule(req.params.event_id,req.body);
    res.redirect(`/api/${req.body.event_type}/${req.params.event_id}`);
});

//update
router.post('/schedule/update/:schedule_id',verifyAccessToSchedule, async (req,res)=>{
    await DB_event.updateSchedule(req.params.schedule_id,req.body);
    res.redirect(`/api/${req.body.event_type}/${req.body.event_id}`);
});

//delete
router.post('/schedule/delete/:schedule_id', verifyAccessToSchedule , async(req,res)=>{
    await DB_event.deleteSchedule(req.params.schedule_id);
    res.redirect(`/api/${req.body.event_type}/${req.body.event_id}`);
});

//schedule of a particular event
router.get('/schedule/:event_id', verify, async(req,res)=>{
    res.send(await DB_event.getSchedules(req.params.event_id));
});

module.exports = router;