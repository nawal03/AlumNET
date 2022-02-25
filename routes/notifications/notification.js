const router = require('express').Router();
const DB_notification = require('../../DB-codes/notifications/DB-notification-api');
const { verify } = require('../../middlewares/user-verification');

//new
router.get('/unseen',verify, async (req,res)=>{   
    res.send(await DB_notification.getUnseenNotifications(req.user.USER_ID));
});

//all
router.get('/all',verify, async (req,res)=>{   
    res.send(await DB_notification.getAllNotifications(req.user.USER_ID));
});

//new count
router.get('/count', verify, async (req,res)=>{   
    res.send(await DB_notification.getUnseenNotificationCount(req.user.USER_ID));
});

module.exports = router;