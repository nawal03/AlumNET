require('dotenv').config();
const express = require('express');
const req = require('express/lib/request');

const app = express();
app.use(express.json());
//added for ejs
app.set('view engine', 'ejs');
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(express.static('public'));

const cors = require("cors");
app.use(cors());
app.options('*',cors());
app.use(express.json());

//import routes
//USER
const authRoute = require('./routes/users/auth');
const userRoute = require('./routes/users/user');
const skillRoute = require('./routes/users/skill');
const researchInterestRoute = require('./routes/users/research-interest');
const interestRoute = require('./routes/users/interest');
const educationRoute = require('./routes/users/education');
const workExperienceRoute = require('./routes/users/work-experience');
const achievementRoute = require('./routes/users/achievement');
const publicationRoute = require('./routes/users/publication');
const followRoute = require('./routes/users/follow');
//GROUP
const groupRoute = require('./routes/groups/group');
const groupMemberRoute = require('./routes/groups/group-member');
//POST 
const postRoute = require('./routes/posts/post');
const groupPostRoute = require('./routes/posts/group-post');
const blogRoute = require('./routes/posts/blog');
const jobPostRoute = require('./routes/posts/job-post');
const merchRoute = require('./routes/posts/merch');
//EVENT
const eventRoute = require('./routes/events/event');
const coCurricularRoute = require('./routes/events/co-curricular');
const reunionRoute = require('./routes/events/reunion');
const seminarRoute = require('./routes/events/seminar');
//NOTIFICATION
const notificationRoute = require('./routes/notifications/notification');

//route middleware
//USER
app.use('/api/auth', authRoute);    // everything in authroute will have this prefix
app.use('/api/user', userRoute);
app.use('/api/skill',skillRoute);
app.use('/api/research_interest', researchInterestRoute);
app.use('/api/interest', interestRoute);
app.use('/api/education', educationRoute);
app.use('/api/work_experience', workExperienceRoute);
app.use('/api/achievement', achievementRoute);
app.use('/api/publication', publicationRoute);
app.use('/api/follow', followRoute);
//GROUP
app.use('/api/group', groupRoute);
app.use('/api/group_member', groupMemberRoute);
//POST 
app.use('/api/post', postRoute);
app.use('/api/group_post', groupPostRoute);
app.use('/api/blog', blogRoute);
app.use('/api/job_post', jobPostRoute);
app.use('/api/merch', merchRoute);
//EVENT
app.use('/api/event', eventRoute);
app.use('/api/co_curricular', coCurricularRoute);
app.use('/api/reunion', reunionRoute);
app.use('/api/seminar', seminarRoute);
//NOTIFICATION
app.use('/api/notification', notificationRoute);


//PORT
const port = process.env.PORT;
app.listen(port, async () => {
    try{
        console.log(`listening on http://localhost:${port}`);
    } catch(err) {
        console.log("Error starting up database: " + err);
        process.exit(1);
    }
});