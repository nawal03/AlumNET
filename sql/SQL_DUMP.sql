/*
 Navicat Premium Data Transfer

 Source Server         : AlumNet
 Source Server Type    : Oracle
 Source Server Version : 120200
 Source Host           : 103.94.135.201:1521
 Source Schema         : TFUSER4

 Target Server Type    : Oracle
 Target Server Version : 120200
 File Encoding         : 65001

 Date: 25/02/2022 21:22:53
*/


-- ----------------------------
-- Table structure for ACHIEVEMENTS
-- ----------------------------
DROP TABLE "TFUSER4"."ACHIEVEMENTS";
CREATE TABLE "TFUSER4"."ACHIEVEMENTS" (
  "ACHIEVEMENT_ID" NUMBER VISIBLE NOT NULL,
  "USER_ID" NUMBER VISIBLE NOT NULL,
  "ACHIEVEMENT_NAME" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "ACHIEVEMENT_DATE" DATE VISIBLE NOT NULL,
  "ORGANIZED_BY" VARCHAR2(1000 BYTE) VISIBLE,
  "POSITION" VARCHAR2(1000 BYTE) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of ACHIEVEMENTS
-- ----------------------------
INSERT INTO "TFUSER4"."ACHIEVEMENTS" VALUES ('121', '202', '2-2 SURVIVED!', TO_DATE('2022-02-23 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), NULL, NULL);
INSERT INTO "TFUSER4"."ACHIEVEMENTS" VALUES ('101', '201', 'ICPC DHAKA REGIONAL 2020', TO_DATE('2021-07-14 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), NULL, '2nd');

-- ----------------------------
-- Table structure for BLOGS
-- ----------------------------
DROP TABLE "TFUSER4"."BLOGS";
CREATE TABLE "TFUSER4"."BLOGS" (
  "POST_ID" NUMBER VISIBLE NOT NULL,
  "USER_ID" NUMBER VISIBLE NOT NULL,
  "TOPIC" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "TITLE" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "DESCRIPTION" CLOB VISIBLE NOT NULL,
  "TIMESTAMP" TIMESTAMP(6) VISIBLE DEFAULT systimestamp NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of BLOGS
-- ----------------------------
INSERT INTO "TFUSER4"."BLOGS" VALUES ('283', '223', 'KUAKATA TOUR', 'Travel Blog', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu sodales orci, id mollis nisl. Quisque risus mi, ornare eget eros in, tristique facilisis turpis. Nulla vitae vulputate ante, sit amet hendrerit lacus. Praesent pulvinar lorem vitae mi tempus, sit amet auctor lacus varius. In quis lectus lorem. Ut viverra velit a magna hendrerit sagittis. Nullam volutpat maximus dignissim. Pellentesque nec odio non sem lacinia euismod. Donec id lacinia augue, quis maximus nunc.

Integer suscipit mollis massa eu facilisis. Phasellus pulvinar sem nibh, a mollis leo varius in. Suspendisse vel justo vel nunc accumsan semper. Vivamus ut magna rutrum, egestas est quis, sagittis risus. Ut ornare ex massa, ac vulputate quam luctus nec. Suspendisse malesuada viverra neque, sit amet lobortis libero semper sit amet. Aliquam vitae mauris ut felis convallis dapibus nec id tellus. Sed faucibus erat elit, a pharetra velit lobortis vel. Integer sagittis commodo malesuada. Aliquam venenatis purus at luctus facilisis. Nullam consequat tincidunt sem, et egestas leo scelerisque ut.', TO_TIMESTAMP('2022-02-25 07:57:24.938996', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."BLOGS" VALUES ('284', '202', 'TOPIC', 'title', 'DESCRIPTION', TO_TIMESTAMP('2022-02-25 08:05:31.352510', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."BLOGS" VALUES ('242', '201', 'FIRST BLOG', 'This is my first blog', 'Our project is done and I am posting in it.
I am feeling happy now.', TO_TIMESTAMP('2022-02-23 03:43:07.849320', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."BLOGS" VALUES ('243', '201', 'DB PROJECT', 'Features of our project', 'Users: Any current/alumni Buetian can open up an account in our portal as a start. Email verification and password encryption will be implemented. After registration, a user can provide personal, work and education, current position, research interests, skills, achievements, social media profile links and other necessary information to build up a complete profile. He can also add CV and/or research papers in his profile.
Connections: Registered users can follow other users and will be able to see each other’s all activity.
Posts: A user can post under various categories- jobs, research, internship, help seeking and miscellaneous.  Post privacy can be public or friends only. If a post is made public, all registered users will be able to see that post in his feed. Users can like and comment on posts. Likes and comments will be made visible for everyone who sees the post.
Community: A registered user can create a community and/or join based on different criteria. Membership approval will be handled by the admin of that group. Upon joining, a member can post and see all posts of that group. A user will also get community recommendation in his feed.
Events: All users can create and visit different events happening in BUET.
Notification: A user will get various notifications including likes/comments in his post, group posts, accepted friend requests and suggestions about job/research opportunities. 
Search & Filter: Searching and filtering will be available to find users (name, department, batch, email, address), posts (friends’ post, post type) and events (event type, date, location).', TO_TIMESTAMP('2022-02-23 03:47:25.332088', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."BLOGS" VALUES ('262', '202', 'EDUCATION', 'Introduction to NP complete problem', 'This is a guide to the meaning of "NP-Complete". It is not intended to be an exact definition, but should help you to understand the concept.

These are just my personal ideas and are not meant to be "rigorous".

Its All About "Time to Solve"
When you measure how long a program takes to run when it is given more and more difficult problems (such as sorting a list of 10 items, 20 items, 30 items etc) you can plot the times and come up with a function.

time to finish graph
Example: a program''s time increases by x2
So a problem that is twice as hard takes 4 times as long.

That program is in "P", as it is solvable in "Polynomial" time.

NP-Hard
When a problem''s method for solution can be turned into an NP-Complete method for solution it is said to be "NP-Hard".

NP-Hard: as hard as any NP-problem, or maybe harder.
', TO_TIMESTAMP('2022-02-24 15:25:22.658442', 'SYYYY-MM-DD HH24:MI:SS:FF6'));

-- ----------------------------
-- Table structure for COMMENTS
-- ----------------------------
DROP TABLE "TFUSER4"."COMMENTS";
CREATE TABLE "TFUSER4"."COMMENTS" (
  "COMMENT_ID" NUMBER VISIBLE NOT NULL,
  "POST_ID" NUMBER VISIBLE NOT NULL,
  "USER_ID" NUMBER VISIBLE NOT NULL,
  "BODY" VARCHAR2(1024 BYTE) VISIBLE NOT NULL,
  "TIMESTAMP" TIMESTAMP(6) VISIBLE DEFAULT systimestamp NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of COMMENTS
-- ----------------------------
INSERT INTO "TFUSER4"."COMMENTS" VALUES ('221', '283', '223', 'Nice post!', TO_TIMESTAMP('2022-02-25 07:57:59.438323', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."COMMENTS" VALUES ('222', '243', '202', 'test comment post', TO_TIMESTAMP('2022-02-25 08:04:37.012390', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."COMMENTS" VALUES ('161', '242', '202', 'Yaaaaaayyyyy', TO_TIMESTAMP('2022-02-23 04:02:57.351072', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."COMMENTS" VALUES ('166', '243', '202', 'test comment ', TO_TIMESTAMP('2022-02-23 05:31:02.968625', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."COMMENTS" VALUES ('164', '246', '202', 'Why not? ', TO_TIMESTAMP('2022-02-23 04:22:19.989385', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."COMMENTS" VALUES ('165', '242', '207', 'congratulation!!', TO_TIMESTAMP('2022-02-23 04:45:23.337040', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."COMMENTS" VALUES ('210', '263', '202', 'test comment maneesha', TO_TIMESTAMP('2022-02-24 16:32:49.245021', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."COMMENTS" VALUES ('162', '246', '201', 'I don''t agree', TO_TIMESTAMP('2022-02-23 04:20:33.839353', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."COMMENTS" VALUES ('203', '244', '201', 'this is first come first serve. Drop your CV asap!!!', TO_TIMESTAMP('2022-02-24 15:40:19.020857', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."COMMENTS" VALUES ('207', '245', '201', 'Thank you', TO_TIMESTAMP('2022-02-24 15:46:29.075757', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."COMMENTS" VALUES ('205', '244', '202', 'I have applied', TO_TIMESTAMP('2022-02-24 15:45:19.348522', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."COMMENTS" VALUES ('201', '262', '202', 'Hope my blog is useful', TO_TIMESTAMP('2022-02-24 15:28:57.384651', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."COMMENTS" VALUES ('206', '245', '202', 'Nice hoodie', TO_TIMESTAMP('2022-02-24 15:46:05.098319', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."COMMENTS" VALUES ('208', '263', '202', 'Yes. I can', TO_TIMESTAMP('2022-02-24 16:00:30.897306', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."COMMENTS" VALUES ('209', '263', '201', 'Thank you', TO_TIMESTAMP('2022-02-24 16:00:42.394567', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."COMMENTS" VALUES ('181', '243', '201', 'Wowww', TO_TIMESTAMP('2022-02-23 11:38:49.387079', 'SYYYY-MM-DD HH24:MI:SS:FF6'));

-- ----------------------------
-- Table structure for CO_CURRICULARS
-- ----------------------------
DROP TABLE "TFUSER4"."CO_CURRICULARS";
CREATE TABLE "TFUSER4"."CO_CURRICULARS" (
  "EVENT_ID" NUMBER VISIBLE NOT NULL,
  "EVENT_NAME" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "EVENT_DATE" DATE VISIBLE NOT NULL,
  "COVER_PHOTO" VARCHAR2(1000 BYTE) VISIBLE,
  "DESCRIPTION" CLOB VISIBLE NOT NULL,
  "LATITUDE" NUMBER VISIBLE,
  "LONGITUDE" NUMBER VISIBLE,
  "PLATFORM" VARCHAR2(1000 BYTE) VISIBLE,
  "FEES" NUMBER VISIBLE DEFAULT 0 NOT NULL,
  "AVAILABLE_FOR" VARCHAR2(1000 BYTE) VISIBLE DEFAULT 'All' NOT NULL,
  "GROUP_ID" NUMBER VISIBLE NOT NULL,
  "TIMESTAMP" TIMESTAMP(6) VISIBLE DEFAULT systimestamp NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of CO_CURRICULARS
-- ----------------------------
INSERT INTO "TFUSER4"."CO_CURRICULARS" VALUES ('141', 'Project Showcasing', TO_DATE('2022-03-03 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2Fstatic%20images%2Fevent-cover.png?alt=media&token=526fb01b-73b6-4354-9470-41e9ba423c15', 'DB project presentation of cse-18', '23.7270478', '90.4031032', 'zoom', '0', 'CSE-18', '182', TO_TIMESTAMP('2022-02-25 14:29:58.302400', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."CO_CURRICULARS" VALUES ('101', 'project submission', TO_DATE('2022-02-24 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2Fstatic%20images%2Fgroups-default-cover-photo.png?alt=media&token=cda807b8-ae12-44f5-99c5-88c32fd29dbd', 'project submission is today. hurry up', '23.7508693', '90.4040051', 'zoom', '0', 'cse 18', '181', TO_TIMESTAMP('2022-02-23 04:10:22.372846', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."CO_CURRICULARS" VALUES ('122', 'test event editing', TO_DATE('2022-02-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2F1645714028740-dseifert_samsung_galaxy_tab_s6_14.jpg?alt=media&token=93b4e951-9775-4fbf-85b4-be87d72d77f1', 'dsvfbgnj', '23.7270478', '90.4031032', NULL, '0', 'all', '183', TO_TIMESTAMP('2022-02-24 14:38:02.083861', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."CO_CURRICULARS" VALUES ('121', 'Rag Concert', TO_DATE('2022-02-19 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2Fstatic%20images%2Fevent-cover.png?alt=media&token=526fb01b-73b6-4354-9470-41e9ba423c15', 'Rag Concert Phase-2 of Shotoronjo-16', '23.72646350532721', '90.39148244372839', NULL, '0', 'everyone', '182', TO_TIMESTAMP('2022-02-24 14:00:41.239162', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."CO_CURRICULARS" VALUES ('123', 'testing scrolling', TO_DATE('2022-02-16 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2Fstatic%20images%2Fevent-cover.png?alt=media&token=526fb01b-73b6-4354-9470-41e9ba423c15', 'sfergsthyjdhuk', '23.7270478', '90.4031032', NULL, '0', 'all', '182', TO_TIMESTAMP('2022-02-24 20:21:02.515373', 'SYYYY-MM-DD HH24:MI:SS:FF6'));

-- ----------------------------
-- Table structure for EDUCATION
-- ----------------------------
DROP TABLE "TFUSER4"."EDUCATION";
CREATE TABLE "TFUSER4"."EDUCATION" (
  "EDUCATION_ID" NUMBER VISIBLE NOT NULL,
  "USER_ID" NUMBER VISIBLE NOT NULL,
  "INSTITUTE" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "FIELD_OF_STUDY" VARCHAR2(1000 BYTE) VISIBLE,
  "DEGREE" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "GRADE" VARCHAR2(1000 BYTE) VISIBLE,
  "START_DATE" DATE VISIBLE NOT NULL,
  "END_DATE" DATE VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of EDUCATION
-- ----------------------------
INSERT INTO "TFUSER4"."EDUCATION" VALUES ('101', '201', 'VNS', NULL, 'SSC', NULL, TO_DATE('2006-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "TFUSER4"."EDUCATION" VALUES ('102', '201', 'VNC', 'Science', 'HSC', 'GPA 5', TO_DATE('2016-06-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2018-06-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "TFUSER4"."EDUCATION" VALUES ('103', '201', 'BUET', 'CSE', 'BSC IN ENGINEERING', NULL, TO_DATE('2019-04-29 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO "TFUSER4"."EDUCATION" VALUES ('142', '202', 'UDAYAN UCHCHA MADHYAMIK BIDYALAYA', 'Science', 'HSC', 'GPA 5.0', TO_DATE('2016-07-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), TO_DATE('2018-06-03 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'));
INSERT INTO "TFUSER4"."EDUCATION" VALUES ('141', '205', 'BUET', 'CSE', 'BSC', NULL, TO_DATE('2019-04-29 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO "TFUSER4"."EDUCATION" VALUES ('121', '202', 'BUET', 'CSE', 'BSC', NULL, TO_DATE('2019-04-29 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), NULL);

-- ----------------------------
-- Table structure for EVENTS
-- ----------------------------
DROP TABLE "TFUSER4"."EVENTS";
CREATE TABLE "TFUSER4"."EVENTS" (
  "EVENT_ID" NUMBER VISIBLE NOT NULL,
  "EVENT_TYPE" VARCHAR2(20 BYTE) VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of EVENTS
-- ----------------------------
INSERT INTO "TFUSER4"."EVENTS" VALUES ('101', 'co_curricular');
INSERT INTO "TFUSER4"."EVENTS" VALUES ('141', 'co_curricular');
INSERT INTO "TFUSER4"."EVENTS" VALUES ('103', 'reunion');
INSERT INTO "TFUSER4"."EVENTS" VALUES ('104', 'seminar');
INSERT INTO "TFUSER4"."EVENTS" VALUES ('102', 'reunion');
INSERT INTO "TFUSER4"."EVENTS" VALUES ('121', 'co_curricular');
INSERT INTO "TFUSER4"."EVENTS" VALUES ('122', 'co_curricular');
INSERT INTO "TFUSER4"."EVENTS" VALUES ('105', 'seminar');
INSERT INTO "TFUSER4"."EVENTS" VALUES ('123', 'co_curricular');

-- ----------------------------
-- Table structure for EVENT_PARTICIPANTS
-- ----------------------------
DROP TABLE "TFUSER4"."EVENT_PARTICIPANTS";
CREATE TABLE "TFUSER4"."EVENT_PARTICIPANTS" (
  "EVENT_ID" NUMBER VISIBLE NOT NULL,
  "USER_ID" NUMBER VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of EVENT_PARTICIPANTS
-- ----------------------------
INSERT INTO "TFUSER4"."EVENT_PARTICIPANTS" VALUES ('101', '201');
INSERT INTO "TFUSER4"."EVENT_PARTICIPANTS" VALUES ('101', '202');
INSERT INTO "TFUSER4"."EVENT_PARTICIPANTS" VALUES ('104', '201');
INSERT INTO "TFUSER4"."EVENT_PARTICIPANTS" VALUES ('104', '206');
INSERT INTO "TFUSER4"."EVENT_PARTICIPANTS" VALUES ('121', '202');
INSERT INTO "TFUSER4"."EVENT_PARTICIPANTS" VALUES ('121', '205');
INSERT INTO "TFUSER4"."EVENT_PARTICIPANTS" VALUES ('141', '202');

-- ----------------------------
-- Table structure for FOLLOWS
-- ----------------------------
DROP TABLE "TFUSER4"."FOLLOWS";
CREATE TABLE "TFUSER4"."FOLLOWS" (
  "FOLLOWER" NUMBER VISIBLE NOT NULL,
  "FOLLOWING" NUMBER VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of FOLLOWS
-- ----------------------------
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('201', '202');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('201', '204');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('201', '205');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('201', '207');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('201', '209');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('201', '210');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('202', '201');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('202', '205');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('202', '206');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('202', '243');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('204', '201');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('204', '202');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('204', '205');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('204', '206');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('206', '201');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('206', '202');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('206', '205');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('206', '207');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('207', '201');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('207', '205');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('223', '201');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('223', '202');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('223', '207');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('223', '209');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('243', '202');
INSERT INTO "TFUSER4"."FOLLOWS" VALUES ('243', '242');

-- ----------------------------
-- Table structure for GROUPS
-- ----------------------------
DROP TABLE "TFUSER4"."GROUPS";
CREATE TABLE "TFUSER4"."GROUPS" (
  "GROUP_ID" NUMBER VISIBLE NOT NULL,
  "GROUP_NAME" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "DESCRIPTION" CLOB VISIBLE,
  "DATE_OF_CREATION" DATE VISIBLE DEFAULT SYSDATE NOT NULL,
  "COVER_PHOTO" VARCHAR2(1000 BYTE) VISIBLE,
  "ADMIN_ID" NUMBER VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of GROUPS
-- ----------------------------
INSERT INTO "TFUSER4"."GROUPS" VALUES ('182', 'CSE, BUET', 'group for all alumni of CSE, BUET', TO_DATE('2022-02-23 04:24:04', 'SYYYY-MM-DD HH24:MI:SS'), 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2Fstatic%20images%2Fgroups-default-cover-photo.png?alt=media&token=cda807b8-ae12-44f5-99c5-88c32fd29dbd', '202');
INSERT INTO "TFUSER4"."GROUPS" VALUES ('181', 'CSE 216 Project discuss group', 'only for cse 18', TO_DATE('2022-02-23 04:09:07', 'SYYYY-MM-DD HH24:MI:SS'), 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2Fstatic%20images%2Fgroups-default-cover-photo.png?alt=media&token=cda807b8-ae12-44f5-99c5-88c32fd29dbd', '201');
INSERT INTO "TFUSER4"."GROUPS" VALUES ('183', 'BUET CSE 18', 'This is a group to for all students of Batch-18, Department of CSE, BUET. ', TO_DATE('2022-02-23 04:48:20', 'SYYYY-MM-DD HH24:MI:SS'), 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2F1645591674686-IMG_2602.JPG?alt=media&token=f19b8f4c-4309-49cf-8fd8-9de2947014d5', '206');

-- ----------------------------
-- Table structure for GROUP_MEMBERS
-- ----------------------------
DROP TABLE "TFUSER4"."GROUP_MEMBERS";
CREATE TABLE "TFUSER4"."GROUP_MEMBERS" (
  "GROUP_MEMBER_ID" NUMBER VISIBLE NOT NULL,
  "USER_ID" NUMBER VISIBLE NOT NULL,
  "GROUP_ID" NUMBER VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of GROUP_MEMBERS
-- ----------------------------
INSERT INTO "TFUSER4"."GROUP_MEMBERS" VALUES ('201', '201', '181');
INSERT INTO "TFUSER4"."GROUP_MEMBERS" VALUES ('202', '202', '181');
INSERT INTO "TFUSER4"."GROUP_MEMBERS" VALUES ('203', '202', '182');
INSERT INTO "TFUSER4"."GROUP_MEMBERS" VALUES ('204', '204', '181');
INSERT INTO "TFUSER4"."GROUP_MEMBERS" VALUES ('221', '205', '181');
INSERT INTO "TFUSER4"."GROUP_MEMBERS" VALUES ('206', '205', '182');
INSERT INTO "TFUSER4"."GROUP_MEMBERS" VALUES ('205', '206', '183');

-- ----------------------------
-- Table structure for GROUP_POSTS
-- ----------------------------
DROP TABLE "TFUSER4"."GROUP_POSTS";
CREATE TABLE "TFUSER4"."GROUP_POSTS" (
  "POST_ID" NUMBER VISIBLE NOT NULL,
  "TOPIC" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "GROUP_MEMBER_ID" NUMBER VISIBLE NOT NULL,
  "DESCRIPTION" CLOB VISIBLE NOT NULL,
  "TIMESTAMP" TIMESTAMP(6) VISIBLE DEFAULT SYSTIMESTAMP NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of GROUP_POSTS
-- ----------------------------
INSERT INTO "TFUSER4"."GROUP_POSTS" VALUES ('246', 'MY EXCITEMENT', '202', 'I am thrilled for the project. Can''t wait!', TO_TIMESTAMP('2022-02-23 04:19:57.666138', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."GROUP_POSTS" VALUES ('263', 'HELP NEEDED', '201', 'Can any one provide a sample readme?', TO_TIMESTAMP('2022-02-24 15:59:23.126142', 'SYYYY-MM-DD HH24:MI:SS:FF6'));

-- ----------------------------
-- Table structure for INTERESTS
-- ----------------------------
DROP TABLE "TFUSER4"."INTERESTS";
CREATE TABLE "TFUSER4"."INTERESTS" (
  "INTEREST_ID" NUMBER VISIBLE NOT NULL,
  "INTEREST" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "USER_ID" NUMBER VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of INTERESTS
-- ----------------------------
INSERT INTO "TFUSER4"."INTERESTS" VALUES ('141', 'DANCING', '202');
INSERT INTO "TFUSER4"."INTERESTS" VALUES ('122', 'READING BOOKS', '201');
INSERT INTO "TFUSER4"."INTERESTS" VALUES ('123', 'SINGING', '202');
INSERT INTO "TFUSER4"."INTERESTS" VALUES ('121', 'TRAVELLING', '201');

-- ----------------------------
-- Table structure for JOB_APPLICATION
-- ----------------------------
DROP TABLE "TFUSER4"."JOB_APPLICATION";
CREATE TABLE "TFUSER4"."JOB_APPLICATION" (
  "POST_ID" NUMBER VISIBLE NOT NULL,
  "USER_ID" NUMBER VISIBLE NOT NULL,
  "CV" CLOB VISIBLE NOT NULL,
  "TIMESTAMP" TIMESTAMP(6) VISIBLE DEFAULT SYSTIMESTAMP NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of JOB_APPLICATION
-- ----------------------------
INSERT INTO "TFUSER4"."JOB_APPLICATION" VALUES ('244', '223', '---PERSONAL INFO---
Name : NAZMUL  ISLAM
Email : nazmul@gmail.com
Department : Computer Science and Engineering
Batch : 2018
Gender : Male
Address : NOAKHALI, BANGLADESH

', TO_TIMESTAMP('2022-02-25 08:02:19.154729', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."JOB_APPLICATION" VALUES ('244', '209', '---PERSONAL INFO---
Name : TAMIM EHSAN
Email : tamim@gmail.com
Department : Computer Science and Engineering
Batch : 2018
Gender : Male
Address : DHAKA, BANGLADESH

', TO_TIMESTAMP('2022-02-23 04:47:42.317456', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."JOB_APPLICATION" VALUES ('244', '202', '---PERSONAL INFO---
Name : MANEESHA SAHA
Email : mswarna28@gmail.com
Department : Computer Science and Engineering
Batch : 2018
Gender : Female
Address : DHAKA, BANGLADESH

---WORK EXPERIENCE---
1. MEDIA CO-ORDINATOR (Part-Time)
Organization : IEEE CS BUET SBC
04-JAN-22 - now

---EDUCATION---
1. BSC
Institute : BUET
29-APR-19 - now
2. HSC
Institute : UDAYAN UCHCHA MADHYAMIK BIDYALAYA
Grade : GPA 5.0
01-JUL-16 - 03-JUN-18

---PUBLICATIONS---
1. ALUMNET
Journal : DB PROJECT (22-FEB-22)
Authors : N NAWAL, M SAHA

---ACHIEVEMENTS---
1. 2-2 SURVIVED! (23-FEB-22)

---PUBLICATIONS---
1. ALUMNET
Journal : DB PROJECT (22-FEB-22)
Authors : N NAWAL, M SAHA

---RESEARCH INTEREST---
1. MACHINE LEARNING   
---SKILL---
1. CODE   
---INTEREST---
1. DANCING   2. SINGING   
', TO_TIMESTAMP('2022-02-25 13:33:20.442431', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."JOB_APPLICATION" VALUES ('244', '204', '---PERSONAL INFO---
Name : AYESHA MOSTOFA
Email : ayesha@gmail.com
Department : Computer Science and Engineering
Batch : 2018
Gender : Female
Address : DHAKA, BANGLADESH

', TO_TIMESTAMP('2022-02-23 11:42:09.178645', 'SYYYY-MM-DD HH24:MI:SS:FF6'));

-- ----------------------------
-- Table structure for JOB_POSTS
-- ----------------------------
DROP TABLE "TFUSER4"."JOB_POSTS";
CREATE TABLE "TFUSER4"."JOB_POSTS" (
  "POST_ID" NUMBER VISIBLE NOT NULL,
  "USER_ID" NUMBER VISIBLE NOT NULL,
  "COMPANY_NAME" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "JOB_TYPE" VARCHAR2(50 BYTE) VISIBLE NOT NULL,
  "REMOTE" VARCHAR2(50 BYTE) VISIBLE NOT NULL,
  "LATITUDE" NUMBER VISIBLE,
  "LONGITUDE" NUMBER VISIBLE,
  "REQUIREMENTS" VARCHAR2(1024 BYTE) VISIBLE NOT NULL,
  "DESIGNATION" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "EXPECTED_SALARY" NUMBER VISIBLE NOT NULL,
  "VACANCY" NUMBER(15,0) VISIBLE,
  "EMAIL" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "PHONE_NO" VARCHAR2(1000 BYTE) VISIBLE,
  "TIMESTAMP" TIMESTAMP(6) VISIBLE DEFAULT systimestamp NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of JOB_POSTS
-- ----------------------------
INSERT INTO "TFUSER4"."JOB_POSTS" VALUES ('244', '201', 'N/A', 'Full-Time', 'No', '23.75522937858701', '90.41546349691166', 'Must be 2nd year student.', 'Math Tutor for HSC candidate', '10000', '1', 'noshinnawal01@gmail.com', NULL, TO_TIMESTAMP('2022-02-23 03:55:56.060377', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."JOB_POSTS" VALUES ('285', '202', 'ABC COMPANY', 'Part-Time', 'Yes', '24.36049937246005', '88.59011325957444', 'Computer Science and Engineering', 'ICT Trainer', '10000', '2', 'mswarna28@gmail.com', '01917710016', TO_TIMESTAMP('2022-02-25 13:25:46.646321', 'SYYYY-MM-DD HH24:MI:SS:FF6'));

-- ----------------------------
-- Table structure for LIKES
-- ----------------------------
DROP TABLE "TFUSER4"."LIKES";
CREATE TABLE "TFUSER4"."LIKES" (
  "LIKE_ID" NUMBER VISIBLE NOT NULL,
  "POST_ID" NUMBER VISIBLE NOT NULL,
  "USER_ID" NUMBER VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of LIKES
-- ----------------------------
INSERT INTO "TFUSER4"."LIKES" VALUES ('243', '262', '201');
INSERT INTO "TFUSER4"."LIKES" VALUES ('181', '242', '202');
INSERT INTO "TFUSER4"."LIKES" VALUES ('262', '243', '202');
INSERT INTO "TFUSER4"."LIKES" VALUES ('185', '244', '202');
INSERT INTO "TFUSER4"."LIKES" VALUES ('182', '242', '207');
INSERT INTO "TFUSER4"."LIKES" VALUES ('183', '244', '209');
INSERT INTO "TFUSER4"."LIKES" VALUES ('242', '243', '223');
INSERT INTO "TFUSER4"."LIKES" VALUES ('261', '283', '223');

-- ----------------------------
-- Table structure for MERCHS
-- ----------------------------
DROP TABLE "TFUSER4"."MERCHS";
CREATE TABLE "TFUSER4"."MERCHS" (
  "POST_ID" NUMBER VISIBLE NOT NULL,
  "USER_ID" NUMBER VISIBLE NOT NULL,
  "PRODUCT_NAME" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "IMAGE" VARCHAR2(1024 BYTE) VISIBLE NOT NULL,
  "PRICE" NUMBER VISIBLE NOT NULL,
  "EMAIL" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "PHONE_NO" VARCHAR2(1000 BYTE) VISIBLE,
  "DESCRIPTION" CLOB VISIBLE,
  "TIMESTAMP" TIMESTAMP(6) VISIBLE DEFAULT systimestamp NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of MERCHS
-- ----------------------------
INSERT INTO "TFUSER4"."MERCHS" VALUES ('286', '201', 'HOODIE', 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2F1645796473822-download.jpg?alt=media&token=375d23e9-c31b-4e0c-b471-b4469c13f68f', '800', 'noshin@gmail.com', '0123456789', 'Color: Maroon
Size: S, M, L, XL', TO_TIMESTAMP('2022-02-25 13:41:25.700743', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."MERCHS" VALUES ('245', '201', 'HOODIE', 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2F1645589844713-th%20(1).jpg?alt=media&token=64eedaf5-b073-41e2-a2c9-0ef606cfb1f5', '750', 'noshinnawal01@gmail.com', NULL, 'Good quality cotton hoodie', TO_TIMESTAMP('2022-02-23 04:17:34.066772', 'SYYYY-MM-DD HH24:MI:SS:FF6'));

-- ----------------------------
-- Table structure for NOTIFICATION
-- ----------------------------
DROP TABLE "TFUSER4"."NOTIFICATION";
CREATE TABLE "TFUSER4"."NOTIFICATION" (
  "NOTIFICATION_ID" NUMBER VISIBLE NOT NULL,
  "USER_ID" NUMBER VISIBLE NOT NULL,
  "ENTITY_NAME" VARCHAR2(100 BYTE) VISIBLE NOT NULL,
  "ENTITY_ID" NUMBER VISIBLE NOT NULL,
  "NOTIFICATION_TEXT" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "NOTIFICATION_URL" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "SEEN" VARCHAR2(100 BYTE) VISIBLE NOT NULL,
  "TIMESTAMP" TIMESTAMP(6) VISIBLE DEFAULT SYSTIMESTAMP NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of NOTIFICATION
-- ----------------------------
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('152', '201', 'POSTS', '246', 'There is new post in CSE 216 Project discuss group group', '/api/group_post/181/246', 'YES', TO_TIMESTAMP('2022-02-23 04:19:57.685501', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('151', '202', 'GROUP_MEMBERS', '202', 'Your join request in CSE 216 Project discuss group group is accepted', '/api/group/181', 'YES', TO_TIMESTAMP('2022-02-23 04:18:40.919472', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('160', '204', 'USERS', '204', 'Welcome to ALUMNET. Click here to add info in your profile...', '/api/user/edit', 'YES', TO_TIMESTAMP('2022-02-23 04:33:35.146090', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('161', '205', 'USERS', '205', 'Welcome to ALUMNET. Click here to add info in your profile...', '/api/user/edit', 'NO', TO_TIMESTAMP('2022-02-23 04:34:02.257580', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('162', '206', 'USERS', '206', 'Welcome to ALUMNET. Click here to add info in your profile...', '/api/user/edit', 'YES', TO_TIMESTAMP('2022-02-23 04:34:34.976731', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('163', '207', 'USERS', '207', 'Welcome to ALUMNET. Click here to add info in your profile...', '/api/user/edit', 'NO', TO_TIMESTAMP('2022-02-23 04:35:09.591954', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('164', '208', 'USERS', '208', 'Welcome to ALUMNET. Click here to add info in your profile...', '/api/user/edit', 'NO', TO_TIMESTAMP('2022-02-23 04:35:31.284533', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('165', '209', 'USERS', '209', 'Welcome to ALUMNET. Click here to add info in your profile...', '/api/user/edit', 'NO', TO_TIMESTAMP('2022-02-23 04:35:55.208695', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('166', '210', 'USERS', '210', 'Welcome to ALUMNET. Click here to add info in your profile...', '/api/user/edit', 'NO', TO_TIMESTAMP('2022-02-23 04:36:28.140553', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('192', '206', 'PENDING_MEMBERS', '145', 'NOSHIN NAWAL wants to join BUET CSE 18', '/api/group/183', 'YES', TO_TIMESTAMP('2022-02-23 04:53:03.185801', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('181', '201', 'PENDING_MEMBERS', '143', 'MASHIYAT MAHJABIN wants to join CSE 216 Project discuss group', '/api/group/181', 'YES', TO_TIMESTAMP('2022-02-23 04:44:08.957382', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('182', '202', 'PENDING_MEMBERS', '144', 'MASHIYAT MAHJABIN wants to join CSE, BUET', '/api/group/182', 'YES', TO_TIMESTAMP('2022-02-23 04:44:12.919722', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('143', '202', 'USERS', '202', 'Welcome to ALUMNET. Click here to add info in your profile...', '/api/user/edit', 'YES', TO_TIMESTAMP('2022-02-23 03:54:19.430301', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('147', '201', 'EVENTS', '101', 'CSE 216 Project discuss group group is arranging a co-curricular event', '/api/co_curricular/101', 'YES', TO_TIMESTAMP('2022-02-23 04:10:22.389401', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('187', '204', 'GROUP_MEMBERS', '204', 'Your join request in CSE 216 Project discuss group group is accepted', '/api/group/181', 'NO', TO_TIMESTAMP('2022-02-23 04:46:47.870783', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('193', '206', 'PENDING_MEMBERS', '146', 'FABIHA TASNEEM wants to join BUET CSE 18', '/api/group/183', 'YES', TO_TIMESTAMP('2022-02-23 04:58:31.013153', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('299', '201', 'POSTS', '244', 'NAZMUL  ISLAM has applied for a job you posted. See the CV.', '/api/job_post/CV/244', 'YES', TO_TIMESTAMP('2022-02-25 08:02:19.179125', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('196', '205', 'GROUP_MEMBERS', '206', 'Your join request in CSE, BUET group is accepted', '/api/group/182', 'NO', TO_TIMESTAMP('2022-02-23 04:59:22.640501', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('248', '202', 'POSTS', '263', 'There is new post in CSE 216 Project discuss group group', '/api/group_post/181/263', 'YES', TO_TIMESTAMP('2022-02-24 15:59:23.171907', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('249', '204', 'POSTS', '263', 'There is new post in CSE 216 Project discuss group group', '/api/group_post/181/263', 'NO', TO_TIMESTAMP('2022-02-24 15:59:23.172409', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('251', '202', 'PENDING_MEMBERS', '164', 'NOSHIN NAWAL wants to join CSE, BUET', '/api/group/182', 'YES', TO_TIMESTAMP('2022-02-24 16:01:32.665841', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('302', '201', 'POSTS', '284', 'MANEESHA SAHA has posted a blog.', '/api/blog/284', 'YES', TO_TIMESTAMP('2022-02-25 08:05:31.353117', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('303', '204', 'POSTS', '284', 'MANEESHA SAHA has posted a blog.', '/api/blog/284', 'NO', TO_TIMESTAMP('2022-02-25 08:05:31.353391', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('304', '206', 'POSTS', '284', 'MANEESHA SAHA has posted a blog.', '/api/blog/284', 'NO', TO_TIMESTAMP('2022-02-25 08:05:31.353513', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('305', '223', 'POSTS', '284', 'MANEESHA SAHA has posted a blog.', '/api/blog/284', 'NO', TO_TIMESTAMP('2022-02-25 08:05:31.353609', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('306', '243', 'POSTS', '284', 'MANEESHA SAHA has posted a blog.', '/api/blog/284', 'NO', TO_TIMESTAMP('2022-02-25 08:05:31.353719', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('322', '202', 'EVENTS', '141', 'CSE, BUET group is arranging a co-curricular event', '/api/co_curricular/141', 'YES', TO_TIMESTAMP('2022-02-25 14:29:58.325946', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('323', '205', 'EVENTS', '141', 'CSE, BUET group is arranging a co-curricular event', '/api/co_curricular/141', 'NO', TO_TIMESTAMP('2022-02-25 14:29:58.326443', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('146', '201', 'LIKES', '161', 'MANEESHA SAHA has commented on your post', '/api/blog/242', 'YES', TO_TIMESTAMP('2022-02-23 04:02:57.364746', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('157', '202', 'EVENTS', '103', 'CSE, BUET group is arranging a reunion', '/api/reunion/103', 'YES', TO_TIMESTAMP('2022-02-23 04:27:42.938212', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('199', '201', 'LIKES', '185', 'MANEESHA SAHA has liked your post', '/api/job_post/244', 'YES', TO_TIMESTAMP('2022-02-23 05:32:09.019239', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('145', '201', 'LIKES', '181', 'MANEESHA SAHA has liked your post', '/api/blog/242', 'YES', TO_TIMESTAMP('2022-02-23 04:02:48.662918', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('167', '209', 'FOLLOWS', '201', 'NOSHIN NAWAL has started to following you. Visit profile.', '/api/user/201', 'NO', TO_TIMESTAMP('2022-02-23 04:36:51.918298', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('283', '243', 'USERS', '243', 'Welcome to ALUMNET. Click here to add info in your profile...', '/api/user/edit', 'NO', TO_TIMESTAMP('2022-02-25 06:56:39.341780', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('169', '205', 'FOLLOWS', '201', 'NOSHIN NAWAL has started to following you. Visit profile.', '/api/user/201', 'NO', TO_TIMESTAMP('2022-02-23 04:37:03.276746', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('170', '207', 'FOLLOWS', '201', 'NOSHIN NAWAL has started to following you. Visit profile.', '/api/user/201', 'NO', TO_TIMESTAMP('2022-02-23 04:37:09.961974', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('171', '210', 'FOLLOWS', '201', 'NOSHIN NAWAL has started to following you. Visit profile.', '/api/user/201', 'NO', TO_TIMESTAMP('2022-02-23 04:37:17.133033', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('172', '201', 'FOLLOWS', '204', 'AYESHA MOSTOFA has started to following you. Visit profile.', '/api/user/204', 'YES', TO_TIMESTAMP('2022-02-23 04:40:44.383790', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('173', '205', 'FOLLOWS', '204', 'AYESHA MOSTOFA has started to following you. Visit profile.', '/api/user/204', 'NO', TO_TIMESTAMP('2022-02-23 04:40:53.545897', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('174', '202', 'FOLLOWS', '204', 'AYESHA MOSTOFA has started to following you. Visit profile.', '/api/user/204', 'YES', TO_TIMESTAMP('2022-02-23 04:41:05.866138', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('175', '206', 'FOLLOWS', '204', 'AYESHA MOSTOFA has started to following you. Visit profile.', '/api/user/204', 'YES', TO_TIMESTAMP('2022-02-23 04:41:17.727662', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('177', '201', 'FOLLOWS', '206', 'MASHIYAT MAHJABIN has started to following you. Visit profile.', '/api/user/206', 'YES', TO_TIMESTAMP('2022-02-23 04:41:58.269589', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('178', '205', 'FOLLOWS', '206', 'MASHIYAT MAHJABIN has started to following you. Visit profile.', '/api/user/206', 'NO', TO_TIMESTAMP('2022-02-23 04:43:26.179156', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('179', '202', 'FOLLOWS', '206', 'MASHIYAT MAHJABIN has started to following you. Visit profile.', '/api/user/206', 'YES', TO_TIMESTAMP('2022-02-23 04:43:30.420058', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('180', '207', 'FOLLOWS', '206', 'MASHIYAT MAHJABIN has started to following you. Visit profile.', '/api/user/206', 'NO', TO_TIMESTAMP('2022-02-23 04:43:34.912830', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('183', '201', 'FOLLOWS', '207', 'ANUP BHOWMIK has started to following you. Visit profile.', '/api/user/207', 'YES', TO_TIMESTAMP('2022-02-23 04:44:34.622446', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('184', '205', 'FOLLOWS', '207', 'ANUP BHOWMIK has started to following you. Visit profile.', '/api/user/207', 'NO', TO_TIMESTAMP('2022-02-23 04:44:44.938960', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('189', '201', 'POSTS', '244', 'TAMIM EHSAN has applied for a job you posted. See the CV.', '/api/job_post/CV/244', 'YES', TO_TIMESTAMP('2022-02-23 04:47:42.351947', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('190', '201', 'POSTS', '244', 'MANEESHA SAHA has applied for a job you posted. See the CV.', '/api/job_post/CV/244', 'YES', TO_TIMESTAMP('2022-02-23 04:49:50.313890', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('301', '201', 'LIKES', '222', 'MANEESHA SAHA has commented on your post', '/api/blog/243', 'YES', TO_TIMESTAMP('2022-02-25 08:04:37.015385', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('198', '201', 'LIKES', '166', 'MANEESHA SAHA has commented on your post', '/api/blog/243', 'YES', TO_TIMESTAMP('2022-02-23 05:31:02.970748', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('221', '204', 'FOLLOWS', '201', 'NOSHIN NAWAL has started to following you. Visit profile.', '/api/user/201', 'NO', TO_TIMESTAMP('2022-02-24 08:41:04.899055', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('298', '201', 'FOLLOWS', '202', 'MANEESHA SAHA has started to following you. Visit profile.', '/api/user/202', 'YES', TO_TIMESTAMP('2022-02-25 07:54:46.853575', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('292', '205', 'FOLLOWS', '202', 'MANEESHA SAHA has started to following you. Visit profile.', '/api/user/202', 'NO', TO_TIMESTAMP('2022-02-25 07:42:24.789930', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('300', '201', 'LIKES', '262', 'MANEESHA SAHA has liked your post', '/api/blog/243', 'YES', TO_TIMESTAMP('2022-02-25 08:04:32.639917', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('313', '202', 'POSTS', '286', 'NOSHIN NAWAL has posted a merchandise.', '/api/merch/286', 'YES', TO_TIMESTAMP('2022-02-25 13:41:25.719594', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('314', '204', 'POSTS', '286', 'NOSHIN NAWAL has posted a merchandise.', '/api/merch/286', 'NO', TO_TIMESTAMP('2022-02-25 13:41:25.720021', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('315', '206', 'POSTS', '286', 'NOSHIN NAWAL has posted a merchandise.', '/api/merch/286', 'NO', TO_TIMESTAMP('2022-02-25 13:41:25.720184', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('316', '207', 'POSTS', '286', 'NOSHIN NAWAL has posted a merchandise.', '/api/merch/286', 'NO', TO_TIMESTAMP('2022-02-25 13:41:25.720332', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('317', '223', 'POSTS', '286', 'NOSHIN NAWAL has posted a merchandise.', '/api/merch/286', 'NO', TO_TIMESTAMP('2022-02-25 13:41:25.720478', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('321', '201', 'GROUPS', '201', 'You are the admin of CSE 216 Project discuss group group now', '/api/group/181', 'NO', TO_TIMESTAMP('2022-02-25 14:02:28.909682', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('156', '201', 'EVENT_PARTICIPANTS', '101', 'project submission event has updated', '/api/co_curricular/101', 'YES', TO_TIMESTAMP('2022-02-23 04:27:05.559967', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('158', '201', 'EVENTS', '104', 'CSE 216 Project discuss group group is arranging seminar', '/api/seminar/104', 'YES', TO_TIMESTAMP('2022-02-23 04:31:25.468340', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('159', '202', 'EVENTS', '104', 'CSE 216 Project discuss group group is arranging seminar', '/api/seminar/104', 'YES', TO_TIMESTAMP('2022-02-23 04:31:25.468600', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('185', '201', 'LIKES', '182', 'ANUP BHOWMIK has liked your post', '/api/blog/242', 'YES', TO_TIMESTAMP('2022-02-23 04:45:12.030286', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('153', '202', 'LIKES', '162', 'NOSHIN NAWAL has commented your post', '/api/group_post/181/246', 'YES', TO_TIMESTAMP('2022-02-23 04:20:33.851348', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('186', '201', 'LIKES', '165', 'ANUP BHOWMIK has commented on your post', '/api/blog/242', 'YES', TO_TIMESTAMP('2022-02-23 04:45:23.337746', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('188', '201', 'LIKES', '183', 'TAMIM EHSAN has liked your post', '/api/job_post/244', 'YES', TO_TIMESTAMP('2022-02-23 04:47:34.693855', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('255', '201', 'LIKES', '210', 'MANEESHA SAHA has commented your post', '/api/group_post/181/263', 'YES', TO_TIMESTAMP('2022-02-24 16:32:49.251519', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('307', '201', 'POSTS', '285', 'MANEESHA SAHA has posted a job post.', '/api/job_post/285', 'YES', TO_TIMESTAMP('2022-02-25 13:25:46.677750', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('324', '202', 'EVENT_PARTICIPANTS', '141', 'An event that you are going has updated', '/api/co_curricular/141', 'YES', TO_TIMESTAMP('2022-02-25 14:31:20.849322', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('236', '204', 'POSTS', '262', 'MANEESHA SAHA has posted a blog.', '/api/blog/262', 'NO', TO_TIMESTAMP('2022-02-24 15:25:22.659012', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('237', '206', 'POSTS', '262', 'MANEESHA SAHA has posted a blog.', '/api/blog/262', 'NO', TO_TIMESTAMP('2022-02-24 15:25:22.659120', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('238', '223', 'POSTS', '262', 'MANEESHA SAHA has posted a blog.', '/api/blog/262', 'NO', TO_TIMESTAMP('2022-02-24 15:25:22.659193', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('254', '201', 'EVENT_PARTICIPANTS', '101', 'An event that you are going has updated', '/api/co_curricular/101', 'YES', TO_TIMESTAMP('2022-02-24 16:08:08.009266', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('319', '206', 'PENDING_MEMBERS', '182', 'MANEESHA SAHA wants to join BUET CSE 18', '/api/group/183', 'NO', TO_TIMESTAMP('2022-02-25 14:00:32.146645', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('320', '205', 'GROUP_MEMBERS', '221', 'Your join request in CSE 216 Project discuss group group is accepted', '/api/group/181', 'NO', TO_TIMESTAMP('2022-02-25 14:02:01.666745', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('308', '204', 'POSTS', '285', 'MANEESHA SAHA has posted a job post.', '/api/job_post/285', 'NO', TO_TIMESTAMP('2022-02-25 13:25:46.684812', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('309', '206', 'POSTS', '285', 'MANEESHA SAHA has posted a job post.', '/api/job_post/285', 'NO', TO_TIMESTAMP('2022-02-25 13:25:46.684916', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('310', '223', 'POSTS', '285', 'MANEESHA SAHA has posted a job post.', '/api/job_post/285', 'NO', TO_TIMESTAMP('2022-02-25 13:25:46.685003', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('311', '243', 'POSTS', '285', 'MANEESHA SAHA has posted a job post.', '/api/job_post/285', 'NO', TO_TIMESTAMP('2022-02-25 13:25:46.685086', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('312', '201', 'POSTS', '244', 'MANEESHA SAHA has applied for a job you posted. See the CV.', '/api/job_post/CV/244', 'YES', TO_TIMESTAMP('2022-02-25 13:33:20.473125', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('154', '201', 'EVENTS', '102', 'CSE 216 Project discuss group group is arranging a reunion', '/api/reunion/102', 'YES', TO_TIMESTAMP('2022-02-23 04:21:36.317602', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('155', '202', 'EVENTS', '102', 'CSE 216 Project discuss group group is arranging a reunion', '/api/reunion/102', 'YES', TO_TIMESTAMP('2022-02-23 04:21:36.317836', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('222', '202', 'GROUPS', '202', 'You are the admin of CSE 216 Project discuss group group now', '/api/group/181', 'YES', TO_TIMESTAMP('2022-02-24 08:53:38.541819', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('226', '223', 'USERS', '223', 'Welcome to ALUMNET. Click here to add info in your profile...', '/api/user/edit', 'YES', TO_TIMESTAMP('2022-02-24 15:14:46.092210', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('240', '202', 'LIKES', '243', 'NOSHIN NAWAL has liked your post', '/api/blog/262', 'YES', TO_TIMESTAMP('2022-02-24 15:31:05.780643', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('232', '201', 'LIKES', '242', 'NAZMUL  ISLAM has liked your post', '/api/blog/243', 'YES', TO_TIMESTAMP('2022-02-24 15:16:07.891227', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('239', '202', 'LIKES', '202', 'NOSHIN NAWAL has commented on your post', '/api/blog/262', 'YES', TO_TIMESTAMP('2022-02-24 15:30:59.319954', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('142', '201', 'USERS', '201', 'Welcome to ALUMNET. Click here to add info in your profile...', '/api/user/edit', 'YES', TO_TIMESTAMP('2022-02-23 03:35:01.126064', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('241', '202', 'FOLLOWS', '201', 'NOSHIN NAWAL has started to following you. Visit profile.', '/api/user/201', 'YES', TO_TIMESTAMP('2022-02-24 15:40:51.502685', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('242', '201', 'LIKES', '204', 'MANEESHA SAHA has commented on your post', '/api/job_post/244', 'YES', TO_TIMESTAMP('2022-02-24 15:40:58.846122', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('243', '201', 'LIKES', '205', 'MANEESHA SAHA has commented on your post', '/api/job_post/244', 'YES', TO_TIMESTAMP('2022-02-24 15:45:19.348969', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('244', '201', 'LIKES', '206', 'MANEESHA SAHA has commented on your post', '/api/merch/245', 'YES', TO_TIMESTAMP('2022-02-24 15:46:05.100341', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('250', '201', 'LIKES', '208', 'MANEESHA SAHA has commented your post', '/api/group_post/181/263', 'YES', TO_TIMESTAMP('2022-02-24 16:00:30.902327', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('261', '201', 'EVENT_PARTICIPANTS', '104', 'Oracle workshop event has updated', '/api/seminar/104', 'YES', TO_TIMESTAMP('2022-02-24 20:04:39.163797', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('262', '206', 'EVENT_PARTICIPANTS', '104', 'Oracle workshop event has updated', '/api/seminar/104', 'NO', TO_TIMESTAMP('2022-02-24 20:04:39.164610', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('191', '206', 'EVENTS', '105', 'BUET CSE 18 group is arranging seminar', '/api/seminar/105', 'YES', TO_TIMESTAMP('2022-02-23 04:52:17.231983', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('202', '201', 'POSTS', '244', 'AYESHA MOSTOFA has applied for a job you posted. See the CV.', '/api/job_post/CV/244', 'YES', TO_TIMESTAMP('2022-02-23 11:42:09.239400', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('223', '202', 'EVENTS', '121', 'CSE, BUET group is arranging a co-curricular event', '/api/co_curricular/121', 'YES', TO_TIMESTAMP('2022-02-24 14:00:41.260171', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('224', '205', 'EVENTS', '121', 'CSE, BUET group is arranging a co-curricular event', '/api/co_curricular/121', 'NO', TO_TIMESTAMP('2022-02-24 14:00:41.260442', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('225', '206', 'EVENTS', '122', 'BUET CSE 18 group is arranging a co-curricular event', '/api/co_curricular/122', 'NO', TO_TIMESTAMP('2022-02-24 14:38:02.085250', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('149', '202', 'POSTS', '245', 'NOSHIN NAWAL has posted a merchandise.', '/api/merch/245', 'YES', TO_TIMESTAMP('2022-02-23 04:17:34.086672', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('227', '201', 'FOLLOWS', '223', 'NAZMUL  ISLAM has started to following you. Visit profile.', '/api/user/223', 'YES', TO_TIMESTAMP('2022-02-24 15:15:21.917085', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('228', '209', 'FOLLOWS', '223', 'NAZMUL  ISLAM has started to following you. Visit profile.', '/api/user/223', 'NO', TO_TIMESTAMP('2022-02-24 15:15:28.533887', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('229', '202', 'FOLLOWS', '223', 'NAZMUL  ISLAM has started to following you. Visit profile.', '/api/user/223', 'YES', TO_TIMESTAMP('2022-02-24 15:15:33.905881', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('230', '207', 'FOLLOWS', '223', 'NAZMUL  ISLAM has started to following you. Visit profile.', '/api/user/223', 'NO', TO_TIMESTAMP('2022-02-24 15:15:40.300619', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('259', '202', 'EVENT_PARTICIPANTS', '121', 'Rag Concert event has updated', '/api/co_curricular/121', 'YES', TO_TIMESTAMP('2022-02-24 19:37:54.720955', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('264', '205', 'EVENTS', '123', 'CSE, BUET group is arranging a co-curricular event', '/api/co_curricular/123', 'NO', TO_TIMESTAMP('2022-02-24 20:21:02.516359', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('260', '205', 'EVENT_PARTICIPANTS', '121', 'Rag Concert event has updated', '/api/co_curricular/121', 'NO', TO_TIMESTAMP('2022-02-24 19:37:54.721464', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('263', '202', 'EVENTS', '123', 'CSE, BUET group is arranging a co-curricular event', '/api/co_curricular/123', 'YES', TO_TIMESTAMP('2022-02-24 20:21:02.516175', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('281', '241', 'USERS', '241', 'Welcome to ALUMNET. Click here to add info in your profile...', '/api/user/edit', 'NO', TO_TIMESTAMP('2022-02-25 06:36:30.997347', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('282', '242', 'USERS', '242', 'Welcome to ALUMNET. Click here to add info in your profile...', '/api/user/edit', 'NO', TO_TIMESTAMP('2022-02-25 06:36:53.396388', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('284', '202', 'FOLLOWS', '243', 'TASNIA BINTE MAMUN has started to following you. Visit profile.', '/api/user/243', 'YES', TO_TIMESTAMP('2022-02-25 06:57:00.348304', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('285', '242', 'FOLLOWS', '243', 'TASNIA BINTE MAMUN has started to following you. Visit profile.', '/api/user/243', 'NO', TO_TIMESTAMP('2022-02-25 06:57:08.731449', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('288', '243', 'FOLLOWS', '202', 'MANEESHA SAHA has started to following you. Visit profile.', '/api/user/202', 'NO', TO_TIMESTAMP('2022-02-25 06:58:03.347788', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."NOTIFICATION" VALUES ('289', '206', 'FOLLOWS', '202', 'MANEESHA SAHA has started to following you. Visit profile.', '/api/user/202', 'NO', TO_TIMESTAMP('2022-02-25 06:58:09.792899', 'SYYYY-MM-DD HH24:MI:SS:FF6'));

-- ----------------------------
-- Table structure for PENDING_MEMBERS
-- ----------------------------
DROP TABLE "TFUSER4"."PENDING_MEMBERS";
CREATE TABLE "TFUSER4"."PENDING_MEMBERS" (
  "PENDING_MEMBER_ID" NUMBER VISIBLE NOT NULL,
  "USER_ID" NUMBER VISIBLE NOT NULL,
  "GROUP_ID" NUMBER VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of PENDING_MEMBERS
-- ----------------------------
INSERT INTO "TFUSER4"."PENDING_MEMBERS" VALUES ('164', '201', '182');
INSERT INTO "TFUSER4"."PENDING_MEMBERS" VALUES ('145', '201', '183');
INSERT INTO "TFUSER4"."PENDING_MEMBERS" VALUES ('182', '202', '183');
INSERT INTO "TFUSER4"."PENDING_MEMBERS" VALUES ('146', '205', '183');
INSERT INTO "TFUSER4"."PENDING_MEMBERS" VALUES ('143', '206', '181');
INSERT INTO "TFUSER4"."PENDING_MEMBERS" VALUES ('144', '206', '182');

-- ----------------------------
-- Table structure for POSTS
-- ----------------------------
DROP TABLE "TFUSER4"."POSTS";
CREATE TABLE "TFUSER4"."POSTS" (
  "POST_ID" NUMBER VISIBLE NOT NULL,
  "POST_TYPE" VARCHAR2(50 BYTE) VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of POSTS
-- ----------------------------
INSERT INTO "TFUSER4"."POSTS" VALUES ('283', 'blog');
INSERT INTO "TFUSER4"."POSTS" VALUES ('284', 'blog');
INSERT INTO "TFUSER4"."POSTS" VALUES ('246', 'group_post');
INSERT INTO "TFUSER4"."POSTS" VALUES ('263', 'group_post');
INSERT INTO "TFUSER4"."POSTS" VALUES ('286', 'merch');
INSERT INTO "TFUSER4"."POSTS" VALUES ('242', 'blog');
INSERT INTO "TFUSER4"."POSTS" VALUES ('244', 'job_post');
INSERT INTO "TFUSER4"."POSTS" VALUES ('243', 'blog');
INSERT INTO "TFUSER4"."POSTS" VALUES ('285', 'job_post');
INSERT INTO "TFUSER4"."POSTS" VALUES ('262', 'blog');
INSERT INTO "TFUSER4"."POSTS" VALUES ('245', 'merch');

-- ----------------------------
-- Table structure for PUBLICATIONS
-- ----------------------------
DROP TABLE "TFUSER4"."PUBLICATIONS";
CREATE TABLE "TFUSER4"."PUBLICATIONS" (
  "PUBLICATION_ID" NUMBER VISIBLE NOT NULL,
  "USER_ID" NUMBER VISIBLE NOT NULL,
  "TITLE" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "AUTHORS" VARCHAR2(1024 BYTE) VISIBLE NOT NULL,
  "JOURNAL" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "PUBLICATION_DATE" DATE VISIBLE NOT NULL,
  "PDF_LINK" VARCHAR2(1000 BYTE) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of PUBLICATIONS
-- ----------------------------
INSERT INTO "TFUSER4"."PUBLICATIONS" VALUES ('61', '202', 'ALUMNET', 'N NAWAL, M SAHA', 'DB PROJECT', TO_DATE('2022-02-22 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), NULL);

-- ----------------------------
-- Table structure for RESEARCH_INTERESTS
-- ----------------------------
DROP TABLE "TFUSER4"."RESEARCH_INTERESTS";
CREATE TABLE "TFUSER4"."RESEARCH_INTERESTS" (
  "RESEARCH_INTEREST_ID" NUMBER VISIBLE NOT NULL,
  "RESEARCH_INTEREST" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "USER_ID" NUMBER VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of RESEARCH_INTERESTS
-- ----------------------------
INSERT INTO "TFUSER4"."RESEARCH_INTERESTS" VALUES ('81', 'MACHINE LEARNING', '202');

-- ----------------------------
-- Table structure for REUNIONS
-- ----------------------------
DROP TABLE "TFUSER4"."REUNIONS";
CREATE TABLE "TFUSER4"."REUNIONS" (
  "EVENT_ID" NUMBER VISIBLE NOT NULL,
  "EVENT_NAME" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "EVENT_DATE" DATE VISIBLE NOT NULL,
  "COVER_PHOTO" VARCHAR2(1000 BYTE) VISIBLE,
  "DESCRIPTION" CLOB VISIBLE NOT NULL,
  "LATITUDE" NUMBER VISIBLE,
  "LONGITUDE" NUMBER VISIBLE,
  "PLATFORM" VARCHAR2(1000 BYTE) VISIBLE,
  "FEES" NUMBER VISIBLE DEFAULT 0 NOT NULL,
  "BATCH" VARCHAR2(1000 BYTE) VISIBLE,
  "DEPARTMENT" VARCHAR2(1000 BYTE) VISIBLE,
  "GROUP_ID" NUMBER VISIBLE NOT NULL,
  "TIMESTAMP" TIMESTAMP(6) VISIBLE DEFAULT systimestamp NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of REUNIONS
-- ----------------------------
INSERT INTO "TFUSER4"."REUNIONS" VALUES ('103', 'CSE 18 Reunion', TO_DATE('2022-03-10 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2Fstatic%20images%2Fgroups-default-cover-photo.png?alt=media&token=cda807b8-ae12-44f5-99c5-88c32fd29dbd', 'we are arranging reunion for cse 18', '23.7508693', '90.4040051', NULL, '4', '18', 'CSE', '182', TO_TIMESTAMP('2022-02-23 04:27:42.935308', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."REUNIONS" VALUES ('102', 'Batch 08 Reunion', TO_DATE('2022-01-01 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2Fstatic%20images%2Fgroups-default-cover-photo.png?alt=media&token=cda807b8-ae12-44f5-99c5-88c32fd29dbd', 'Gather together!', '23.7305873', '90.3951009', NULL, '2000', '08', 'CSE', '181', TO_TIMESTAMP('2022-02-23 04:21:36.296392', 'SYYYY-MM-DD HH24:MI:SS:FF6'));

-- ----------------------------
-- Table structure for SCHEDULES
-- ----------------------------
DROP TABLE "TFUSER4"."SCHEDULES";
CREATE TABLE "TFUSER4"."SCHEDULES" (
  "SCHEDULE_ID" NUMBER VISIBLE NOT NULL,
  "EVENT_ID" NUMBER VISIBLE NOT NULL,
  "START_TIME" TIMESTAMP(6) VISIBLE NOT NULL,
  "END_TIME" TIMESTAMP(6) VISIBLE NOT NULL,
  "DESCRIPTION" VARCHAR2(1000 BYTE) VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of SCHEDULES
-- ----------------------------
INSERT INTO "TFUSER4"."SCHEDULES" VALUES ('82', '103', TO_TIMESTAMP('2022-02-25 20:49:00.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), TO_TIMESTAMP('2022-02-25 20:49:00.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), 'hello world');
INSERT INTO "TFUSER4"."SCHEDULES" VALUES ('43', '104', TO_TIMESTAMP('2022-02-24 10:31:00.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), TO_TIMESTAMP('2022-02-24 00:31:00.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), 'SQL');
INSERT INTO "TFUSER4"."SCHEDULES" VALUES ('81', '141', TO_TIMESTAMP('2022-03-02 11:30:00.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), TO_TIMESTAMP('2022-03-03 13:30:00.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), 'Section B1, B2');
INSERT INTO "TFUSER4"."SCHEDULES" VALUES ('42', '101', TO_TIMESTAMP('2022-02-23 15:00:00.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), TO_TIMESTAMP('2022-02-23 05:00:00.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), 'A1, A2');
INSERT INTO "TFUSER4"."SCHEDULES" VALUES ('41', '101', TO_TIMESTAMP('2022-02-23 10:00:00.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), TO_TIMESTAMP('2022-02-23 02:00:00.000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), 'B1, B2');

-- ----------------------------
-- Table structure for SEMINARS
-- ----------------------------
DROP TABLE "TFUSER4"."SEMINARS";
CREATE TABLE "TFUSER4"."SEMINARS" (
  "EVENT_ID" NUMBER VISIBLE NOT NULL,
  "EVENT_NAME" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "EVENT_DATE" DATE VISIBLE NOT NULL,
  "COVER_PHOTO" VARCHAR2(1000 BYTE) VISIBLE,
  "DESCRIPTION" CLOB VISIBLE NOT NULL,
  "LATITUDE" NUMBER VISIBLE,
  "LONGITUDE" NUMBER VISIBLE,
  "PLATFORM" VARCHAR2(1000 BYTE) VISIBLE,
  "FEES" NUMBER VISIBLE DEFAULT 0 NOT NULL,
  "TOPIC" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "SPECIAL_GUESTS" VARCHAR2(1000 BYTE) VISIBLE,
  "AVAILABLE_FOR" VARCHAR2(1000 BYTE) VISIBLE DEFAULT 'All' NOT NULL,
  "GROUP_ID" NUMBER VISIBLE NOT NULL,
  "TIMESTAMP" TIMESTAMP(6) VISIBLE DEFAULT systimestamp NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of SEMINARS
-- ----------------------------
INSERT INTO "TFUSER4"."SEMINARS" VALUES ('104', 'Oracle workshop', TO_DATE('2022-02-16 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2Fstatic%20images%2Fgroups-default-cover-photo.png?alt=media&token=cda807b8-ae12-44f5-99c5-88c32fd29dbd', 'work shop for newbie people', '23.7508693', '90.4040051', 'zoom', '100', 'DB project', 'Rifat Shahriyar', 'cse 18', '181', TO_TIMESTAMP('2022-02-23 04:31:25.447578', 'SYYYY-MM-DD HH24:MI:SS:FF6'));
INSERT INTO "TFUSER4"."SEMINARS" VALUES ('105', 'C Programming Workshop', TO_DATE('2022-02-26 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2Fstatic%20images%2Fgroups-default-cover-photo.png?alt=media&token=cda807b8-ae12-44f5-99c5-88c32fd29dbd', 'We are hosting a C programming contest for all. Participate now!', '23.72526703042176', '90.39490087478632', NULL, '0', 'Programming', 'Dr. Rifat Shahriyar', 'CSE-18', '183', TO_TIMESTAMP('2022-02-23 04:52:17.226207', 'SYYYY-MM-DD HH24:MI:SS:FF6'));

-- ----------------------------
-- Table structure for SKILLS
-- ----------------------------
DROP TABLE "TFUSER4"."SKILLS";
CREATE TABLE "TFUSER4"."SKILLS" (
  "SKILL_ID" NUMBER VISIBLE NOT NULL,
  "SKILL" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "USER_ID" NUMBER VISIBLE NOT NULL
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of SKILLS
-- ----------------------------
INSERT INTO "TFUSER4"."SKILLS" VALUES ('102', 'CODE', '202');
INSERT INTO "TFUSER4"."SKILLS" VALUES ('101', 'CODING', '201');

-- ----------------------------
-- Table structure for USERS
-- ----------------------------
DROP TABLE "TFUSER4"."USERS";
CREATE TABLE "TFUSER4"."USERS" (
  "USER_ID" NUMBER VISIBLE NOT NULL,
  "FIRST_NAME" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "LAST_NAME" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "DEPARTMENT" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "BATCH" NUMBER VISIBLE NOT NULL,
  "GENDER" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "CITY" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "STATE" VARCHAR2(1000 BYTE) VISIBLE,
  "COUNTRY" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "PHONE_NO" VARCHAR2(1000 BYTE) VISIBLE,
  "EMAIL" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "PASSWORD" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "ABOUT_ME" VARCHAR2(1000 BYTE) VISIBLE,
  "DATE_OF_BIRTH" DATE VISIBLE,
  "PROFILE_PICTURE" VARCHAR2(1000 BYTE) VISIBLE,
  "STUDENT_ID" VARCHAR2(1000 BYTE) VISIBLE,
  "HALL" VARCHAR2(1000 BYTE) VISIBLE,
  "FACEBOOK" VARCHAR2(1000 BYTE) VISIBLE,
  "TWITTER" VARCHAR2(1000 BYTE) VISIBLE,
  "LINKEDIN" VARCHAR2(1000 BYTE) VISIBLE,
  "GOOGLE_SCHOLAR" VARCHAR2(1000 BYTE) VISIBLE,
  "RESEARCH_GATE" VARCHAR2(1000 BYTE) VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of USERS
-- ----------------------------
INSERT INTO "TFUSER4"."USERS" VALUES ('202', 'MANEESHA', 'SAHA', 'Computer Science and Engineering', '2018', 'Female', 'DHAKA', NULL, 'BANGLADESH', NULL, 'mswarna28@gmail.com', '$2a$10$10HdNPt6D5oKWJHhBBNGl.JOeHJzcjP4hvVaNU6XvIH9hlB6pdyFS', 'I am currently at my 2nd year.', NULL, 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2F1645591491324-1614863422422.jpg?alt=media&token=b17c85f7-1853-49c8-8c6a-967f35d92d8f', '1805076', NULL, 'https://www.facebook.com/maneesha.saha28/', NULL, 'https://www.linkedin.com/in/maneesha-rani-saha-b0576a19b/', NULL, NULL);
INSERT INTO "TFUSER4"."USERS" VALUES ('204', 'AYESHA', 'MOSTOFA', 'Computer Science and Engineering', '2018', 'Female', 'DHAKA', NULL, 'BANGLADESH', NULL, 'ayesha@gmail.com', '$2a$10$LJ/dfrTvOCh966KvGQx24uQHwGjcttdLlAPcxwKTs0Ga5oynvcTrO', NULL, NULL, 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2Fstatic%20images%2Fdefault-profile-icon-24.jpg?alt=media&token=3826e640-5828-4e37-b9dd-2c4608c5a409
', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "TFUSER4"."USERS" VALUES ('205', 'FABIHA', 'TASNEEM', 'Computer Science and Engineering', '2018', 'Female', 'DHAKA', NULL, 'BANGLADESH', NULL, 'fabiha@gmail.com', '$2a$10$lVbeQv5n9OVgRs.ztgWr9eTD.NnItMdjjJeXtPnDGPSQyxztaklqK', NULL, NULL, 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2Fstatic%20images%2Fdefault-profile-icon-24.jpg?alt=media&token=3826e640-5828-4e37-b9dd-2c4608c5a409
', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "TFUSER4"."USERS" VALUES ('206', 'MASHIYAT', 'MAHJABIN', 'Computer Science and Engineering', '2018', 'Female', 'DHAKA', NULL, 'BANGLADESH', NULL, 'mashiyat@gmail.com', '$2a$10$lm70NK5sT87PMIwiX7u1a./39WUq1espHQ5ps2qmrF650HcXmuRs.', NULL, NULL, 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2F1645714371232-Annotation%202022-01-31%20112908.jpg?alt=media&token=d8c073b7-01b0-4f90-aa01-c89cde1099b2', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "TFUSER4"."USERS" VALUES ('207', 'ANUP', 'BHOWMIK', 'Computer Science and Engineering', '2018', 'Male', 'DHAKA', NULL, 'BANGLADESH', NULL, 'anup@gmail.com', '$2a$10$zszpaFbRhq.PFcg7xyL7reTijEHFb1kSu6t3LsAZNKX1e/2qqW9GO', NULL, NULL, 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2Fstatic%20images%2Fdefault-profile-icon-24.jpg?alt=media&token=3826e640-5828-4e37-b9dd-2c4608c5a409
', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "TFUSER4"."USERS" VALUES ('208', 'HASAN', 'MASUM', 'Computer Science and Engineering', '2018', 'Male', 'DHAKA', NULL, 'BANGLADESH', NULL, 'hasan@gmail.com', '$2a$10$u8NbRXqxzpfwdHPW0VeB7uQGMK8B36Gkmz1Cn2tuS8Ik.Z.2e18s.', NULL, NULL, 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2Fstatic%20images%2Fdefault-profile-icon-24.jpg?alt=media&token=3826e640-5828-4e37-b9dd-2c4608c5a409
', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "TFUSER4"."USERS" VALUES ('209', 'TAMIM', 'EHSAN', 'Computer Science and Engineering', '2018', 'Male', 'DHAKA', NULL, 'BANGLADESH', NULL, 'tamim@gmail.com', '$2a$10$L28vhx6hRVR4KA2ODrN0IulBj0IfYS8f2Jl3A4Wv1P8UMeuF.zNTi', NULL, NULL, 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2Fstatic%20images%2Fdefault-profile-icon-24.jpg?alt=media&token=3826e640-5828-4e37-b9dd-2c4608c5a409
', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "TFUSER4"."USERS" VALUES ('210', 'NAFISA', 'KHAN', 'Electrical and Electronic Engineering', '2018', 'Female', 'DHAKA', NULL, 'BANGLADESH', NULL, 'nafisa@gmail.com', '$2a$10$y3/r8RkW4TRhC2GBUgzAcOH4aQ3z4Kx2yJ9vkOKi06J9A2/gLMw.W', NULL, NULL, 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2Fstatic%20images%2Fdefault-profile-icon-24.jpg?alt=media&token=3826e640-5828-4e37-b9dd-2c4608c5a409
', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "TFUSER4"."USERS" VALUES ('243', 'TASNIA BINTE', 'MAMUN', 'Biomedical Engineering', '2018', 'Female', 'DHAKA', NULL, 'BANGLADESH', NULL, 'tasnia@gmail.com', '$2a$10$UYKAv44ThXOs1drKqCSqluJV1fzTKs7dM6/fr67ZAR0aIssG0bUHC', NULL, NULL, 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2Fstatic%20images%2Fdefault-profile-icon-24.jpg?alt=media&token=3826e640-5828-4e37-b9dd-2c4608c5a409
', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "TFUSER4"."USERS" VALUES ('223', 'NAZMUL ', 'ISLAM', 'Computer Science and Engineering', '2018', 'Male', 'NOAKHALI', NULL, 'BANGLADESH', NULL, 'nazmul@gmail.com', '$2a$10$8a1.4DhqW3lZZnCcaREM6OcyI7pHr6FYz.XkR/hqjcT/gjOsU6jQW', NULL, NULL, 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2Fstatic%20images%2Fdefault-profile-icon-24.jpg?alt=media&token=3826e640-5828-4e37-b9dd-2c4608c5a409
', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "TFUSER4"."USERS" VALUES ('201', 'NOSHIN', 'NAWAL', 'Computer Science and Engineering', '2018', 'Female', 'DHAKA', NULL, 'BANGLADESH', NULL, 'noshin@gmail.com', '$2a$10$Aw7PbZVu249WIlefXivHi.SMj.QYW1QVJSnipt5AtpYyaXsIXThIK', NULL, NULL, 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2F1645587642737-myphoto%20(2).jpg?alt=media&token=52b49e22-b41e-4191-909a-074b36600db7', '1805061', 'CHHATRI HALL', 'https://www.facebook.com/nawal.faiza03', NULL, NULL, NULL, NULL);
INSERT INTO "TFUSER4"."USERS" VALUES ('241', 'SAMIHA', 'TASNEEM', 'Civil Engineering', '2018', 'Female', 'DHAKA', NULL, 'BANGLADESH', NULL, 'samiha@gmail.com', '$2a$10$Wl.E95V.fjQErxykiqGFyu.Yszx6nm9QG6YUTEFhJxTwb0vjCnWiy', NULL, NULL, 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2Fstatic%20images%2Fdefault-profile-icon-24.jpg?alt=media&token=3826e640-5828-4e37-b9dd-2c4608c5a409
', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "TFUSER4"."USERS" VALUES ('242', 'TASNIM', 'ALAM', 'Chemical Engineering', '2018', 'Female', 'DHAKA', NULL, 'BANGLADESH', NULL, 'subah@gmail.com', '$2a$10$eLDHm22QVVTY3A5nBvpBL.0MFu7qefjt.jBlhEjc/wqPA/kV3QwlO', NULL, NULL, 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2Fstatic%20images%2Fdefault-profile-icon-24.jpg?alt=media&token=3826e640-5828-4e37-b9dd-2c4608c5a409
', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for WORK_EXPERIENCE
-- ----------------------------
DROP TABLE "TFUSER4"."WORK_EXPERIENCE";
CREATE TABLE "TFUSER4"."WORK_EXPERIENCE" (
  "WORK_EXPERIENCE_ID" NUMBER VISIBLE NOT NULL,
  "USER_ID" NUMBER VISIBLE NOT NULL,
  "ORGANIZATION" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "EMPLOYMENT_TYPE" VARCHAR2(50 BYTE) VISIBLE NOT NULL,
  "DESIGNATION" VARCHAR2(1000 BYTE) VISIBLE NOT NULL,
  "START_DATE" DATE VISIBLE NOT NULL,
  "END_DATE" DATE VISIBLE
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of WORK_EXPERIENCE
-- ----------------------------
INSERT INTO "TFUSER4"."WORK_EXPERIENCE" VALUES ('141', '205', 'IEEE CS BUET SBC', 'Part-Time', 'PUBLICATION COMMITTEE CO-ORDINATOR', TO_DATE('2021-02-23 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO "TFUSER4"."WORK_EXPERIENCE" VALUES ('121', '202', 'IEEE CS BUET SBC', 'Part-Time', 'MEDIA CO-ORDINATOR', TO_DATE('2022-01-04 00:00:00', 'SYYYY-MM-DD HH24:MI:SS'), NULL);

-- ----------------------------
-- Function structure for ADD_ACHIEVEMENT
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."ADD_ACHIEVEMENT" AS
BEGIN
    A_ACHIEVEMENT_ID := ACHIEVEMENT_SEQ.NEXTVAL;
    INSERT INTO
        ACHIEVEMENTS(ACHIEVEMENT_ID, USER_ID, ACHIEVEMENT_NAME, ACHIEVEMENT_DATE, POSITION, ORGANIZED_BY)
    VALUES
        (A_ACHIEVEMENT_ID, A_USER_ID, UPPER(A_ACHIEVEMENT_NAME), TO_DATE(A_ACHIEVEMENT_DATE, 'YYYY-MM-DD'), (A_POSITION), (A_ORGANIZED_BY));

    RESULT := 'Achievement is added';

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RESULT := 'Achievement already exists';
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for ADD_BLOG
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."ADD_BLOG" AS
BEGIN
    B_POST_ID := POST_SEQ.NEXTVAL;
    INSERT INTO
        POSTS(POST_ID, POST_TYPE)
    VALUES (B_POST_ID, 'blog');

    INSERT INTO BLOGS(POST_ID, USER_ID, TOPIC, TITLE, DESCRIPTION)
    VALUES (B_POST_ID, B_USER_ID, UPPER(B_TOPIC), B_TITLE, B_DESCRIPTION);
    RESULT := 'Blog is added';

EXCEPTION
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for ADD_CO_CURRICULAR
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."ADD_CO_CURRICULAR" AS
BEGIN
    CC_EVENT_ID := EVENT_SEQ.NEXTVAL;
    INSERT INTO
        EVENTS(EVENT_ID, EVENT_TYPE)
    VALUES (CC_EVENT_ID, 'co_curricular');

    INSERT INTO CO_CURRICULARS(EVENT_ID, EVENT_NAME, EVENT_DATE, COVER_PHOTO, DESCRIPTION, LATITUDE, LONGITUDE, PLATFORM, FEES, AVAILABLE_FOR, GROUP_ID, TIMESTAMP)
    VALUES (CC_EVENT_ID, CC_EVENT_NAME, TO_DATE(CC_EVENT_DATE,'YYYY-MM-DD'), CC_COVER_PHOTO, CC_DESCRIPTION, CC_LATITUDE, CC_LONGITUDE, CC_PLATFORM, CC_FEES,
                CC_AVAILABLE_FOR, CC_GROUP_ID, systimestamp);
    RESULT := 'Co-curricular event is added';

EXCEPTION
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for ADD_EDUCATION
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."ADD_EDUCATION" AS
BEGIN
    E_EDUCATION_ID := EDUCATION_SEQ.NEXTVAL;
    INSERT INTO
        EDUCATION(EDUCATION_ID, USER_ID, INSTITUTE, FIELD_OF_STUDY, DEGREE, GRADE, START_DATE, END_DATE)
    VALUES
        (E_EDUCATION_ID, E_USER_ID, UPPER(E_INSTITUTE), (E_FIELD_OF_STUDY), UPPER(E_DEGREE), (E_GRADE), TO_DATE(E_START_DATE, 'YYYY-MM-DD'), TO_DATE(E_END_DATE, 'YYYY-MM-DD'));

    RESULT := 'Education info is added';

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RESULT := 'Education info already exists';
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for ADD_GROUP_POST
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."ADD_GROUP_POST" AS
BEGIN
    GP_POST_ID := POST_SEQ.NEXTVAL;
    INSERT INTO
        POSTS(POST_ID, POST_TYPE)
    VALUES (GP_POST_ID, 'group_post');

    SELECT GROUP_MEMBER_ID INTO GP_GROUP_MEMBER_ID
    FROM GROUP_MEMBERS
    WHERE GROUP_ID = GP_GROUP_ID AND USER_ID = GP_USER_ID;

    INSERT INTO GROUP_POSTS(POST_ID, GROUP_MEMBER_ID, TOPIC, DESCRIPTION)
    VALUES (GP_POST_ID, GP_GROUP_MEMBER_ID, UPPER(GP_TOPIC), GP_DESCRIPTION);
    RESULT := 'Group post is added';

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RESULT := 'No such group member';
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for ADD_INTEREST
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."ADD_INTEREST" AS
BEGIN
    I_INTEREST_ID := INTEREST_SEQ.NEXTVAL;
    INSERT INTO
        INTERESTS(INTEREST_ID, INTEREST, USER_ID)
    VALUES
        (I_INTEREST_ID, UPPER(I_INTEREST), I_USER_ID);

    RESULT := 'Interest is added';

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RESULT := 'Interest already exists';
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for ADD_JOB_POST
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."ADD_JOB_POST" AS
BEGIN
    JP_POST_ID := POST_SEQ.NEXTVAL;
    INSERT INTO
        POSTS(POST_ID, POST_TYPE)
    VALUES (JP_POST_ID, 'job_post');

    INSERT INTO JOB_POSTS(POST_ID, USER_ID, COMPANY_NAME, JOB_TYPE, REMOTE, LATITUDE, LONGITUDE, REQUIREMENTS, DESIGNATION, EXPECTED_SALARY, VACANCY, EMAIL, PHONE_NO)
    VALUES (JP_POST_ID, JP_USER_ID, UPPER(JP_COMPANY_NAME), JP_JOB_TYPE, JP_REMOTE, JP_LATITUDE, JP_LONGITUDE, JP_REQUIREMENTS, JP_DESIGNATION, JP_EXPECTED_SALARY, JP_VACANCY, JP_EMAIL, JP_PHONE_NO);
    RESULT := 'Job post is added';

EXCEPTION
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for ADD_MERCH
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."ADD_MERCH" AS
BEGIN
    M_POST_ID := POST_SEQ.NEXTVAL;
    INSERT INTO
        POSTS(POST_ID, POST_TYPE)
    VALUES (M_POST_ID, 'merch');

    INSERT INTO MERCHS(POST_ID, USER_ID, PRODUCT_NAME, IMAGE, PRICE, EMAIL, PHONE_NO, DESCRIPTION)
    VALUES (M_POST_ID, M_USER_ID, UPPER(M_PRODUCT_NAME), M_IMAGE, M_PRICE, M_EMAIL, M_PHONE_NO, M_DESCRIPTION);
    RESULT := 'Merch is added';

EXCEPTION
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for ADD_PENDING_MEMBER
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."ADD_PENDING_MEMBER" AS
BEGIN
    SELECT COUNT(*) INTO CNT FROM GROUP_MEMBERS
    WHERE USER_ID = PM_USER_ID AND GROUP_ID = PM_GROUP_ID;
    IF (CNT = 0) THEN
        INSERT INTO PENDING_MEMBERS(PENDING_MEMBER_ID, USER_ID, GROUP_ID)
        VALUES (PENDING_MEMBER_SEQ.nextval, PM_USER_ID, PM_GROUP_ID);
        RESULT := 'Request successfully added';
    ELSE RESULT := 'Group member already exists';
    end if;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RESULT := 'Pending member already exists';
    WHEN OTHERS THEN
        RESULT := 'Please fill up the fields correctly';
END;
/

-- ----------------------------
-- Function structure for ADD_PUBLICATION
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."ADD_PUBLICATION" AS
BEGIN
    P_PUBLICATION_ID := PUBLICATION_SEQ.NEXTVAL;
    INSERT INTO
        PUBLICATIONS(PUBLICATION_ID, USER_ID, TITLE, AUTHORS, JOURNAL, PUBLICATION_DATE, PDF_LINK)
    VALUES
        (P_PUBLICATION_ID, P_USER_ID, UPPER(P_TITLE), UPPER(P_AUTHORS), UPPER(P_JOURNAL), TO_DATE(P_PUBLICATION_DATE,'YYYY-MM-DD'), P_PDF_LINK);

    RESULT := 'Publication info is added';

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RESULT := 'Publication info already exists';
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for ADD_RESEARCH_INTEREST
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."ADD_RESEARCH_INTEREST" AS
BEGIN
    RI_RESEARCH_INTEREST_ID := RESEARCH_INTEREST_SEQ.NEXTVAL;
    INSERT INTO
        RESEARCH_INTERESTS(RESEARCH_INTEREST_ID, RESEARCH_INTEREST, USER_ID)
    VALUES
        (RI_RESEARCH_INTEREST_ID, UPPER(RI_RESEARCH_INTEREST), RI_USER_ID);

    RESULT := 'Research Interest is added';

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RESULT := 'Research Interest already exists';
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for ADD_REUNION
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."ADD_REUNION" AS
BEGIN
    R_EVENT_ID := EVENT_SEQ.NEXTVAL;
    INSERT INTO
        EVENTS(EVENT_ID, EVENT_TYPE)
    VALUES (R_EVENT_ID, 'reunion');

    INSERT INTO REUNIONS(EVENT_ID, EVENT_NAME, EVENT_DATE, COVER_PHOTO, DESCRIPTION, LATITUDE, LONGITUDE, PLATFORM, FEES, BATCH, DEPARTMENT, GROUP_ID)
    VALUES (R_EVENT_ID, R_EVENT_NAME, TO_DATE(R_EVENT_DATE, 'YYYY-MM-DD'), R_COVER_PHOTO, R_DESCRIPTION, R_LATITUDE, R_LONGITUDE, R_PLATFORM, R_FEES, R_BATCH, R_DEPARTMENT, R_GROUP_ID);
    RESULT := 'Reunion event is added';

EXCEPTION
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for ADD_SEMINAR
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."ADD_SEMINAR" AS
BEGIN
    S_EVENT_ID := EVENT_SEQ.NEXTVAL;
    INSERT INTO
        EVENTS(EVENT_ID, EVENT_TYPE)
    VALUES (S_EVENT_ID, 'seminar');

    INSERT INTO SEMINARS(EVENT_ID, EVENT_NAME, EVENT_DATE, COVER_PHOTO, DESCRIPTION, LATITUDE, LONGITUDE, PLATFORM, FEES, TOPIC, SPECIAL_GUESTS, AVAILABLE_FOR, GROUP_ID)
    VALUES (S_EVENT_ID, S_EVENT_NAME, TO_DATE(S_EVENT_DATE, 'YYYY-MM-DD'),S_COVER_PHOTO, S_DESCRIPTION, S_LATITUDE, S_LONGITUDE,
                        S_PLATFORM, S_FEES, S_TOPIC, S_SPECIAL_GUESTS, S_AVAILABLE_FOR, S_GROUP_ID);

    RESULT := 'Seminar event is added';

EXCEPTION
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for ADD_SKILL
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."ADD_SKILL" AS
BEGIN
    S_SKILL_ID := SKILL_SEQ.NEXTVAL;
    INSERT INTO
        SKILLS(SKILL_ID, SKILL, USER_ID)
    VALUES
        (S_SKILL_ID, UPPER(S_SKILL), S_USER_ID);

    RESULT := 'Skill is added';

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RESULT := 'Skill already exists';
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for ADD_WORK_EXPERIENCE
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."ADD_WORK_EXPERIENCE" AS
BEGIN
    WE_WORK_EXPERIENCE_ID := WORK_EXPERIENCE_SEQ.NEXTVAL;
    INSERT INTO
        WORK_EXPERIENCE(WORK_EXPERIENCE_ID, USER_ID, ORGANIZATION, EMPLOYMENT_TYPE, DESIGNATION, START_DATE, END_DATE)
    VALUES
        (WE_WORK_EXPERIENCE_ID, WE_USER_ID, UPPER(WE_ORGANIZATION), WE_EMPLOYMENT_TYPE, UPPER(WE_DESIGNATION),  TO_DATE(WE_START_DATE, 'YYYY-MM-DD'), TO_DATE(WE_END_DATE, 'YYYY-MM-DD'));

    RESULT := 'Work experience is added';

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RESULT := 'Work experience already exists';
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for CREATE_CV
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."CREATE_CV" AS
BEGIN
    SELECT FIRST_NAME || ' ' || LAST_NAME INTO U_NAME
    FROM USERS
    WHERE USER_ID = U_USER_ID;

    SELECT FIRST_NAME || ' ' || LAST_NAME INTO U_NAME
    FROM USERS
    WHERE USER_ID = U_USER_ID;

    SELECT GENDER INTO U_GENDER
    FROM USERS
    WHERE USER_ID = U_USER_ID;

    SELECT BATCH INTO U_BATCH
    FROM USERS
    WHERE USER_ID = U_USER_ID;

    SELECT DEPARTMENT INTO U_DEPARTMENT
    FROM USERS
    WHERE USER_ID = U_USER_ID;

    SELECT USERS.CITY || ', ' || COUNTRY INTO U_ADDRESS
    FROM USERS
    WHERE USER_ID = U_USER_ID;

    SELECT EMAIL INTO U_EMAIL
    FROM USERS
    WHERE USER_ID = U_USER_ID;

    RESULT := '---PERSONAL INFO---' || chr(10);
    RESULT := RESULT || 'Name : ' || U_NAME || chr(10);
    RESULT := RESULT || 'Email : ' || U_EMAIL || chr(10);
    RESULT := RESULT || 'Department : ' || U_DEPARTMENT || chr(10);
    RESULT := RESULT || 'Batch : ' || U_BATCH || chr(10);
    RESULT := RESULT || 'Gender : ' || U_GENDER || chr(10);
    RESULT := RESULT || 'Address : ' || U_ADDRESS || chr(10)||chr(10);

    SELECT COUNT(*) INTO WORK_EXPERIENCE_COUNT
    FROM WORK_EXPERIENCE
    WHERE USER_ID = U_USER_ID;
    IF WORK_EXPERIENCE_COUNT > 0 THEN
        i := 1;
        RESULT :=RESULT|| '---WORK EXPERIENCE---' || chr(10);
        FOR WE IN (SELECT * FROM WORK_EXPERIENCE WHERE USER_ID = U_USER_ID ORDER BY START_DATE DESC OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY)
        LOOP
            RESULT := RESULT || i ||'. ' || WE.DESIGNATION || ' (' || WE.EMPLOYMENT_TYPE || ')' || chr(10);
            RESULT := RESULT ||'Organization : ' || WE.ORGANIZATION || chr(10);
            RESULT := RESULT || WE.START_DATE || ' - ';
            IF WE.END_DATE IS NULL THEN
                RESULT := RESULT || 'now' || chr(10);
            ELSE RESULT := RESULT || WE.END_DATE || chr(10);
            end if;
            i:= i+1;
        end loop;
        RESULT := RESULT || chr(10);
    end if;

    SELECT COUNT(*) INTO EDUCATION_COUNT
    FROM EDUCATION
    WHERE USER_ID = U_USER_ID;
    IF EDUCATION_COUNT > 0 THEN
        i := 1;
        RESULT := RESULT || '---EDUCATION---' || chr(10);
        FOR E IN (SELECT * FROM EDUCATION WHERE USER_ID = U_USER_ID ORDER BY START_DATE DESC OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY)
        LOOP
            RESULT := RESULT || i ||'. ' || E.DEGREE || chr(10);
            RESULT := RESULT ||'Institute : '|| E.INSTITUTE || chr(10);
            IF(E.GRADE IS NOT NULL ) THEN
                RESULT := RESULT ||'Grade : '|| E.GRADE || chr(10);
            end if;
            RESULT := RESULT || E.START_DATE || ' - ';
            IF E.END_DATE IS NULL THEN
                RESULT := RESULT || 'now' || chr(10);
            ELSE RESULT := RESULT || E.END_DATE || chr(10);
            end if;
            i:= i+1;
        end loop;
        RESULT := RESULT || chr(10);
    end if;

    SELECT COUNT(*) INTO PUBLICATION_COUNT
    FROM PUBLICATIONS
    WHERE USER_ID = U_USER_ID;
    IF PUBLICATION_COUNT > 0 THEN
        i := 1;
        RESULT := RESULT || '---PUBLICATIONS---' || chr(10);
        FOR P IN (SELECT * FROM PUBLICATIONS WHERE USER_ID = U_USER_ID ORDER BY PUBLICATION_DATE DESC OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY)
        LOOP
            RESULT := RESULT || i ||'. ' || P.TITLE || chr(10);
            RESULT := RESULT ||'Journal : '|| P.JOURNAL ||' ('||P.PUBLICATION_DATE||')'||chr(10);
            RESULT := RESULT ||'Authors : '|| P.AUTHORS || chr(10);
            i:= i+1;
        end loop;
        RESULT := RESULT || chr(10);
    end if;

    SELECT COUNT(*) INTO ACHIEVEMENT_COUNT
    FROM ACHIEVEMENTS
    WHERE USER_ID = U_USER_ID;
    IF ACHIEVEMENT_COUNT > 0 THEN
        i := 1;
        RESULT := RESULT || '---ACHIEVEMENTS---' || chr(10);
        FOR A IN (SELECT * FROM ACHIEVEMENTS WHERE USER_ID = U_USER_ID ORDER BY ACHIEVEMENT_ID DESC OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY)
        LOOP
            RESULT := RESULT || i ||'. ' || A.ACHIEVEMENT_NAME ||' ('||A.ACHIEVEMENT_DATE||')'||chr(10);
            IF A.POSITION IS NOT NULL THEN
                RESULT := RESULT ||'Position : '|| A.POSITION || chr(10);
            end if;
            i:= i+1;
        end loop;
        RESULT := RESULT || chr(10);
    end if;

    SELECT COUNT(*) INTO PUBLICATION_COUNT
    FROM PUBLICATIONS
    WHERE USER_ID = U_USER_ID;
    IF PUBLICATION_COUNT > 0 THEN
        i := 1;
        RESULT := RESULT || '---PUBLICATIONS---' || chr(10);
        FOR P IN (SELECT * FROM PUBLICATIONS WHERE USER_ID = U_USER_ID ORDER BY PUBLICATION_DATE DESC OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY)
        LOOP
            RESULT := RESULT || i ||'. ' || P.TITLE || chr(10);
            RESULT := RESULT ||'Journal : '|| P.JOURNAL ||' ('||P.PUBLICATION_DATE||')'||chr(10);
            RESULT := RESULT ||'Authors : '|| P.AUTHORS || chr(10);
            i:= i+1;
        end loop;
        RESULT := RESULT || chr(10);
    end if;

    SELECT COUNT(*) INTO RESEARCH_INTEREST_COUNT
    FROM RESEARCH_INTERESTS
    WHERE USER_ID = U_USER_ID;
    IF RESEARCH_INTEREST_COUNT > 0 THEN
        i := 1;
        RESULT := RESULT || '---RESEARCH INTEREST---' || chr(10);
        FOR RI IN (SELECT * FROM RESEARCH_INTERESTS WHERE USER_ID = U_USER_ID OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY)
        LOOP
            RESULT := RESULT || i ||'. ' || RI.RESEARCH_INTEREST ||'   ';
            i:= i+1;
        end loop;
        RESULT := RESULT || chr(10);
    end if;

    SELECT COUNT(*) INTO SKILL_COUNT
    FROM SKILLS
    WHERE USER_ID = U_USER_ID;
    IF SKILL_COUNT > 0 THEN
        i := 1;
        RESULT := RESULT || '---SKILL---' || chr(10);
        FOR S IN (SELECT * FROM SKILLS WHERE USER_ID = U_USER_ID OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY)
        LOOP
            RESULT := RESULT || i ||'. ' || S.SKILL ||'   ';
            i:= i+1;
        end loop;
        RESULT := RESULT || chr(10);
    end if;

    SELECT COUNT(*) INTO INTEREST_COUNT
    FROM INTERESTS
    WHERE USER_ID = U_USER_ID;
    IF INTEREST_COUNT > 0 THEN
        i := 1;
        RESULT := RESULT || '---INTEREST---' || chr(10);
        FOR INT IN (SELECT * FROM INTERESTS WHERE USER_ID = U_USER_ID OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY)
        LOOP
            RESULT := RESULT || i ||'. ' || INT.INTEREST ||'   ';
            i:= i+1;
        end loop;
        RESULT := RESULT || chr(10);
    end if;
END;
/

-- ----------------------------
-- Function structure for CREATE_GROUP
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."CREATE_GROUP" AS
BEGIN
    G_GROUP_ID := GROUP_SEQ.NEXTVAL;
    INSERT INTO
        GROUPS(GROUP_ID, GROUP_NAME, DESCRIPTION, COVER_PHOTO, ADMIN_ID)
    VALUES
        (G_GROUP_ID, G_GROUP_NAME, G_DESCRIPTION, G_COVER_PHOTO, G_ADMIN_ID);

    GM_GROUP_MEMBER_ID := GROUP_MEMBER_SEQ.NEXTVAL;
    INSERT INTO
        GROUP_MEMBERS(GROUP_MEMBER_ID, USER_ID, GROUP_ID)
    VALUES
        (GM_GROUP_MEMBER_ID, G_ADMIN_ID, G_GROUP_ID);

    RESULT := 'Group is successfully created';

EXCEPTION
    WHEN OTHERS THEN
        RESULT := 'Please enter the fields correctly';
END;
/

-- ----------------------------
-- Function structure for CREATE_USER
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."CREATE_USER" AS
BEGIN
    U_USER_ID := USER_SEQ.NEXTVAL;
    INSERT INTO
        USERS(USER_ID, FIRST_NAME, LAST_NAME, DEPARTMENT, BATCH, GENDER, CITY, STATE, COUNTRY, EMAIL, PASSWORD, PROFILE_PICTURE)
    VALUES
        (U_USER_ID, UPPER(U_FIRST_NAME), UPPER(U_LAST_NAME), U_DEPARTMENT, U_BATCH, U_GENDER, UPPER(U_CITY), UPPER(U_STATE),
                    UPPER(U_COUNTRY), LOWER(U_EMAIL), U_PASSWORD, 'https://firebasestorage.googleapis.com/v0/b/alumnet-dde22.appspot.com/o/images%2Fstatic%20images%2Fdefault-profile-icon-24.jpg?alt=media&token=3826e640-5828-4e37-b9dd-2c4608c5a409
');

    RESULT := 'Registration is successful';

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RESULT := 'Email already exists';
    WHEN OTHERS THEN
        RESULT := 'Please enter the fields correctly';
END;
/

-- ----------------------------
-- Function structure for DELETE_GROUP_MEMBER
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."DELETE_GROUP_MEMBER" AS
BEGIN
    SELECT ADMIN_ID INTO G_ADMIN_ID
    FROM GROUPS
    WHERE GROUP_ID = GM_GROUP_ID;

    IF GM_USER_ID = G_ADMIN_ID THEN
        RESULT := 'Cannot delete admin';
    ELSE
        DELETE FROM GROUP_MEMBERS
        WHERE GROUP_ID = GM_GROUP_ID AND USER_ID = GM_USER_ID;

        RESULT := 'Deleted group member';
    end if;

EXCEPTION
    WHEN OTHERS THEN
        RESULT := 'Please enter the fields correctly';
END;
/

-- ----------------------------
-- Function structure for IS_GOING
-- ----------------------------
CREATE OR REPLACE
FUNCTION "TFUSER4"."IS_GOING" AS
BEGIN
    SELECT COUNT(*) INTO CNT FROM EVENT_PARTICIPANTS
    WHERE USER_ID = EP_USER_ID AND EVENT_ID = EP_EVENT_ID;
    IF CNT = 0 THEN
        RET := 'NO';
    ELSE
        RET := 'YES';
    end if;
    RETURN RET;
end;
/

-- ----------------------------
-- Function structure for IS_GROUP_MEMBER
-- ----------------------------
CREATE OR REPLACE
FUNCTION "TFUSER4"."IS_GROUP_MEMBER" AS
BEGIN
    SELECT COUNT(*) INTO CNT FROM GROUP_MEMBERS
    WHERE USER_ID = GM_USER_ID AND GROUP_ID= GM_GROUP_ID;
    IF CNT = 0 THEN
        RET := 'NO';
    ELSE
        RET := 'YES';
    end if;
    RETURN RET;
end;
/

-- ----------------------------
-- Function structure for IS_LIKED
-- ----------------------------
CREATE OR REPLACE
FUNCTION "TFUSER4"."IS_LIKED" AS
BEGIN
    SELECT COUNT(*) INTO CNT FROM LIKES
    WHERE USER_ID = L_USER_ID AND POST_ID= L_POST_ID;
    IF CNT = 0 THEN
        RET := 'NO';
    ELSE
        RET := 'YES';
    end if;
    RETURN RET;
end;
/

-- ----------------------------
-- Function structure for IS_NEARBY
-- ----------------------------
CREATE OR REPLACE
FUNCTION "TFUSER4"."IS_NEARBY" AS
BEGIN
    IF LATITUDE2 is null OR LONGITUDE2 is null THEN
        RETURN 'YES';
    ELSIF LATITUDE1 is null OR LONGITUDE1 is null THEN
        RETURN 'NO';
    ELSIF SQRT(POWER(LATITUDE1-LATITUDE2, 2) + POWER(LONGITUDE1-LONGITUDE2, 2)) <=0.05 THEN
        RETURN 'YES';
    ELSE RETURN 'NO';
    end if;
end;
/

-- ----------------------------
-- Function structure for IS_PENDING_MEMBER
-- ----------------------------
CREATE OR REPLACE
FUNCTION "TFUSER4"."IS_PENDING_MEMBER" AS
BEGIN
    SELECT COUNT(*) INTO CNT FROM PENDING_MEMBERS
    WHERE USER_ID = PM_USER_ID AND GROUP_ID= PM_GROUP_ID;
    IF CNT = 0 THEN
        RET := 'NO';
    ELSE
        RET := 'YES';
    end if;
    RETURN RET;
end;
/

-- ----------------------------
-- Function structure for PROCESS_PENDING_MEMBER
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."PROCESS_PENDING_MEMBER" AS
BEGIN
    SELECT PENDING_MEMBER_ID INTO OKAY
    FROM PENDING_MEMBERS
    WHERE USER_ID = PM_USER_ID AND GROUP_ID = PM_GROUP_ID;

    DELETE FROM PENDING_MEMBERS
    WHERE USER_ID = PM_USER_ID AND GROUP_ID = PM_GROUP_ID;
    IF STATUS = 'accept' THEN
        INSERT INTO GROUP_MEMBERS(GROUP_MEMBER_ID, USER_ID, GROUP_ID)
        VALUES (GROUP_MEMBER_SEQ.nextval, PM_USER_ID, PM_GROUP_ID);
        RESULT := 'Group Member is successfully accepted';
    ELSIF STATUS = 'reject' THEN
        RESULT := 'Pending request is rejected';
    end if;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RESULT := 'No such pending request exists';
    WHEN DUP_VAL_ON_INDEX THEN
        RESULT := 'Group member already exists';
    WHEN OTHERS THEN
        RESULT := 'Please fill up the fields correctly';
END;
/

-- ----------------------------
-- Function structure for UPDATE_ACHIEVEMENT
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."UPDATE_ACHIEVEMENT" AS
BEGIN
    UPDATE achievements
        SET
            achievement_name = UPPER(A_ACHIEVEMENT_NAME),
            achievement_date = TO_DATE(A_ACHIEVEMENT_DATE, 'YYYY-MM-DD'),
            position = (A_POSITION),
            organized_by = (A_ORGANIZED_BY)
    WHERE
        achievement_id = A_ACHIEVEMENT_ID;
    RESULT := 'Update is successful';

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RESULT := 'Achievement already exists';
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for UPDATE_BLOG
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."UPDATE_BLOG" AS
BEGIN
    UPDATE BLOGS
        SET
            TOPIC = UPPER(B_TOPIC),
            TITLE = B_TITLE,
            DESCRIPTION = B_DESCRIPTION
    WHERE POST_ID = B_POST_ID;
    RESULT := 'Update is successful';
EXCEPTION
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for UPDATE_CO_CURRICULAR
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."UPDATE_CO_CURRICULAR" AS
BEGIN
    UPDATE CO_CURRICULARS
        SET
            EVENT_NAME = CC_EVENT_NAME,
            EVENT_DATE = TO_DATE(CC_EVENT_DATE, 'YYYY-MM-DD'),
            COVER_PHOTO = CC_COVER_PHOTO,
            DESCRIPTION = CC_DESCRIPTION,
            LATITUDE = CC_LATITUDE,
            LONGITUDE = CC_LONGITUDE,
            PLATFORM = CC_PLATFORM,
            FEES = CC_FEES,
            AVAILABLE_FOR = CC_AVAILABLE_FOR
    WHERE EVENT_ID = CC_EVENT_ID;
    RESULT := 'Update is successful';
EXCEPTION
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for UPDATE_EDUCATION
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."UPDATE_EDUCATION" AS
BEGIN

    UPDATE education
        SET
            institute = UPPER(E_INSTITUTE),
            field_of_study = E_FIELD_OF_STUDY,
            degree = UPPER(E_DEGREE),
            grade = E_GRADE,
            start_date = TO_DATE(E_START_DATE, 'YYYY-MM-DD'),
            end_date = TO_DATE(E_END_DATE, 'YYYY-MM-DD')
    WHERE
        education_id = E_EDUCATION_ID;

    RESULT := 'Update is successful';

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RESULT := 'Education info already exists';
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for UPDATE_GROUP
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."UPDATE_GROUP" AS
BEGIN

    UPDATE GROUPS
        SET
            GROUP_NAME = G_GROUP_NAME,
            DESCRIPTION = G_DESCRIPTION,
            COVER_PHOTO = G_COVER_PHOTO
        WHERE GROUP_ID = G_GROUP_ID;

    RESULT := 'Update is successful';

EXCEPTION
    WHEN OTHERS THEN
        RESULT := 'Please enter the fields correctly';
END;
/

-- ----------------------------
-- Function structure for UPDATE_GROUP_ADMIN
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."UPDATE_GROUP_ADMIN" AS
BEGIN
    select USER_ID INTO GM_USER_ID from GROUP_MEMBERS
    where GROUP_ID= G_GROUP_ID AND USER_ID=G_ADMIN_ID;

    UPDATE GROUPS
        SET ADMIN_ID = G_ADMIN_ID
        WHERE GROUP_ID = G_GROUP_ID;

    RESULT := 'Update is successful';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RESULT := 'Admin must be a member of the group';
END;
/

-- ----------------------------
-- Function structure for UPDATE_GROUP_POST
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."UPDATE_GROUP_POST" AS
BEGIN
    UPDATE GROUP_POSTS
        SET
            TOPIC = UPPER(GP_TOPIC),
            DESCRIPTION = GP_DESCRIPTION
    WHERE POST_ID = GP_POST_ID;
    RESULT := 'Update is successful';
EXCEPTION
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for UPDATE_INTEREST
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."UPDATE_INTEREST" AS
BEGIN

    UPDATE INTERESTS
        SET
            INTEREST = UPPER(I_INTEREST)
    WHERE INTEREST_ID = I_INTEREST_ID;

    RESULT := 'Update is successful';

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RESULT := 'Interest already exists';
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for UPDATE_JOB_POST
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."UPDATE_JOB_POST" AS
BEGIN
    UPDATE JOB_POSTS
        SET
            COMPANY_NAME = UPPER(JP_COMPANY_NAME),
            JOB_TYPE = JP_JOB_TYPE,
						REMOTE = JP_REMOTE,
						LATITUDE = JP_LATITUDE,
						LONGITUDE = JP_LONGITUDE,
						REQUIREMENTS = JP_REQUIREMENTS,
						DESIGNATION = JP_DESIGNATION,
						EXPECTED_SALARY = JP_EXPECTED_SALARY,
						VACANCY = JP_VACANCY,
						EMAIL = JP_EMAIL,
						PHONE_NO = JP_PHONE_NO
    WHERE POST_ID = JP_POST_ID;
    RESULT := 'Update is successful';
EXCEPTION
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for UPDATE_MERCH
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."UPDATE_MERCH" AS
BEGIN
    UPDATE MERCHS
        SET
            PRODUCT_NAME = UPPER(M_PRODUCT_NAME),
						IMAGE = M_IMAGE,
						PRICE = M_PRICE,
						EMAIL = M_EMAIL,
						PHONE_NO = M_PHONE_NO,
						DESCRIPTION = M_DESCRIPTION
    WHERE POST_ID = M_POST_ID;
    RESULT := 'Update is successful';
EXCEPTION
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for UPDATE_PUBLICATION
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."UPDATE_PUBLICATION" AS
BEGIN
    UPDATE publications
        SET
            title = UPPER(P_TITLE),
            authors = UPPER(P_AUTHORS),
            journal = UPPER(P_JOURNAL),
            publication_date = TO_DATE(P_PUBLICATION_DATE, 'YYYY-MM-DD'),
            pdf_link = P_PDF_LINK
    WHERE
        publication_id = P_PUBLICATION_ID;
    RESULT := 'Update is successful';

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RESULT := 'Publication info already exists';
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for UPDATE_RESEARCH_INTEREST
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."UPDATE_RESEARCH_INTEREST" AS
BEGIN

    UPDATE RESEARCH_INTERESTS
        SET
            RESEARCH_INTEREST = UPPER(RI_RESEARCH_INTEREST)
    WHERE RESEARCH_INTEREST_ID = RI_RESEARCH_INTEREST_ID;

    RESULT := 'Update is successful';

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RESULT := 'Research Interest already exists';
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for UPDATE_REUNION
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."UPDATE_REUNION" AS
BEGIN
    UPDATE REUNIONS
        SET
            EVENT_NAME = R_EVENT_NAME,
            EVENT_DATE = TO_DATE(R_EVENT_DATE, 'YYYY-MM-DD'),
            COVER_PHOTO = R_COVER_PHOTO,
            DESCRIPTION = R_DESCRIPTION,
            LATITUDE = R_LATITUDE,
            LONGITUDE = R_LONGITUDE,
            PLATFORM = R_PLATFORM,
            FEES = R_FEES,
            BATCH = R_BATCH,
            DEPARTMENT = R_DEPARTMENT
    WHERE EVENT_ID = R_EVENT_ID;
    RESULT := 'Update is successful';
EXCEPTION
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for UPDATE_SEMINAR
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."UPDATE_SEMINAR" AS
BEGIN
    UPDATE SEMINARS
        SET
            EVENT_NAME = S_EVENT_NAME,
            EVENT_DATE = TO_DATE(S_EVENT_DATE, 'YYYY-MM-DD'),
            COVER_PHOTO = S_COVER_PHOTO,
            DESCRIPTION = S_DESCRIPTION,
            LATITUDE = S_LATITUDE,
            LONGITUDE = S_LONGITUDE,
            PLATFORM = S_PLATFORM,
            FEES = S_FEES,
            TOPIC = S_TOPIC,
            SPECIAL_GUESTS = S_SPECIAL_GUESTS,
            AVAILABLE_FOR = S_AVAILABLE_FOR
    WHERE EVENT_ID = S_EVENT_ID;

    RESULT := 'Update is successful';
EXCEPTION
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for UPDATE_SKILL
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."UPDATE_SKILL" AS
BEGIN

    UPDATE SKILLS
        SET
             SKILL = UPPER(S_SKILL)
    WHERE SKILL_ID = S_SKILL_ID;

    RESULT := 'Update is successful';

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RESULT := 'Skill already exists';
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Function structure for UPDATE_USER
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."UPDATE_USER" AS
BEGIN

    UPDATE users
                SET
                    first_name = UPPER(U_FIRST_NAME),
                    last_name = UPPER(U_LAST_NAME),
                    city = UPPER(U_CITY),
                    state = UPPER(U_STATE),
                    country = UPPER(U_COUNTRY),
                    phone_no = U_PHONE_NO,
                    about_me = U_ABOUT_ME,
                    date_of_birth = TO_DATE(U_DATE_OF_BIRTH, 'YYYY-MM-DD'),
                    profile_picture = U_PROFILE_PICTURE,
                    student_id = U_STUDENT_ID,
                    hall = UPPER(U_HALL),
                    facebook = U_FACEBOOK,
                    twitter = U_TWITTER,
                    linkedin = U_LINKEDIN,
                    google_scholar = U_GOOGLE_SCHOLAR,
                    research_gate = U_RESEARCH_GATE
                WHERE user_id = U_USER_ID;

    RESULT := 'Update is successful';

EXCEPTION
    WHEN OTHERS THEN
        RESULT := 'Please enter the fields correctly';
END;
/

-- ----------------------------
-- Function structure for UPDATE_WORK_EXPERIENCE
-- ----------------------------
CREATE OR REPLACE
PROCEDURE "TFUSER4"."UPDATE_WORK_EXPERIENCE" AS
BEGIN
    UPDATE work_experience
        SET
            organization = UPPER(WE_ORGANIZATION),
            employment_type = WE_EMPLOYMENT_TYPE,
            designation = UPPER(WE_DESIGNATION),
            start_date = TO_DATE(WE_START_DATE, 'YYYY-MM-DD'),
            end_date = TO_DATE(WE_END_DATE, 'YYYY-MM-DD')
    WHERE
        work_experience_id = WE_WORK_EXPERIENCE_ID;

    RESULT := 'Update is successful';

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RESULT := 'Work experience already exists';
    WHEN OTHERS THEN
        RESULT := 'Please fill up the field correctly';
END;
/

-- ----------------------------
-- Sequence structure for ACHIEVEMENT_SEQ
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ACHIEVEMENT_SEQ";
CREATE SEQUENCE "TFUSER4"."ACHIEVEMENT_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for COMMENT_SEQ
-- ----------------------------
DROP SEQUENCE "TFUSER4"."COMMENT_SEQ";
CREATE SEQUENCE "TFUSER4"."COMMENT_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for EDUCATION_SEQ
-- ----------------------------
DROP SEQUENCE "TFUSER4"."EDUCATION_SEQ";
CREATE SEQUENCE "TFUSER4"."EDUCATION_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for EVENT_SEQ
-- ----------------------------
DROP SEQUENCE "TFUSER4"."EVENT_SEQ";
CREATE SEQUENCE "TFUSER4"."EVENT_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for GROUP_MEMBER_SEQ
-- ----------------------------
DROP SEQUENCE "TFUSER4"."GROUP_MEMBER_SEQ";
CREATE SEQUENCE "TFUSER4"."GROUP_MEMBER_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for GROUP_SEQ
-- ----------------------------
DROP SEQUENCE "TFUSER4"."GROUP_SEQ";
CREATE SEQUENCE "TFUSER4"."GROUP_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for INTEREST_SEQ
-- ----------------------------
DROP SEQUENCE "TFUSER4"."INTEREST_SEQ";
CREATE SEQUENCE "TFUSER4"."INTEREST_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_79357
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_79357";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_79357" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_79362
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_79362";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_79362" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_79365
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_79365";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_79365" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_79388
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_79388";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_79388" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_79391
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_79391";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_79391" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_79664
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_79664";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_79664" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_79669
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_79669";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_79669" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_79672
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_79672";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_79672" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_79695
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_79695";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_79695" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_79698
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_79698";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_79698" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_82201
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_82201";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_82201" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_82205
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_82205";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_82205" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_82209
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_82209";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_82209" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_82213
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_82213";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_82213" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_82227
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_82227";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_82227" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_82232
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_82232";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_82232" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_82235
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_82235";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_82235" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_82258
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_82258";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_82258" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_82261
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_82261";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_82261" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_82286
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_82286";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_82286" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_82318
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_82318";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_82318" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_82323
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_82323";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_82323" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_82326
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_82326";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_82326" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_82349
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_82349";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_82349" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_82352
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_82352";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_82352" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_82834
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_82834";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_82834" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_82917
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_82917";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_82917" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_82999
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_82999";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_82999" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_83081
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_83081";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_83081" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for ISEQ$$_84106
-- ----------------------------
DROP SEQUENCE "TFUSER4"."ISEQ$$_84106";
CREATE SEQUENCE "TFUSER4"."ISEQ$$_84106" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for LIKE_SEQ
-- ----------------------------
DROP SEQUENCE "TFUSER4"."LIKE_SEQ";
CREATE SEQUENCE "TFUSER4"."LIKE_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for NOTIFICATION_SEQ
-- ----------------------------
DROP SEQUENCE "TFUSER4"."NOTIFICATION_SEQ";
CREATE SEQUENCE "TFUSER4"."NOTIFICATION_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for PENDING_MEMBER_SEQ
-- ----------------------------
DROP SEQUENCE "TFUSER4"."PENDING_MEMBER_SEQ";
CREATE SEQUENCE "TFUSER4"."PENDING_MEMBER_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for POST_SEQ
-- ----------------------------
DROP SEQUENCE "TFUSER4"."POST_SEQ";
CREATE SEQUENCE "TFUSER4"."POST_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for PUBLICATION_SEQ
-- ----------------------------
DROP SEQUENCE "TFUSER4"."PUBLICATION_SEQ";
CREATE SEQUENCE "TFUSER4"."PUBLICATION_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for RESEARCH_INTEREST_SEQ
-- ----------------------------
DROP SEQUENCE "TFUSER4"."RESEARCH_INTEREST_SEQ";
CREATE SEQUENCE "TFUSER4"."RESEARCH_INTEREST_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for SCHEDULE_SEQ
-- ----------------------------
DROP SEQUENCE "TFUSER4"."SCHEDULE_SEQ";
CREATE SEQUENCE "TFUSER4"."SCHEDULE_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for SKILL_SEQ
-- ----------------------------
DROP SEQUENCE "TFUSER4"."SKILL_SEQ";
CREATE SEQUENCE "TFUSER4"."SKILL_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for USER_SEQ
-- ----------------------------
DROP SEQUENCE "TFUSER4"."USER_SEQ";
CREATE SEQUENCE "TFUSER4"."USER_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Sequence structure for WORK_EXPERIENCE_SEQ
-- ----------------------------
DROP SEQUENCE "TFUSER4"."WORK_EXPERIENCE_SEQ";
CREATE SEQUENCE "TFUSER4"."WORK_EXPERIENCE_SEQ" MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 CACHE 20;

-- ----------------------------
-- Primary Key structure for table ACHIEVEMENTS
-- ----------------------------
ALTER TABLE "TFUSER4"."ACHIEVEMENTS" ADD CONSTRAINT "ACHIEVEMENTS_PK" PRIMARY KEY ("ACHIEVEMENT_ID");

-- ----------------------------
-- Uniques structure for table ACHIEVEMENTS
-- ----------------------------
ALTER TABLE "TFUSER4"."ACHIEVEMENTS" ADD CONSTRAINT "ACHIEVEMENTS_UNIQUE" UNIQUE ("USER_ID", "ACHIEVEMENT_NAME", "ACHIEVEMENT_DATE") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table ACHIEVEMENTS
-- ----------------------------
ALTER TABLE "TFUSER4"."ACHIEVEMENTS" ADD CONSTRAINT "SYS_C0023398" CHECK ("ACHIEVEMENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."ACHIEVEMENTS" ADD CONSTRAINT "SYS_C0023399" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."ACHIEVEMENTS" ADD CONSTRAINT "SYS_C0023400" CHECK ("ACHIEVEMENT_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."ACHIEVEMENTS" ADD CONSTRAINT "SYS_C0023401" CHECK ("ACHIEVEMENT_DATE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table BLOGS
-- ----------------------------
ALTER TABLE "TFUSER4"."BLOGS" ADD CONSTRAINT "BLOGS_PK" PRIMARY KEY ("POST_ID");

-- ----------------------------
-- Checks structure for table BLOGS
-- ----------------------------
ALTER TABLE "TFUSER4"."BLOGS" ADD CONSTRAINT "SYS_C0025332" CHECK ("POST_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."BLOGS" ADD CONSTRAINT "SYS_C0025333" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."BLOGS" ADD CONSTRAINT "SYS_C0025334" CHECK ("TOPIC" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."BLOGS" ADD CONSTRAINT "SYS_C0025335" CHECK ("TITLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."BLOGS" ADD CONSTRAINT "SYS_C0025336" CHECK ("DESCRIPTION" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."BLOGS" ADD CONSTRAINT "SYS_C0025337" CHECK ("TIMESTAMP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table BLOGS
-- ----------------------------
CREATE TRIGGER "TFUSER4"."BLOG_NOTIFICATION" AFTER INSERT ON "TFUSER4"."BLOGS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
    U_USER_NAME VARCHAR2(100);
BEGIN

    SELECT FIRST_NAME || ' ' || USERS.LAST_NAME INTO U_USER_NAME
    FROM USERS
    WHERE USER_ID = :NEW.USER_ID;

    FOR F IN (SELECT * FROM FOLLOWS WHERE FOLLOWING = :NEW.USER_ID)
    LOOP
        INSERT INTO NOTIFICATION(notification_id, user_id, entity_name, entity_id, notification_text, notification_url, seen)
    VALUES (NOTIFICATION_SEQ.nextval, F.FOLLOWER , 'POSTS', :NEW.POST_ID ,U_USER_NAME ||' has posted a blog.',
            '/api/blog/' || :NEW.POST_ID ,'NO');
    end loop;

end;
/

-- ----------------------------
-- Primary Key structure for table COMMENTS
-- ----------------------------
ALTER TABLE "TFUSER4"."COMMENTS" ADD CONSTRAINT "COMMENTS_PK" PRIMARY KEY ("COMMENT_ID");

-- ----------------------------
-- Checks structure for table COMMENTS
-- ----------------------------
ALTER TABLE "TFUSER4"."COMMENTS" ADD CONSTRAINT "SYS_C0025376" CHECK ("COMMENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."COMMENTS" ADD CONSTRAINT "SYS_C0025377" CHECK ("POST_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."COMMENTS" ADD CONSTRAINT "SYS_C0025378" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."COMMENTS" ADD CONSTRAINT "SYS_C0025379" CHECK ("BODY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."COMMENTS" ADD CONSTRAINT "SYS_C0025380" CHECK ("TIMESTAMP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table COMMENTS
-- ----------------------------
CREATE TRIGGER "TFUSER4"."COMMENT_NOTIFICATION" AFTER INSERT ON "TFUSER4"."COMMENTS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
    U_USER_NAME VARCHAR2(100);
    P_USER_ID NUMBER;
    P_POST_TYPE VARCHAR2(100);
    G_GROUP_ID NUMBER;
BEGIN

    SELECT FIRST_NAME || ' ' || USERS.LAST_NAME INTO U_USER_NAME
    FROM USERS
    WHERE USER_ID = :NEW.USER_ID;

    SELECT POST_TYPE INTO P_POST_TYPE
    FROM POSTS
    WHERE POST_ID = :NEW.POST_ID;

    IF P_POST_TYPE = 'group_post' THEN
        SELECT GM.USER_ID INTO P_USER_ID FROM GROUP_POSTS GP
        JOIN GROUP_MEMBERS GM ON GM.GROUP_MEMBER_ID = GP.GROUP_MEMBER_ID
        WHERE GP.POST_ID = :NEW.post_id;

        SELECT GM.GROUP_ID INTO G_GROUP_ID FROM GROUP_POSTS GP
        JOIN GROUP_MEMBERS GM ON GM.GROUP_MEMBER_ID = GP.GROUP_MEMBER_ID
        WHERE GP.POST_ID = :NEW.post_id;

        IF P_USER_ID <> :NEW.USER_ID THEN
            INSERT INTO NOTIFICATION(notification_id, user_id, entity_name, entity_id, notification_text, notification_url, seen)
            VALUES (NOTIFICATION_SEQ.nextval, P_USER_ID , 'LIKES', :NEW.COMMENT_ID , U_USER_NAME ||' has commented your post',
                '/api/' || P_POST_TYPE || '/'|| G_GROUP_ID || '/' ||:NEW.POST_ID ,'NO');
        end if;
    ELSE
        IF P_POST_TYPE = 'blog' THEN
            SELECT B.USER_ID INTO P_USER_ID FROM BLOGS B
            WHERE B.POST_ID = :NEW.post_id;
        ELSIF P_POST_TYPE = 'job_post' THEN
            SELECT JP.USER_ID INTO P_USER_ID FROM JOB_POSTS JP
            WHERE JP.POST_ID = :NEW.post_id;
        ELSIF P_POST_TYPE = 'merch' THEN
            SELECT M.USER_ID INTO P_USER_ID FROM MERCHS M
            WHERE M.POST_ID = :NEW.post_id;
        end if;
        IF P_USER_ID <> :NEW.USER_ID THEN
            INSERT INTO NOTIFICATION(notification_id, user_id, entity_name, entity_id, notification_text, notification_url, seen)
            VALUES (NOTIFICATION_SEQ.nextval, P_USER_ID , 'LIKES', :NEW.COMMENT_ID , U_USER_NAME ||' has commented on your post',
                '/api/' || P_POST_TYPE || '/'|| :NEW.POST_ID ,'NO');
        end if;
    end if;
end;
/
CREATE TRIGGER "TFUSER4"."COMMENT_NOTIFICATION_REMOVE" AFTER DELETE ON "TFUSER4"."COMMENTS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
BEGIN
    DELETE FROM NOTIFICATION
    WHERE ENTITY_NAME = 'COMMENTS' AND ENTITY_ID = :OLD.COMMENT_ID;
end;
/

-- ----------------------------
-- Primary Key structure for table CO_CURRICULARS
-- ----------------------------
ALTER TABLE "TFUSER4"."CO_CURRICULARS" ADD CONSTRAINT "CO_CURRICULARS_PK" PRIMARY KEY ("EVENT_ID");

-- ----------------------------
-- Checks structure for table CO_CURRICULARS
-- ----------------------------
ALTER TABLE "TFUSER4"."CO_CURRICULARS" ADD CONSTRAINT "SYS_C0025402" CHECK ("EVENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."CO_CURRICULARS" ADD CONSTRAINT "SYS_C0025403" CHECK ("EVENT_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."CO_CURRICULARS" ADD CONSTRAINT "SYS_C0025404" CHECK ("EVENT_DATE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."CO_CURRICULARS" ADD CONSTRAINT "SYS_C0025405" CHECK ("DESCRIPTION" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."CO_CURRICULARS" ADD CONSTRAINT "SYS_C0025406" CHECK ("FEES" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."CO_CURRICULARS" ADD CONSTRAINT "SYS_C0025407" CHECK ("AVAILABLE_FOR" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."CO_CURRICULARS" ADD CONSTRAINT "SYS_C0025408" CHECK ("GROUP_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."CO_CURRICULARS" ADD CONSTRAINT "SYS_C0025409" CHECK ("TIMESTAMP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."CO_CURRICULARS" ADD CONSTRAINT "SYS_C0025410" CHECK ( fees>=0 ) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table CO_CURRICULARS
-- ----------------------------
CREATE TRIGGER "TFUSER4"."CO_CURRICULAR_NOTIFICATION" AFTER INSERT ON "TFUSER4"."CO_CURRICULARS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
    G_GROUP_NAME VARCHAR2(1000);
BEGIN

    SELECT GROUP_NAME INTO G_GROUP_NAME
    FROM GROUPS
    WHERE GROUPS.GROUP_ID = :NEW.GROUP_ID;

    FOR GM IN (SELECT * FROM GROUP_MEMBERS WHERE GROUP_MEMBERS.GROUP_ID = :NEW.GROUP_ID)
    LOOP
        INSERT INTO NOTIFICATION(notification_id, user_id, entity_name, entity_id, notification_text, notification_url, seen)
        VALUES (NOTIFICATION_SEQ.nextval, GM.USER_ID , 'EVENTS', :NEW.EVENT_ID , G_GROUP_NAME ||' group is arranging a co-curricular event',
            '/api/co_curricular/' || :NEW.EVENT_ID ,'NO');
    end loop;
end;
/
CREATE TRIGGER "TFUSER4"."CO_CURRICULAR_UPDATE_NOTIFICATION" AFTER UPDATE ON "TFUSER4"."CO_CURRICULARS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
BEGIN

    FOR EP IN (SELECT * FROM EVENT_PARTICIPANTS WHERE EVENT_ID = :NEW.EVENT_ID)
    LOOP
        INSERT INTO NOTIFICATION(notification_id, user_id, entity_name, entity_id, notification_text, notification_url, seen)
        VALUES (NOTIFICATION_SEQ.nextval, EP.USER_ID , 'EVENT_PARTICIPANTS', :NEW.EVENT_ID , :NEW.EVENT_NAME ||' event has updated',
            '/api/co_curricular/' || :NEW.EVENT_ID ,'NO');
    end loop;
end;
/

-- ----------------------------
-- Primary Key structure for table EDUCATION
-- ----------------------------
ALTER TABLE "TFUSER4"."EDUCATION" ADD CONSTRAINT "EDUCATION_PK" PRIMARY KEY ("EDUCATION_ID");

-- ----------------------------
-- Uniques structure for table EDUCATION
-- ----------------------------
ALTER TABLE "TFUSER4"."EDUCATION" ADD CONSTRAINT "EDUCATION_UNIQUE" UNIQUE ("USER_ID", "INSTITUTE", "DEGREE", "START_DATE") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table EDUCATION
-- ----------------------------
ALTER TABLE "TFUSER4"."EDUCATION" ADD CONSTRAINT "EDUCATION_CHECK" CHECK ( start_date < end_date ) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."EDUCATION" ADD CONSTRAINT "SYS_C0023378" CHECK ("EDUCATION_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."EDUCATION" ADD CONSTRAINT "SYS_C0023379" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."EDUCATION" ADD CONSTRAINT "SYS_C0023380" CHECK ("INSTITUTE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."EDUCATION" ADD CONSTRAINT "SYS_C0023381" CHECK ("DEGREE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."EDUCATION" ADD CONSTRAINT "SYS_C0023382" CHECK ("START_DATE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table EVENTS
-- ----------------------------
ALTER TABLE "TFUSER4"."EVENTS" ADD CONSTRAINT "EVENTS_PK" PRIMARY KEY ("EVENT_ID");

-- ----------------------------
-- Checks structure for table EVENTS
-- ----------------------------
ALTER TABLE "TFUSER4"."EVENTS" ADD CONSTRAINT "SYS_C0025391" CHECK ("EVENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."EVENTS" ADD CONSTRAINT "SYS_C0025392" CHECK ("EVENT_TYPE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."EVENTS" ADD CONSTRAINT "SYS_C0025393" CHECK ( event_type in ('co_curricular',
	                                                       'reunion', 'seminar') ) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table EVENTS
-- ----------------------------
CREATE TRIGGER "TFUSER4"."EVENT_NOTIFICATION_REMOVE" AFTER DELETE ON "TFUSER4"."EVENTS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
BEGIN
    DELETE FROM NOTIFICATION
    WHERE ENTITY_NAME = 'EVENTS' AND ENTITY_ID = :OLD.EVENT_ID;
end;
/

-- ----------------------------
-- Primary Key structure for table EVENT_PARTICIPANTS
-- ----------------------------
ALTER TABLE "TFUSER4"."EVENT_PARTICIPANTS" ADD CONSTRAINT "EVENT_PARTICIPANTS_PK" PRIMARY KEY ("EVENT_ID", "USER_ID");

-- ----------------------------
-- Checks structure for table EVENT_PARTICIPANTS
-- ----------------------------
ALTER TABLE "TFUSER4"."EVENT_PARTICIPANTS" ADD CONSTRAINT "SYS_C0025438" CHECK ("EVENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."EVENT_PARTICIPANTS" ADD CONSTRAINT "SYS_C0025439" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table EVENT_PARTICIPANTS
-- ----------------------------
CREATE TRIGGER "TFUSER4"."EVENT_PARTICIPANT_NOTIFICATION_REMOVE" AFTER DELETE ON "TFUSER4"."EVENT_PARTICIPANTS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
BEGIN
    DELETE FROM NOTIFICATION
    WHERE ENTITY_NAME = 'EVENT_PARTICIPANTS' AND ENTITY_ID = :OLD.EVENT_ID;
end;
/

-- ----------------------------
-- Primary Key structure for table FOLLOWS
-- ----------------------------
ALTER TABLE "TFUSER4"."FOLLOWS" ADD CONSTRAINT "FOLLOWS_PK" PRIMARY KEY ("FOLLOWER", "FOLLOWING");

-- ----------------------------
-- Checks structure for table FOLLOWS
-- ----------------------------
ALTER TABLE "TFUSER4"."FOLLOWS" ADD CONSTRAINT "FOLLOWS_CHECK" CHECK ( follower <> following ) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."FOLLOWS" ADD CONSTRAINT "SYS_C0023414" CHECK ("FOLLOWER" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."FOLLOWS" ADD CONSTRAINT "SYS_C0023415" CHECK ("FOLLOWING" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table FOLLOWS
-- ----------------------------
CREATE TRIGGER "TFUSER4"."FOLLOW_USER_NOTIFICATION" AFTER INSERT ON "TFUSER4"."FOLLOWS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
    U_USER_NAME VARCHAR2(100);
BEGIN
    SELECT FIRST_NAME || ' ' || LAST_NAME INTO  U_USER_NAME
    FROM USERS
    WHERE USER_ID = :NEW.FOLLOWER;

    INSERT INTO NOTIFICATION(notification_id, user_id, entity_name, entity_id, notification_text, notification_url, seen)
    VALUES (NOTIFICATION_SEQ.nextval, :NEW.FOLLOWING, 'FOLLOWS', :NEW.FOLLOWER , U_USER_NAME || ' has started to following you. Visit profile.', '/api/user/' ||:NEW.FOLLOWER,'NO');
end;
/
CREATE TRIGGER "TFUSER4"."FOLLOW_USER_NOTIFICATION_REMOVE" AFTER DELETE ON "TFUSER4"."FOLLOWS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
BEGIN
    DELETE FROM NOTIFICATION
        WHERE ENTITY_NAME = 'FOLLOWS'
        AND ENTITY_ID = :OLD.FOLLOWER
        AND USER_ID = :OLD.FOLLOWING;
end;
/

-- ----------------------------
-- Primary Key structure for table GROUPS
-- ----------------------------
ALTER TABLE "TFUSER4"."GROUPS" ADD CONSTRAINT "GROUPS_PK" PRIMARY KEY ("GROUP_ID");

-- ----------------------------
-- Checks structure for table GROUPS
-- ----------------------------
ALTER TABLE "TFUSER4"."GROUPS" ADD CONSTRAINT "SYS_C0023420" CHECK ("GROUP_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."GROUPS" ADD CONSTRAINT "SYS_C0023421" CHECK ("GROUP_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."GROUPS" ADD CONSTRAINT "SYS_C0023422" CHECK ("DATE_OF_CREATION" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."GROUPS" ADD CONSTRAINT "SYS_C0023423" CHECK ("ADMIN_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table GROUPS
-- ----------------------------
CREATE TRIGGER "TFUSER4"."MAKE_ADMIN_NOTIFICATION" AFTER UPDATE OF "ADMIN_ID" ON "TFUSER4"."GROUPS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
BEGIN

    INSERT INTO NOTIFICATION(notification_id, user_id, entity_name, entity_id, notification_text, notification_url, seen)
    VALUES (NOTIFICATION_SEQ.nextval, :NEW.ADMIN_ID , 'GROUPS', :NEW.ADMIN_ID ,'You are the admin of ' || :NEW.GROUP_NAME || ' group now',
            '/api/group/' || :NEW.GROUP_ID ,'NO');

end;
/

-- ----------------------------
-- Primary Key structure for table GROUP_MEMBERS
-- ----------------------------
ALTER TABLE "TFUSER4"."GROUP_MEMBERS" ADD CONSTRAINT "GROUP_MEMBERS_PK" PRIMARY KEY ("GROUP_MEMBER_ID");

-- ----------------------------
-- Uniques structure for table GROUP_MEMBERS
-- ----------------------------
ALTER TABLE "TFUSER4"."GROUP_MEMBERS" ADD CONSTRAINT "GROUP_MEMBERS_UNIQUE" UNIQUE ("USER_ID", "GROUP_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table GROUP_MEMBERS
-- ----------------------------
ALTER TABLE "TFUSER4"."GROUP_MEMBERS" ADD CONSTRAINT "SYS_C0023426" CHECK ("GROUP_MEMBER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."GROUP_MEMBERS" ADD CONSTRAINT "SYS_C0023427" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."GROUP_MEMBERS" ADD CONSTRAINT "SYS_C0023428" CHECK ("GROUP_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table GROUP_MEMBERS
-- ----------------------------
CREATE TRIGGER "TFUSER4"."GROUP_MEMBER_NOTIFICATION" AFTER INSERT ON "TFUSER4"."GROUP_MEMBERS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
    G_GROUP_NAME VARCHAR2(100);
    G_ADMIN_ID NUMBER;
BEGIN
    SELECT GROUP_NAME INTO G_GROUP_NAME
    FROM GROUPS
    WHERE GROUPS.GROUP_ID = :NEW.GROUP_ID;

    SELECT ADMIN_ID INTO G_ADMIN_ID
    FROM GROUPS
    WHERE GROUPS.GROUP_ID = :NEW.GROUP_ID;

    IF G_ADMIN_ID <> :NEW.USER_ID THEN
        INSERT INTO NOTIFICATION(notification_id, user_id, entity_name, entity_id, notification_text, notification_url, seen)
            VALUES (NOTIFICATION_SEQ.nextval, :NEW.USER_ID , 'GROUP_MEMBERS', :NEW.GROUP_MEMBER_ID ,'Your join request in ' || G_GROUP_NAME || ' group is accepted',
            '/api/group/' || :NEW.GROUP_ID ,'NO');
    end if;

end;
/
CREATE TRIGGER "TFUSER4"."GROUP_MEMBER_NOTIFICATION_REMOVE" AFTER DELETE ON "TFUSER4"."GROUP_MEMBERS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
BEGIN
    DELETE FROM NOTIFICATION
        WHERE ENTITY_ID = :OLD.GROUP_MEMBER_ID AND ENTITY_NAME = 'GROUP_MEMBERS';
end;
/

-- ----------------------------
-- Primary Key structure for table GROUP_POSTS
-- ----------------------------
ALTER TABLE "TFUSER4"."GROUP_POSTS" ADD CONSTRAINT "GROUP_POSTS_PK" PRIMARY KEY ("POST_ID");

-- ----------------------------
-- Checks structure for table GROUP_POSTS
-- ----------------------------
ALTER TABLE "TFUSER4"."GROUP_POSTS" ADD CONSTRAINT "SYS_C0025324" CHECK ("POST_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."GROUP_POSTS" ADD CONSTRAINT "SYS_C0025325" CHECK ("TOPIC" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."GROUP_POSTS" ADD CONSTRAINT "SYS_C0025326" CHECK ("GROUP_MEMBER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."GROUP_POSTS" ADD CONSTRAINT "SYS_C0025327" CHECK ("DESCRIPTION" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."GROUP_POSTS" ADD CONSTRAINT "SYS_C0025328" CHECK ("TIMESTAMP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table GROUP_POSTS
-- ----------------------------
CREATE TRIGGER "TFUSER4"."GROUP_POST_NOTIFICATION" AFTER INSERT ON "TFUSER4"."GROUP_POSTS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
    G_GROUP_NAME VARCHAR2(100);
    G_GROUP_ID NUMBER;
    G_USER_ID NUMBER;
BEGIN

    SELECT GROUP_ID INTO G_GROUP_ID
    FROM GROUP_MEMBERS GM
    WHERE GM.GROUP_MEMBER_ID = :NEW.GROUP_MEMBER_ID;

    SELECT USER_ID INTO G_USER_ID
    FROM GROUP_MEMBERS GM
    WHERE GM.GROUP_MEMBER_ID = :NEW.GROUP_MEMBER_ID;

    SELECT GROUP_NAME INTO G_GROUP_NAME
    FROM GROUPS
    WHERE GROUPS.GROUP_ID = G_GROUP_ID;

    FOR GM IN (SELECT * FROM GROUP_MEMBERS WHERE GROUP_ID = G_GROUP_ID)
    LOOP
        IF GM.USER_ID <> G_USER_ID THEN
            INSERT INTO NOTIFICATION(notification_id, user_id, entity_name, entity_id, notification_text, notification_url, seen)
                VALUES (NOTIFICATION_SEQ.nextval, GM.USER_ID , 'POSTS', :NEW.POST_ID ,'There is new post in ' || G_GROUP_NAME || ' group',
            '/api/group_post/' || G_GROUP_ID ||'/'|| :NEW.POST_ID ,'NO');
        end if;
    end loop;
end;
/

-- ----------------------------
-- Primary Key structure for table INTERESTS
-- ----------------------------
ALTER TABLE "TFUSER4"."INTERESTS" ADD CONSTRAINT "INTERESTS_PK" PRIMARY KEY ("INTEREST_ID");

-- ----------------------------
-- Uniques structure for table INTERESTS
-- ----------------------------
ALTER TABLE "TFUSER4"."INTERESTS" ADD CONSTRAINT "INTERESTS_UNIQUE" UNIQUE ("INTEREST", "USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table INTERESTS
-- ----------------------------
ALTER TABLE "TFUSER4"."INTERESTS" ADD CONSTRAINT "SYS_C0023372" CHECK ("INTEREST_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."INTERESTS" ADD CONSTRAINT "SYS_C0023373" CHECK ("INTEREST" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."INTERESTS" ADD CONSTRAINT "SYS_C0023374" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table JOB_APPLICATION
-- ----------------------------
ALTER TABLE "TFUSER4"."JOB_APPLICATION" ADD CONSTRAINT "JOB_APPLICATION_PK" PRIMARY KEY ("POST_ID", "USER_ID");

-- ----------------------------
-- Checks structure for table JOB_APPLICATION
-- ----------------------------
ALTER TABLE "TFUSER4"."JOB_APPLICATION" ADD CONSTRAINT "SYS_C0025358" CHECK ("POST_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."JOB_APPLICATION" ADD CONSTRAINT "SYS_C0025359" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."JOB_APPLICATION" ADD CONSTRAINT "SYS_C0025360" CHECK ("CV" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."JOB_APPLICATION" ADD CONSTRAINT "SYS_C0025361" CHECK ("TIMESTAMP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table JOB_APPLICATION
-- ----------------------------
CREATE TRIGGER "TFUSER4"."JOB_APPLICATION_NOTIFICATION" AFTER INSERT ON "TFUSER4"."JOB_APPLICATION" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
    U_USER_NAME VARCHAR2(100);
    P_USER_ID NUMBER;
BEGIN

    SELECT FIRST_NAME || ' ' || USERS.LAST_NAME INTO U_USER_NAME
    FROM USERS
    WHERE USER_ID = :NEW.USER_ID;

    SELECT USER_ID INTO P_USER_ID
    FROM JOB_POSTS
    WHERE POST_ID = :NEW.POST_ID;

    INSERT INTO NOTIFICATION(notification_id, user_id, entity_name, entity_id, notification_text, notification_url, seen)
    VALUES (NOTIFICATION_SEQ.nextval, P_USER_ID , 'POSTS', :NEW.POST_ID ,U_USER_NAME ||' has applied for a job you posted. See the CV.',
            '/api/job_post/CV/' || :NEW.POST_ID ,'NO');

end;
/

-- ----------------------------
-- Primary Key structure for table JOB_POSTS
-- ----------------------------
ALTER TABLE "TFUSER4"."JOB_POSTS" ADD CONSTRAINT "JOB_POSTS_PK" PRIMARY KEY ("POST_ID");

-- ----------------------------
-- Checks structure for table JOB_POSTS
-- ----------------------------
ALTER TABLE "TFUSER4"."JOB_POSTS" ADD CONSTRAINT "SYS_C0025341" CHECK ("POST_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."JOB_POSTS" ADD CONSTRAINT "SYS_C0025342" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."JOB_POSTS" ADD CONSTRAINT "SYS_C0025343" CHECK ("COMPANY_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."JOB_POSTS" ADD CONSTRAINT "SYS_C0025344" CHECK ("JOB_TYPE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."JOB_POSTS" ADD CONSTRAINT "SYS_C0025345" CHECK ("REMOTE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."JOB_POSTS" ADD CONSTRAINT "SYS_C0025346" CHECK ("REQUIREMENTS" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."JOB_POSTS" ADD CONSTRAINT "SYS_C0025347" CHECK ("DESIGNATION" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."JOB_POSTS" ADD CONSTRAINT "SYS_C0025348" CHECK ("EXPECTED_SALARY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."JOB_POSTS" ADD CONSTRAINT "SYS_C0025349" CHECK ("EMAIL" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."JOB_POSTS" ADD CONSTRAINT "SYS_C0025350" CHECK ("TIMESTAMP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."JOB_POSTS" ADD CONSTRAINT "SYS_C0025351" CHECK ( job_type in ('Part-Time', 'Full-Time',
                                                        'Self-Employed','Internship',
                                                       'Freelance', 'Contract', 'Seasonal') ) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."JOB_POSTS" ADD CONSTRAINT "SYS_C0025352" CHECK ( remote in ('Yes','No') ) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."JOB_POSTS" ADD CONSTRAINT "SYS_C0025353" CHECK (expected_salary>=0 ) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."JOB_POSTS" ADD CONSTRAINT "SYS_C0025354" CHECK (vacancy is null or vacancy >0 ) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table JOB_POSTS
-- ----------------------------
CREATE TRIGGER "TFUSER4"."JOB_POST_NOTIFICATION" AFTER INSERT ON "TFUSER4"."JOB_POSTS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
    U_USER_NAME VARCHAR2(100);
BEGIN

    SELECT FIRST_NAME || ' ' || USERS.LAST_NAME INTO U_USER_NAME
    FROM USERS
    WHERE USER_ID = :NEW.USER_ID;

    FOR F IN (SELECT * FROM FOLLOWS WHERE FOLLOWING = :NEW.USER_ID)
    LOOP
        INSERT INTO NOTIFICATION(notification_id, user_id, entity_name, entity_id, notification_text, notification_url, seen)
    VALUES (NOTIFICATION_SEQ.nextval, F.FOLLOWER , 'POSTS', :NEW.POST_ID ,U_USER_NAME ||' has posted a job post.',
            '/api/job_post/' || :NEW.POST_ID ,'NO');
    end loop;
end;
/

-- ----------------------------
-- Primary Key structure for table LIKES
-- ----------------------------
ALTER TABLE "TFUSER4"."LIKES" ADD CONSTRAINT "LIKES_PK" PRIMARY KEY ("LIKE_ID");

-- ----------------------------
-- Uniques structure for table LIKES
-- ----------------------------
ALTER TABLE "TFUSER4"."LIKES" ADD CONSTRAINT "LIKES_UNIQUE" UNIQUE ("USER_ID", "POST_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table LIKES
-- ----------------------------
ALTER TABLE "TFUSER4"."LIKES" ADD CONSTRAINT "SYS_C0025384" CHECK ("LIKE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."LIKES" ADD CONSTRAINT "SYS_C0025385" CHECK ("POST_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."LIKES" ADD CONSTRAINT "SYS_C0025386" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table LIKES
-- ----------------------------
CREATE TRIGGER "TFUSER4"."LIKE_NOTIFICATION" AFTER INSERT ON "TFUSER4"."LIKES" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
    U_USER_NAME VARCHAR2(100);
    P_USER_ID NUMBER;
    P_POST_TYPE VARCHAR2(100);
    G_GROUP_ID NUMBER;
BEGIN

    SELECT FIRST_NAME || ' ' || USERS.LAST_NAME INTO U_USER_NAME
    FROM USERS
    WHERE USER_ID = :NEW.USER_ID;

    SELECT POST_TYPE INTO P_POST_TYPE
    FROM POSTS
    WHERE POST_ID = :NEW.POST_ID;

    IF P_POST_TYPE = 'group_post' THEN
        SELECT GM.USER_ID INTO P_USER_ID FROM GROUP_POSTS GP
        JOIN GROUP_MEMBERS GM ON GM.GROUP_MEMBER_ID = GP.GROUP_MEMBER_ID
        WHERE GP.POST_ID = :NEW.post_id;

        SELECT GM.GROUP_ID INTO G_GROUP_ID FROM GROUP_POSTS GP
        JOIN GROUP_MEMBERS GM ON GM.GROUP_MEMBER_ID = GP.GROUP_MEMBER_ID
        WHERE GP.POST_ID = :NEW.post_id;

        IF P_USER_ID <> :NEW.USER_ID THEN
            INSERT INTO NOTIFICATION(notification_id, user_id, entity_name, entity_id, notification_text, notification_url, seen)
            VALUES (NOTIFICATION_SEQ.nextval, P_USER_ID , 'LIKES', :NEW.LIKE_ID , U_USER_NAME ||' has liked your post',
                '/api/' || P_POST_TYPE || '/'|| G_GROUP_ID || '/' ||:NEW.POST_ID ,'NO');
        end if;
    ELSE
        IF P_POST_TYPE = 'blog' THEN
            SELECT B.USER_ID INTO P_USER_ID FROM BLOGS B
            WHERE B.POST_ID = :NEW.post_id;
        ELSIF P_POST_TYPE = 'job_post' THEN
            SELECT JP.USER_ID INTO P_USER_ID FROM JOB_POSTS JP
            WHERE JP.POST_ID = :NEW.post_id;
        ELSIF P_POST_TYPE = 'merch' THEN
            SELECT M.USER_ID INTO P_USER_ID FROM MERCHS M
            WHERE M.POST_ID = :NEW.post_id;
        end if;
        IF P_USER_ID <> :NEW.USER_ID THEN
            INSERT INTO NOTIFICATION(notification_id, user_id, entity_name, entity_id, notification_text, notification_url, seen)
            VALUES (NOTIFICATION_SEQ.nextval, P_USER_ID , 'LIKES', :NEW.LIKE_ID , U_USER_NAME ||' has liked your post',
                '/api/' || P_POST_TYPE || '/'|| :NEW.POST_ID ,'NO');
        end if;
    end if;
end;
/
CREATE TRIGGER "TFUSER4"."LIKE_NOTIFICATION_REMOVE" AFTER DELETE ON "TFUSER4"."LIKES" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
BEGIN
    DELETE FROM NOTIFICATION
    WHERE ENTITY_NAME = 'LIKES' AND ENTITY_ID = :OLD.LIKE_ID;
end;
/

-- ----------------------------
-- Primary Key structure for table MERCHS
-- ----------------------------
ALTER TABLE "TFUSER4"."MERCHS" ADD CONSTRAINT "MERCHS_PK" PRIMARY KEY ("POST_ID");

-- ----------------------------
-- Checks structure for table MERCHS
-- ----------------------------
ALTER TABLE "TFUSER4"."MERCHS" ADD CONSTRAINT "SYS_C0025365" CHECK ("POST_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."MERCHS" ADD CONSTRAINT "SYS_C0025366" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."MERCHS" ADD CONSTRAINT "SYS_C0025367" CHECK ("PRODUCT_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."MERCHS" ADD CONSTRAINT "SYS_C0025368" CHECK ("IMAGE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."MERCHS" ADD CONSTRAINT "SYS_C0025369" CHECK ("PRICE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."MERCHS" ADD CONSTRAINT "SYS_C0025370" CHECK ("EMAIL" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."MERCHS" ADD CONSTRAINT "SYS_C0025371" CHECK ("TIMESTAMP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."MERCHS" ADD CONSTRAINT "SYS_C0025372" CHECK ( price>=0 ) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table MERCHS
-- ----------------------------
CREATE TRIGGER "TFUSER4"."MERCH_NOTIFICATION" AFTER INSERT ON "TFUSER4"."MERCHS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
    U_USER_NAME VARCHAR2(100);
BEGIN

    SELECT FIRST_NAME || ' ' || USERS.LAST_NAME INTO U_USER_NAME
    FROM USERS
    WHERE USER_ID = :NEW.USER_ID;

    FOR F IN (SELECT * FROM FOLLOWS WHERE FOLLOWING = :NEW.USER_ID)
    LOOP
        INSERT INTO NOTIFICATION(notification_id, user_id, entity_name, entity_id, notification_text, notification_url, seen)
    VALUES (NOTIFICATION_SEQ.nextval, F.FOLLOWER , 'POSTS', :NEW.POST_ID ,U_USER_NAME ||' has posted a merchandise.',
            '/api/merch/' || :NEW.POST_ID ,'NO');
    end loop;
end;
/

-- ----------------------------
-- Primary Key structure for table NOTIFICATION
-- ----------------------------
ALTER TABLE "TFUSER4"."NOTIFICATION" ADD CONSTRAINT "NOTIFICATION_PK" PRIMARY KEY ("NOTIFICATION_ID");

-- ----------------------------
-- Checks structure for table NOTIFICATION
-- ----------------------------
ALTER TABLE "TFUSER4"."NOTIFICATION" ADD CONSTRAINT "ENTITY_NAME" CHECK ( entity_name in ('USERS', 'FOLLOWS', 'PENDING_MEMBERS', 'GROUP_MEMBERS', 'GROUPS',
	                                               'POSTS', 'LIKES', 'COMMENTS','EVENTS', 'EVENT_PARTICIPANTS') ) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."NOTIFICATION" ADD CONSTRAINT "SYS_C0025482" CHECK ("NOTIFICATION_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."NOTIFICATION" ADD CONSTRAINT "SYS_C0025483" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."NOTIFICATION" ADD CONSTRAINT "SYS_C0025484" CHECK ("ENTITY_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."NOTIFICATION" ADD CONSTRAINT "SYS_C0025485" CHECK ("ENTITY_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."NOTIFICATION" ADD CONSTRAINT "SYS_C0025486" CHECK ("NOTIFICATION_TEXT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."NOTIFICATION" ADD CONSTRAINT "SYS_C0025487" CHECK ("NOTIFICATION_URL" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."NOTIFICATION" ADD CONSTRAINT "SYS_C0025488" CHECK ("SEEN" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."NOTIFICATION" ADD CONSTRAINT "SYS_C0025489" CHECK ("TIMESTAMP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."NOTIFICATION" ADD CONSTRAINT "SYS_C0025490" CHECK ( seen in ('YES', 'NO') ) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table PENDING_MEMBERS
-- ----------------------------
ALTER TABLE "TFUSER4"."PENDING_MEMBERS" ADD CONSTRAINT "PENDING_MEMBERS_PK" PRIMARY KEY ("PENDING_MEMBER_ID");

-- ----------------------------
-- Uniques structure for table PENDING_MEMBERS
-- ----------------------------
ALTER TABLE "TFUSER4"."PENDING_MEMBERS" ADD CONSTRAINT "PENDING_MEMBERS_UNIQUE" UNIQUE ("USER_ID", "GROUP_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table PENDING_MEMBERS
-- ----------------------------
ALTER TABLE "TFUSER4"."PENDING_MEMBERS" ADD CONSTRAINT "SYS_C0023433" CHECK ("PENDING_MEMBER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."PENDING_MEMBERS" ADD CONSTRAINT "SYS_C0023434" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."PENDING_MEMBERS" ADD CONSTRAINT "SYS_C0023435" CHECK ("GROUP_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table PENDING_MEMBERS
-- ----------------------------
CREATE TRIGGER "TFUSER4"."PENDING_MEMBER_NOTIFICATION" AFTER INSERT ON "TFUSER4"."PENDING_MEMBERS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
    U_USER_NAME VARCHAR2(100);
    G_GROUP_NAME VARCHAR2(100);
    G_ADMIN_ID NUMBER;
BEGIN
    SELECT FIRST_NAME || ' ' || LAST_NAME INTO  U_USER_NAME
    FROM USERS
    WHERE USER_ID = :NEW.USER_ID;

    SELECT GROUP_NAME INTO G_GROUP_NAME
    FROM GROUPS
    WHERE GROUPS.GROUP_ID = :NEW.GROUP_ID;

    SELECT ADMIN_ID INTO G_ADMIN_ID
    FROM GROUPS
    WHERE GROUPS.GROUP_ID = :NEW.GROUP_ID;

    INSERT INTO NOTIFICATION(notification_id, user_id, entity_name, entity_id, notification_text, notification_url, seen)
    VALUES (NOTIFICATION_SEQ.nextval, G_ADMIN_ID , 'PENDING_MEMBERS', :NEW.PENDING_MEMBER_ID , U_USER_NAME || ' wants to join ' || G_GROUP_NAME, '/api/group/' || :NEW.GROUP_ID ,'NO');
end;
/
CREATE TRIGGER "TFUSER4"."PENDING_MEMBER_NOTIFICATION_REMOVE" AFTER DELETE ON "TFUSER4"."PENDING_MEMBERS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
BEGIN
    DELETE FROM NOTIFICATION
        WHERE ENTITY_ID = :OLD.PENDING_MEMBER_ID AND ENTITY_NAME = 'PENDING_MEMBERS';
end;
/

-- ----------------------------
-- Primary Key structure for table POSTS
-- ----------------------------
ALTER TABLE "TFUSER4"."POSTS" ADD CONSTRAINT "POSTS_PK" PRIMARY KEY ("POST_ID");

-- ----------------------------
-- Checks structure for table POSTS
-- ----------------------------
ALTER TABLE "TFUSER4"."POSTS" ADD CONSTRAINT "SYS_C0025320" CHECK ("POST_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."POSTS" ADD CONSTRAINT "SYS_C0025321" CHECK ("POST_TYPE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."POSTS" ADD CONSTRAINT "SYS_C0025322" CHECK ( post_type in ('group_post', 'blog','job_post','merch') ) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table POSTS
-- ----------------------------
CREATE TRIGGER "TFUSER4"."POST_NOTIFICATION_REMOVE" AFTER DELETE ON "TFUSER4"."POSTS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
BEGIN
    DELETE FROM NOTIFICATION
    WHERE ENTITY_NAME = 'POSTS' AND ENTITY_ID = :OLD.POST_ID;
end;
/

-- ----------------------------
-- Primary Key structure for table PUBLICATIONS
-- ----------------------------
ALTER TABLE "TFUSER4"."PUBLICATIONS" ADD CONSTRAINT "PUBLICATIONS_PK" PRIMARY KEY ("PUBLICATION_ID");

-- ----------------------------
-- Uniques structure for table PUBLICATIONS
-- ----------------------------
ALTER TABLE "TFUSER4"."PUBLICATIONS" ADD CONSTRAINT "PUBLICATIONS_UNIQUE" UNIQUE ("USER_ID", "TITLE", "AUTHORS", "JOURNAL", "PUBLICATION_DATE") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table PUBLICATIONS
-- ----------------------------
ALTER TABLE "TFUSER4"."PUBLICATIONS" ADD CONSTRAINT "SYS_C0023405" CHECK ("PUBLICATION_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."PUBLICATIONS" ADD CONSTRAINT "SYS_C0023406" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."PUBLICATIONS" ADD CONSTRAINT "SYS_C0023407" CHECK ("TITLE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."PUBLICATIONS" ADD CONSTRAINT "SYS_C0023408" CHECK ("AUTHORS" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."PUBLICATIONS" ADD CONSTRAINT "SYS_C0023409" CHECK ("JOURNAL" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."PUBLICATIONS" ADD CONSTRAINT "SYS_C0023410" CHECK ("PUBLICATION_DATE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table RESEARCH_INTERESTS
-- ----------------------------
ALTER TABLE "TFUSER4"."RESEARCH_INTERESTS" ADD CONSTRAINT "RESEARCH_INTERESTS_PK" PRIMARY KEY ("RESEARCH_INTEREST_ID");

-- ----------------------------
-- Uniques structure for table RESEARCH_INTERESTS
-- ----------------------------
ALTER TABLE "TFUSER4"."RESEARCH_INTERESTS" ADD CONSTRAINT "RESEARCH_INTERESTS_UNIQUE" UNIQUE ("RESEARCH_INTEREST", "USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table RESEARCH_INTERESTS
-- ----------------------------
ALTER TABLE "TFUSER4"."RESEARCH_INTERESTS" ADD CONSTRAINT "SYS_C0023366" CHECK ("RESEARCH_INTEREST_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."RESEARCH_INTERESTS" ADD CONSTRAINT "SYS_C0023367" CHECK ("RESEARCH_INTEREST" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."RESEARCH_INTERESTS" ADD CONSTRAINT "SYS_C0023368" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table REUNIONS
-- ----------------------------
ALTER TABLE "TFUSER4"."REUNIONS" ADD CONSTRAINT "REUNIONS_PK" PRIMARY KEY ("EVENT_ID");

-- ----------------------------
-- Checks structure for table REUNIONS
-- ----------------------------
ALTER TABLE "TFUSER4"."REUNIONS" ADD CONSTRAINT "SYS_C0025414" CHECK ("EVENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."REUNIONS" ADD CONSTRAINT "SYS_C0025415" CHECK ("EVENT_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."REUNIONS" ADD CONSTRAINT "SYS_C0025416" CHECK ("EVENT_DATE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."REUNIONS" ADD CONSTRAINT "SYS_C0025417" CHECK ("DESCRIPTION" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."REUNIONS" ADD CONSTRAINT "SYS_C0025418" CHECK ("FEES" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."REUNIONS" ADD CONSTRAINT "SYS_C0025419" CHECK ("GROUP_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."REUNIONS" ADD CONSTRAINT "SYS_C0025420" CHECK ("TIMESTAMP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."REUNIONS" ADD CONSTRAINT "SYS_C0025421" CHECK ( fees>=0 ) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table REUNIONS
-- ----------------------------
CREATE TRIGGER "TFUSER4"."REUNION_NOTIFICATION" AFTER INSERT ON "TFUSER4"."REUNIONS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
    G_GROUP_NAME VARCHAR2(1000);
BEGIN

    SELECT GROUP_NAME INTO G_GROUP_NAME
    FROM GROUPS
    WHERE GROUPS.GROUP_ID = :NEW.GROUP_ID;

    FOR GM IN (SELECT * FROM GROUP_MEMBERS WHERE GROUP_MEMBERS.GROUP_ID = :NEW.GROUP_ID)
    LOOP
        INSERT INTO NOTIFICATION(notification_id, user_id, entity_name, entity_id, notification_text, notification_url, seen)
        VALUES (NOTIFICATION_SEQ.nextval, GM.USER_ID , 'EVENTS', :NEW.EVENT_ID , G_GROUP_NAME ||' group is arranging a reunion',
            '/api/reunion/' || :NEW.EVENT_ID ,'NO');
    end loop;
end;
/
CREATE TRIGGER "TFUSER4"."REUNION_UPDATE_NOTIFICATION" AFTER UPDATE ON "TFUSER4"."REUNIONS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
BEGIN

    FOR EP IN (SELECT * FROM EVENT_PARTICIPANTS WHERE EVENT_ID = :NEW.EVENT_ID)
    LOOP
        INSERT INTO NOTIFICATION(notification_id, user_id, entity_name, entity_id, notification_text, notification_url, seen)
        VALUES (NOTIFICATION_SEQ.nextval, EP.USER_ID , 'EVENT_PARTICIPANTS', :NEW.EVENT_ID , :NEW.EVENT_NAME ||' event has updated',
            '/api/reunion/' || :NEW.EVENT_ID ,'NO');
    end loop;
end;
/

-- ----------------------------
-- Primary Key structure for table SCHEDULES
-- ----------------------------
ALTER TABLE "TFUSER4"."SCHEDULES" ADD CONSTRAINT "SCHEDULES_PK" PRIMARY KEY ("SCHEDULE_ID");

-- ----------------------------
-- Checks structure for table SCHEDULES
-- ----------------------------
ALTER TABLE "TFUSER4"."SCHEDULES" ADD CONSTRAINT "SYS_C0025395" CHECK ("SCHEDULE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."SCHEDULES" ADD CONSTRAINT "SYS_C0025396" CHECK ("EVENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."SCHEDULES" ADD CONSTRAINT "SYS_C0025397" CHECK ("START_TIME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."SCHEDULES" ADD CONSTRAINT "SYS_C0025398" CHECK ("END_TIME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."SCHEDULES" ADD CONSTRAINT "SYS_C0025399" CHECK ("DESCRIPTION" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table SCHEDULES
-- ----------------------------
CREATE TRIGGER "TFUSER4"."SCHEDULE_NOTIFICATION" AFTER INSERT OR UPDATE ON "TFUSER4"."SCHEDULES" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
    E_EVENT_TYPE VARCHAR2(1000);
BEGIN

    SELECT EVENT_TYPE INTO E_EVENT_TYPE
    FROM EVENTS
    WHERE EVENTS.EVENT_ID = :NEW.EVENT_ID;

    FOR EP IN (SELECT * FROM EVENT_PARTICIPANTS WHERE EVENT_ID = :NEW.EVENT_ID)
    LOOP
        INSERT INTO NOTIFICATION(notification_id, user_id, entity_name, entity_id, notification_text, notification_url, seen)
        VALUES (NOTIFICATION_SEQ.nextval, EP.USER_ID , 'EVENT_PARTICIPANTS', :NEW.EVENT_ID , 'An event that you are going has updated',
            '/api/'|| E_EVENT_TYPE ||'/' || :NEW.EVENT_ID ,'NO');
    end loop;
end;
/

-- ----------------------------
-- Primary Key structure for table SEMINARS
-- ----------------------------
ALTER TABLE "TFUSER4"."SEMINARS" ADD CONSTRAINT "SEMINARS_PK" PRIMARY KEY ("EVENT_ID");

-- ----------------------------
-- Checks structure for table SEMINARS
-- ----------------------------
ALTER TABLE "TFUSER4"."SEMINARS" ADD CONSTRAINT "SYS_C0025425" CHECK ("EVENT_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."SEMINARS" ADD CONSTRAINT "SYS_C0025426" CHECK ("EVENT_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."SEMINARS" ADD CONSTRAINT "SYS_C0025427" CHECK ("EVENT_DATE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."SEMINARS" ADD CONSTRAINT "SYS_C0025428" CHECK ("DESCRIPTION" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."SEMINARS" ADD CONSTRAINT "SYS_C0025429" CHECK ("FEES" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."SEMINARS" ADD CONSTRAINT "SYS_C0025430" CHECK ("TOPIC" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."SEMINARS" ADD CONSTRAINT "SYS_C0025431" CHECK ("AVAILABLE_FOR" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."SEMINARS" ADD CONSTRAINT "SYS_C0025432" CHECK ("GROUP_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."SEMINARS" ADD CONSTRAINT "SYS_C0025433" CHECK ("TIMESTAMP" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."SEMINARS" ADD CONSTRAINT "SYS_C0025434" CHECK ( fees>=0 ) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table SEMINARS
-- ----------------------------
CREATE TRIGGER "TFUSER4"."SEMINAR_NOTIFICATION" AFTER INSERT ON "TFUSER4"."SEMINARS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
    G_GROUP_NAME VARCHAR2(1000);
BEGIN

    SELECT GROUP_NAME INTO G_GROUP_NAME
    FROM GROUPS
    WHERE GROUPS.GROUP_ID = :NEW.GROUP_ID;

    FOR GM IN (SELECT * FROM GROUP_MEMBERS WHERE GROUP_MEMBERS.GROUP_ID = :NEW.GROUP_ID)
    LOOP
        INSERT INTO NOTIFICATION(notification_id, user_id, entity_name, entity_id, notification_text, notification_url, seen)
        VALUES (NOTIFICATION_SEQ.nextval, GM.USER_ID , 'EVENTS', :NEW.EVENT_ID , G_GROUP_NAME ||' group is arranging seminar',
            '/api/seminar/' || :NEW.EVENT_ID ,'NO');
    end loop;
end;
/
CREATE TRIGGER "TFUSER4"."SEMINAR_UPDATE_NOTIFICATION" AFTER UPDATE ON "TFUSER4"."SEMINARS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
BEGIN

    FOR EP IN (SELECT * FROM EVENT_PARTICIPANTS WHERE EVENT_ID = :NEW.EVENT_ID)
    LOOP
        INSERT INTO NOTIFICATION(notification_id, user_id, entity_name, entity_id, notification_text, notification_url, seen)
        VALUES (NOTIFICATION_SEQ.nextval, EP.USER_ID , 'EVENT_PARTICIPANTS', :NEW.EVENT_ID , :NEW.EVENT_NAME ||' event has updated',
            '/api/seminar/' || :NEW.EVENT_ID ,'NO');
    end loop;
end;
/

-- ----------------------------
-- Primary Key structure for table SKILLS
-- ----------------------------
ALTER TABLE "TFUSER4"."SKILLS" ADD CONSTRAINT "SKILLS_PK" PRIMARY KEY ("SKILL_ID");

-- ----------------------------
-- Uniques structure for table SKILLS
-- ----------------------------
ALTER TABLE "TFUSER4"."SKILLS" ADD CONSTRAINT "SKILLS_UNIQUE" UNIQUE ("SKILL", "USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table SKILLS
-- ----------------------------
ALTER TABLE "TFUSER4"."SKILLS" ADD CONSTRAINT "SYS_C0023360" CHECK ("SKILL_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."SKILLS" ADD CONSTRAINT "SYS_C0023361" CHECK ("SKILL" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."SKILLS" ADD CONSTRAINT "SYS_C0023362" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table USERS
-- ----------------------------
ALTER TABLE "TFUSER4"."USERS" ADD CONSTRAINT "USERS_PK" PRIMARY KEY ("USER_ID");

-- ----------------------------
-- Uniques structure for table USERS
-- ----------------------------
ALTER TABLE "TFUSER4"."USERS" ADD CONSTRAINT "SYS_C0023359" UNIQUE ("EMAIL") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table USERS
-- ----------------------------
ALTER TABLE "TFUSER4"."USERS" ADD CONSTRAINT "EMAIL_CHECK" CHECK ( email like '_%@__%.__%') NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."USERS" ADD CONSTRAINT "SYS_C0023345" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."USERS" ADD CONSTRAINT "SYS_C0023346" CHECK ("FIRST_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."USERS" ADD CONSTRAINT "SYS_C0023347" CHECK ("LAST_NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."USERS" ADD CONSTRAINT "SYS_C0023348" CHECK ("DEPARTMENT" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."USERS" ADD CONSTRAINT "SYS_C0023349" CHECK ("BATCH" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."USERS" ADD CONSTRAINT "SYS_C0023350" CHECK ("GENDER" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."USERS" ADD CONSTRAINT "SYS_C0023351" CHECK ("CITY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."USERS" ADD CONSTRAINT "SYS_C0023352" CHECK ("COUNTRY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."USERS" ADD CONSTRAINT "SYS_C0023353" CHECK ("EMAIL" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."USERS" ADD CONSTRAINT "SYS_C0023354" CHECK ("PASSWORD" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."USERS" ADD CONSTRAINT "SYS_C0023355" CHECK ( department in
	                                        ('Chemical Engineering',
                                            'Materials and Metallurgical Engineering',
	                                        'Civil Engineering',
	                                        'Water Resources Engineering',
	                                        'Mechanical Engineering',
	                                        'Industrial and Production Engineering',
	                                        'Naval Architecture and Marine Engineering',
	                                        'Electrical and Electronic Engineering',
	                                        'Computer Science and Engineering',
	                                        'Biomedical Engineering',
	                                        'Architecture',
	                                        'Urban and Regional Planning'
	                                         ) ) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."USERS" ADD CONSTRAINT "SYS_C0023356" CHECK ( gender in ('Male','Female','Others') ) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Triggers structure for table USERS
-- ----------------------------
CREATE TRIGGER "TFUSER4"."WELCOME_USER_NOTIFICATION" AFTER INSERT ON "TFUSER4"."USERS" REFERENCING OLD AS "OLD" NEW AS "NEW" FOR EACH ROW 
DECLARE
BEGIN
    INSERT INTO NOTIFICATION(notification_id, user_id, entity_name, entity_id, notification_text, notification_url, seen)
    VALUES (NOTIFICATION_SEQ.nextval, :NEW.USER_ID, 'USERS', :NEW.USER_ID, 'Welcome to ALUMNET. Click here to add info in your profile...', '/api/user/edit','NO');
end;
/

-- ----------------------------
-- Primary Key structure for table WORK_EXPERIENCE
-- ----------------------------
ALTER TABLE "TFUSER4"."WORK_EXPERIENCE" ADD CONSTRAINT "WORK_EXPERIENCE_PK" PRIMARY KEY ("WORK_EXPERIENCE_ID");

-- ----------------------------
-- Uniques structure for table WORK_EXPERIENCE
-- ----------------------------
ALTER TABLE "TFUSER4"."WORK_EXPERIENCE" ADD CONSTRAINT "WORK_EXPERIENCE_UNIQUE" UNIQUE ("USER_ID", "ORGANIZATION", "EMPLOYMENT_TYPE", "DESIGNATION", "START_DATE") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Checks structure for table WORK_EXPERIENCE
-- ----------------------------
ALTER TABLE "TFUSER4"."WORK_EXPERIENCE" ADD CONSTRAINT "SYS_C0023387" CHECK ("WORK_EXPERIENCE_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."WORK_EXPERIENCE" ADD CONSTRAINT "SYS_C0023388" CHECK ("USER_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."WORK_EXPERIENCE" ADD CONSTRAINT "SYS_C0023389" CHECK ("ORGANIZATION" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."WORK_EXPERIENCE" ADD CONSTRAINT "SYS_C0023390" CHECK ("EMPLOYMENT_TYPE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."WORK_EXPERIENCE" ADD CONSTRAINT "SYS_C0023391" CHECK ("DESIGNATION" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."WORK_EXPERIENCE" ADD CONSTRAINT "SYS_C0023392" CHECK ("START_DATE" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."WORK_EXPERIENCE" ADD CONSTRAINT "SYS_C0023393" CHECK (  employment_type in ('Part-Time', 'Full-Time',
                                                        'Self-Employed','Internship',
                                                       'Freelance', 'Contract', 'Seasonal')) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."WORK_EXPERIENCE" ADD CONSTRAINT "WORK_EXPERIENCE_CHECK" CHECK ( start_date < end_date ) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table ACHIEVEMENTS
-- ----------------------------
ALTER TABLE "TFUSER4"."ACHIEVEMENTS" ADD CONSTRAINT "ACHIEVEMENTS_FK" FOREIGN KEY ("USER_ID") REFERENCES "TFUSER4"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table BLOGS
-- ----------------------------
ALTER TABLE "TFUSER4"."BLOGS" ADD CONSTRAINT "BLOGS_FK1" FOREIGN KEY ("POST_ID") REFERENCES "TFUSER4"."POSTS" ("POST_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."BLOGS" ADD CONSTRAINT "BLOGS_FK2" FOREIGN KEY ("USER_ID") REFERENCES "TFUSER4"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table COMMENTS
-- ----------------------------
ALTER TABLE "TFUSER4"."COMMENTS" ADD CONSTRAINT "COMMENTS_FK1" FOREIGN KEY ("POST_ID") REFERENCES "TFUSER4"."POSTS" ("POST_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."COMMENTS" ADD CONSTRAINT "COMMENTS_FK2" FOREIGN KEY ("USER_ID") REFERENCES "TFUSER4"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table CO_CURRICULARS
-- ----------------------------
ALTER TABLE "TFUSER4"."CO_CURRICULARS" ADD CONSTRAINT "CO_CURRICULARS_FK1" FOREIGN KEY ("EVENT_ID") REFERENCES "TFUSER4"."EVENTS" ("EVENT_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."CO_CURRICULARS" ADD CONSTRAINT "CO_CURRICULARS_FK2" FOREIGN KEY ("GROUP_ID") REFERENCES "TFUSER4"."GROUPS" ("GROUP_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table EDUCATION
-- ----------------------------
ALTER TABLE "TFUSER4"."EDUCATION" ADD CONSTRAINT "EDUCATION_FK" FOREIGN KEY ("USER_ID") REFERENCES "TFUSER4"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table EVENT_PARTICIPANTS
-- ----------------------------
ALTER TABLE "TFUSER4"."EVENT_PARTICIPANTS" ADD CONSTRAINT "EVENT_PARTICIPANTS_FK1" FOREIGN KEY ("EVENT_ID") REFERENCES "TFUSER4"."EVENTS" ("EVENT_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."EVENT_PARTICIPANTS" ADD CONSTRAINT "EVENT_PARTICIPANTS_FK2" FOREIGN KEY ("USER_ID") REFERENCES "TFUSER4"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table FOLLOWS
-- ----------------------------
ALTER TABLE "TFUSER4"."FOLLOWS" ADD CONSTRAINT "FOLLOWS_FK1" FOREIGN KEY ("FOLLOWER") REFERENCES "TFUSER4"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."FOLLOWS" ADD CONSTRAINT "FOLLOWS_FK2" FOREIGN KEY ("FOLLOWING") REFERENCES "TFUSER4"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table GROUPS
-- ----------------------------
ALTER TABLE "TFUSER4"."GROUPS" ADD CONSTRAINT "GROUPS_FK" FOREIGN KEY ("ADMIN_ID") REFERENCES "TFUSER4"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table GROUP_MEMBERS
-- ----------------------------
ALTER TABLE "TFUSER4"."GROUP_MEMBERS" ADD CONSTRAINT "GROUP_MEMBERS_FK1" FOREIGN KEY ("USER_ID") REFERENCES "TFUSER4"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."GROUP_MEMBERS" ADD CONSTRAINT "GROUP_MEMBERS_FK2" FOREIGN KEY ("GROUP_ID") REFERENCES "TFUSER4"."GROUPS" ("GROUP_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table GROUP_POSTS
-- ----------------------------
ALTER TABLE "TFUSER4"."GROUP_POSTS" ADD CONSTRAINT "GROUP_POSTS_FK1" FOREIGN KEY ("POST_ID") REFERENCES "TFUSER4"."POSTS" ("POST_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."GROUP_POSTS" ADD CONSTRAINT "GROUP_POSTS_FK2" FOREIGN KEY ("GROUP_MEMBER_ID") REFERENCES "TFUSER4"."GROUP_MEMBERS" ("GROUP_MEMBER_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table INTERESTS
-- ----------------------------
ALTER TABLE "TFUSER4"."INTERESTS" ADD CONSTRAINT "INTERESTS_FK" FOREIGN KEY ("USER_ID") REFERENCES "TFUSER4"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table JOB_APPLICATION
-- ----------------------------
ALTER TABLE "TFUSER4"."JOB_APPLICATION" ADD CONSTRAINT "JOB_APPLICATION_FK1" FOREIGN KEY ("POST_ID") REFERENCES "TFUSER4"."POSTS" ("POST_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."JOB_APPLICATION" ADD CONSTRAINT "JOB_APPLICATION_FK2" FOREIGN KEY ("USER_ID") REFERENCES "TFUSER4"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table JOB_POSTS
-- ----------------------------
ALTER TABLE "TFUSER4"."JOB_POSTS" ADD CONSTRAINT "JOB_POSTS_FK1" FOREIGN KEY ("POST_ID") REFERENCES "TFUSER4"."POSTS" ("POST_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."JOB_POSTS" ADD CONSTRAINT "JOB_POSTS_FK2" FOREIGN KEY ("USER_ID") REFERENCES "TFUSER4"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table LIKES
-- ----------------------------
ALTER TABLE "TFUSER4"."LIKES" ADD CONSTRAINT "LIKES_FK1" FOREIGN KEY ("POST_ID") REFERENCES "TFUSER4"."POSTS" ("POST_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."LIKES" ADD CONSTRAINT "LIKES_FK2" FOREIGN KEY ("USER_ID") REFERENCES "TFUSER4"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table MERCHS
-- ----------------------------
ALTER TABLE "TFUSER4"."MERCHS" ADD CONSTRAINT "MERCHS_FK1" FOREIGN KEY ("POST_ID") REFERENCES "TFUSER4"."POSTS" ("POST_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."MERCHS" ADD CONSTRAINT "MERCHS_FK2" FOREIGN KEY ("USER_ID") REFERENCES "TFUSER4"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table NOTIFICATION
-- ----------------------------
ALTER TABLE "TFUSER4"."NOTIFICATION" ADD CONSTRAINT "NOTIFICATION_FK" FOREIGN KEY ("USER_ID") REFERENCES "TFUSER4"."USERS" ("USER_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table PENDING_MEMBERS
-- ----------------------------
ALTER TABLE "TFUSER4"."PENDING_MEMBERS" ADD CONSTRAINT "PENDING_MEMBERS_FK1" FOREIGN KEY ("USER_ID") REFERENCES "TFUSER4"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."PENDING_MEMBERS" ADD CONSTRAINT "PENDING_MEMBERS_FK2" FOREIGN KEY ("GROUP_ID") REFERENCES "TFUSER4"."GROUPS" ("GROUP_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table PUBLICATIONS
-- ----------------------------
ALTER TABLE "TFUSER4"."PUBLICATIONS" ADD CONSTRAINT "PUBLICATIONS_FK" FOREIGN KEY ("USER_ID") REFERENCES "TFUSER4"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table RESEARCH_INTERESTS
-- ----------------------------
ALTER TABLE "TFUSER4"."RESEARCH_INTERESTS" ADD CONSTRAINT "RESEARCH_INTERESTS_FK" FOREIGN KEY ("USER_ID") REFERENCES "TFUSER4"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table REUNIONS
-- ----------------------------
ALTER TABLE "TFUSER4"."REUNIONS" ADD CONSTRAINT "REUNIONS_FK1" FOREIGN KEY ("EVENT_ID") REFERENCES "TFUSER4"."EVENTS" ("EVENT_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."REUNIONS" ADD CONSTRAINT "REUNIONS_FK2" FOREIGN KEY ("GROUP_ID") REFERENCES "TFUSER4"."GROUPS" ("GROUP_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table SCHEDULES
-- ----------------------------
ALTER TABLE "TFUSER4"."SCHEDULES" ADD CONSTRAINT "SCHEDULES_FK" FOREIGN KEY ("EVENT_ID") REFERENCES "TFUSER4"."EVENTS" ("EVENT_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table SEMINARS
-- ----------------------------
ALTER TABLE "TFUSER4"."SEMINARS" ADD CONSTRAINT "SEMINARS_FK1" FOREIGN KEY ("EVENT_ID") REFERENCES "TFUSER4"."EVENTS" ("EVENT_ID") ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "TFUSER4"."SEMINARS" ADD CONSTRAINT "SEMINARS_FK2" FOREIGN KEY ("GROUP_ID") REFERENCES "TFUSER4"."GROUPS" ("GROUP_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table SKILLS
-- ----------------------------
ALTER TABLE "TFUSER4"."SKILLS" ADD CONSTRAINT "SKILLS_FK" FOREIGN KEY ("USER_ID") REFERENCES "TFUSER4"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Foreign Keys structure for table WORK_EXPERIENCE
-- ----------------------------
ALTER TABLE "TFUSER4"."WORK_EXPERIENCE" ADD CONSTRAINT "WORK_EXPERIENCE_FK" FOREIGN KEY ("USER_ID") REFERENCES "TFUSER4"."USERS" ("USER_ID") NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
