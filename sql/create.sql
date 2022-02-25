create table USERS (
    user_id NUMBER NOT NULL ,
    first_name VARCHAR2(50) NOT NULL,
	last_name VARCHAR2(50) NOT NULL,
	department VARCHAR2(50) NOT NULL check ( department in
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
	                                         ) ),
	batch NUMBER NOT NULL,
	gender VARCHAR2(50) NOT NULL check( gender in ('Male','Female','Others') ),
	city VARCHAR2(50) NOT NULL,
	state VARCHAR2(50),
	country VARCHAR2(50) NOT NULL,
	phone_no VARCHAR2(50),
	email VARCHAR2(50) NOT NULL UNIQUE,
	password VARCHAR2(1000) NOT NULL,
	about_me VARCHAR2(1000),
	date_of_birth DATE,
	profile_picture VARCHAR2(1000),
	student_id VARCHAR2(50),
	hall VARCHAR2(50),
	facebook VARCHAR2(50),
	twitter VARCHAR2(50),
	linkedin VARCHAR2(50),
	google_scholar VARCHAR2(50),
	research_gate VARCHAR2(50),
	CONSTRAINT USERS_PK PRIMARY KEY(user_id),
	CONSTRAINT EMAIL_CHECK CHECK ( email like '_%@__%.__%')
);

CREATE TABLE SKILLS
(
    skill_id NUMBER NOT NULL ,
	skill VARCHAR2(128) NOT NULL,
	user_id NUMBER NOT NULL,
	CONSTRAINT SKILLS_PK PRIMARY KEY(skill_id),
	CONSTRAINT SKILLS_FK FOREIGN KEY(user_id) REFERENCES USERS(user_id),
	CONSTRAINT SKILLS_UNIQUE UNIQUE (skill, user_id)
);

CREATE TABLE RESEARCH_INTERESTS
(
    research_interest_id NUMBER NOT NULL ,
	research_interest VARCHAR2(128) NOT NULL,
	user_id NUMBER NOT NULL,
	CONSTRAINT RESEARCH_INTERESTS_PK PRIMARY KEY(research_interest_id),
	CONSTRAINT RESEARCH_INTERESTS_FK FOREIGN KEY(user_id) REFERENCES USERS(user_id),
	CONSTRAINT RESEARCH_INTERESTS_UNIQUE UNIQUE(research_interest, user_id)
);

CREATE TABLE INTERESTS
(
    interest_id NUMBER NOT NULL ,
	interest VARCHAR2(128) NOT NULL,
	user_id NUMBER NOT NULL,
	CONSTRAINT INTERESTS_PK PRIMARY KEY(interest_id),
	CONSTRAINT INTERESTS_FK FOREIGN KEY(user_id) REFERENCES USERS(user_id),
	CONSTRAINT INTERESTS_UNIQUE UNIQUE (interest, user_id)
);

CREATE TABLE EDUCATION
(
    education_id NUMBER NOT NULL ,
	user_id NUMBER NOT NULL,
	institute VARCHAR2(128) NOT NULL,
	field_of_study VARCHAR2(50),
	degree VARCHAR2(50) NOT NULL,
	grade VARCHAR2(20),
	start_date DATE NOT NULL,
	end_date DATE,
	CONSTRAINT EDUCATION_PK PRIMARY KEY(education_id),
	CONSTRAINT EDUCATION_FK FOREIGN KEY(user_id) REFERENCES USERS(user_id),
	CONSTRAINT EDUCATION_UNIQUE UNIQUE (user_id, institute, degree, start_date),
	CONSTRAINT EDUCATION_CHECK CHECK ( start_date < end_date )
);

CREATE TABLE WORK_EXPERIENCE
(
    work_experience_id NUMBER NOT NULL ,
	user_id NUMBER NOT NULL,
	organization VARCHAR2(128) NOT NULL,
	employment_type VARCHAR2(50) NOT NULL check (  employment_type in ('Part-Time', 'Full-Time',
                                                        'Self-Employed','Internship',
                                                       'Freelance', 'Contract', 'Seasonal')),
	designation VARCHAR2(50) NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE,
	CONSTRAINT WORK_EXPERIENCE_PK PRIMARY KEY(work_experience_id),
	CONSTRAINT WORK_EXPERIENCE_FK FOREIGN KEY(user_id) REFERENCES USERS(user_id),
	CONSTRAINT WORK_EXPERIENCE_UNIQUE UNIQUE (user_id, organization, employment_type, designation, start_date),
	CONSTRAINT WORK_EXPERIENCE_CHECK CHECK ( start_date < end_date )
);

CREATE TABLE ACHIEVEMENTS
(
    achievement_id NUMBER NOT NULL ,
	user_id NUMBER NOT NULL,
	achievement_name VARCHAR2(128) NOT NULL,
	achievement_date DATE NOT NULL,
	organized_by VARCHAR2(128),
	position VARCHAR2(50),
	CONSTRAINT ACHIEVEMENTS_PK PRIMARY KEY(achievement_id),
	CONSTRAINT ACHIEVEMENTS_FK FOREIGN KEY(user_id) REFERENCES USERS(user_id),
	CONSTRAINT ACHIEVEMENTS_UNIQUE UNIQUE (user_id, achievement_name, achievement_date)
);

CREATE TABLE PUBLICATIONS
(
    publication_id NUMBER NOT NULL ,
	user_id NUMBER NOT NULL,
	title VARCHAR2(128) NOT NULL,
	authors VARCHAR2(1024) NOT NULL,
	journal VARCHAR2(128) NOT NULL,
	publication_date DATE NOT NULL,
	pdf_link VARCHAR2(50),
	CONSTRAINT PUBLICATIONS_PK PRIMARY KEY(publication_id),
	CONSTRAINT PUBLICATIONS_FK FOREIGN KEY(user_id) REFERENCES USERS(user_id),
	CONSTRAINT PUBLICATIONS_UNIQUE UNIQUE (user_id, title, authors, journal, publication_date)
);

CREATE TABLE FOLLOWS
(
    follower NUMBER NOT NULL,
	following NUMBER NOT NULL,
	CONSTRAINT FOLLOWS_PK PRIMARY KEY(follower, following),
	CONSTRAINT FOLLOWS_FK1 FOREIGN KEY(follower) REFERENCES USERS(user_id),
	CONSTRAINT FOLLOWS_FK2 FOREIGN KEY(following) REFERENCES USERS(user_id),
	CONSTRAINT FOLLOWS_CHECK CHECK ( follower <> following )
);

create TABLE groups(
    group_id NUMBER NOT NULL ,
    group_name VARCHAR2(50) NOT NULL,
    description CLOB,
    date_of_creation DATE DEFAULT SYSDATE NOT NULL ,
    cover_photo VARCHAR2(1000),
    admin_id NUMBER NOT NULL,
    CONSTRAINT groups_pk PRIMARY KEY (group_id),
    CONSTRAINT groups_fk FOREIGN KEY (admin_id) REFERENCES USERS(user_id)
);

create TABLE group_members(
    group_member_id NUMBER NOT NULL ,
    user_id NUMBER NOT NULL ,
    group_id NUMBER NOT NULL ,
    constraint group_members_pk PRIMARY KEY(group_member_id),
    constraint group_members_fk1 FOREIGN KEY(user_id) REFERENCES USERS(user_id),
    constraint group_members_fk2 FOREIGN KEY(group_id) REFERENCES GROUPS(group_id) on delete cascade,
    constraint group_members_unique UNIQUE (user_id, group_id)
);

create TABLE pending_members(
    pending_member_id NUMBER NOT NULL ,
    user_id NUMBER NOT NULL ,
    group_id NUMBER NOT NULL ,
    constraint pending_members_pk PRIMARY KEY(pending_member_id),
    constraint pending_members_fk1 FOREIGN KEY(user_id) REFERENCES USERS(user_id),
    constraint pending_members_fk2 FOREIGN KEY(group_id) REFERENCES GROUPS(group_id) on delete cascade,
    constraint pending_members_unique UNIQUE (user_id, group_id)
);

create Table posts(
    post_id NUMBER NOT NULL ,
    post_type VARCHAR2(50) NOT NULL check ( post_type in ('group_post', 'blog','job_post','merch') ) ,
    constraint posts_pk PRIMARY KEY (post_id)
);

create table group_posts(
    post_id NUMBER NOT NULL ,
    topic VARCHAR2(50) NOT NULL ,
    group_member_id NUMBER NOT NULL ,
    description CLOB NOT NULL ,
    timestamp TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
    constraint group_posts_pk primary key (post_id),
    constraint group_posts_fk1 foreign key (post_id) references posts(post_id) on delete cascade ,
    constraint group_posts_fk2 foreign key (group_member_id) references group_members(group_member_id) on delete cascade
);

create table blogs(
    post_id NUMBER NOT NULL ,
    user_id NUMBER NOT NULL ,
    topic VARCHAR2(50) NOT NULL ,
    title VARCHAR2(254) NOT NULL ,
    description CLOB NOT NULL ,
    timestamp TIMESTAMP DEFAULT systimestamp NOT NULL ,
    constraint blogs_pk primary key (post_id),
    constraint blogs_fk1 foreign key (post_id) references posts(post_id) on delete cascade ,
    constraint blogs_fk2 foreign key (user_id) references USERS(user_id)
);

create table job_posts(
    post_id NUMBER NOT NULL ,
    user_id NUMBER NOT NULL ,
    company_name VARCHAR2(50) NOT NULL ,
    job_type VARCHAR2(50) NOT NULL check ( job_type in ('Part-Time', 'Full-Time',
                                                        'Self-Employed','Internship',
                                                       'Freelance', 'Contract', 'Seasonal') ),
    remote VARCHAR2(50) NOT NULL check ( remote in ('Yes','No') ),
    latitude NUMBER,
    longitude NUMBER,
    requirements VARCHAR2(1024) NOT NULL,
    designation VARCHAR2(128) NOT NULL ,
    expected_salary NUMBER NOT NULL CHECK (expected_salary>=0 ) ,
    vacancy NUMBER(15) CHECK (vacancy is null or vacancy >0 ),
    email VARCHAR2(50) NOT NULL ,
    phone_no VARCHAR2(50),
    timestamp TIMESTAMP DEFAULT systimestamp NOT NULL ,
    constraint job_posts_pk primary key (post_id),
    constraint job_posts_fk1 foreign key (post_id) references posts(post_id) on delete cascade ,
    constraint job_posts_fk2 foreign key (user_id) references USERS(user_id)
);

CREATE TABLE JOB_APPLICATION(
    post_id NUMBER NOT NULL ,
    user_id NUMBER NOT NULL ,
    cv CLOB NOT NULL ,
    timestamp TIMESTAMP default SYSTIMESTAMP NOT NULL ,
    constraint JOB_APPLICATION_PK primary key (post_id, user_id),
    constraint JOB_APPLICATION_FK1 foreign key (post_id) references posts(post_id) on delete cascade ,
    constraint JOB_APPLICATION_FK2 foreign key (user_id) references USERS(user_id)
);

create table merchs
(
    post_id NUMBER NOT NULL,
    user_id NUMBER NOT NULL,
    product_name VARCHAR2(50) NOT NULL ,
    image VARCHAR2(1024) NOT NULL ,
    price NUMBER NOT NULL CHECK ( price>=0 ),
    email VARCHAR2(50) NOT NULL ,
    phone_no VARCHAR2(50),
    description CLOB,
    timestamp TIMESTAMP DEFAULT systimestamp NOT NULL ,
    constraint merchs_pk primary key (post_id),
    constraint merchs_fk1 foreign key (post_id) references posts(post_id) on delete cascade ,
    constraint merchs_fk2 foreign key (user_id) references USERS(user_id)
);

create table comments(
    comment_id NUMBER NOT NULL ,
    post_id NUMBER NOT NULL,
    user_id NUMBER NOT NULL,
    body VARCHAR2(1024) NOT NULL ,
    timestamp TIMESTAMP DEFAULT systimestamp NOT NULL ,
    constraint comments_pk primary key (comment_id),
    constraint comments_fk1 foreign key (post_id) references posts(post_id) on delete cascade,
    constraint comments_fk2 foreign key (user_id) references USERS(user_id)
);

create table likes(
    like_id NUMBER NOT NULL ,
    post_id NUMBER NOT NULL,
    user_id NUMBER NOT NULL,
    constraint likes_pk primary key (like_id),
    constraint likes_fk1 foreign key (post_id) references posts(post_id) on delete cascade,
    constraint likes_fk2 foreign key (user_id) references USERS(user_id),
    constraint likes_unique unique (user_id, post_id)
);

CREATE TABLE EVENTS(
	event_id NUMBER NOT NULL ,
	event_type VARCHAR2(20) NOT NULL check ( event_type in ('co_curricular',
	                                                       'reunion', 'seminar') ),
	CONSTRAINT EVENTS_PK PRIMARY KEY(event_id)
);

CREATE TABLE SCHEDULES(
    schedule_id NUMBER NOT NULL ,
	event_id NUMBER NOT NULL,
	start_time TIMESTAMP NOT NULL,
	end_time TIMESTAMP NOT NULL,
	description VARCHAR2(256) NOT NULL,
	CONSTRAINT SCHEDULES_PK PRIMARY KEY(schedule_id),
	CONSTRAINT SCHEDULES_FK FOREIGN KEY(event_id) REFERENCES EVENTS(event_id)
);

CREATE TABLE CO_CURRICULARS(
	event_id NUMBER NOT NULL,
	event_name VARCHAR2(256) NOT NULL,
	event_date DATE NOT NULL,
	cover_photo VARCHAR2(1000),
	description CLOB NOT NULL ,
	latitude NUMBER,
	longitude NUMBER,
	platform VARCHAR2(1000),
	fees NUMBER DEFAULT 0 NOT NULL check ( fees>=0 ),
	available_for VARCHAR2(1000) default 'All' NOT NULL ,
	group_id NUMBER NOT NULL,
	timestamp timestamp default systimestamp NOT NULL ,
	CONSTRAINT CO_CURRICULARS_PK PRIMARY KEY(event_id),
	CONSTRAINT CO_CURRICULARS_FK1 FOREIGN KEY(event_id) REFERENCES EVENTS(event_id) on delete cascade ,
	CONSTRAINT CO_CURRICULARS_FK2 FOREIGN KEY(group_id) REFERENCES GROUPS(group_id)
);

CREATE TABLE REUNIONS(
	event_id NUMBER NOT NULL,
	event_name VARCHAR2(256) NOT NULL,
	event_date DATE NOT NULL,
	cover_photo VARCHAR2(1000),
	description CLOB NOT NULL ,
	latitude NUMBER,
	longitude NUMBER,
	platform VARCHAR2(1000),
	fees NUMBER DEFAULT 0 NOT NULL check ( fees>=0 ),
	batch VARCHAR2(1000),
	department VARCHAR2(1000),
	group_id NUMBER NOT NULL,
	timestamp timestamp default systimestamp NOT NULL ,
	CONSTRAINT REUNIONS_PK PRIMARY KEY(event_id),
	CONSTRAINT REUNIONS_FK1 FOREIGN KEY(event_id) REFERENCES EVENTS(event_id) on delete cascade ,
	CONSTRAINT REUNIONS_FK2 FOREIGN KEY(group_id) REFERENCES GROUPS(group_id)
);

CREATE TABLE SEMINARS(
	event_id NUMBER NOT NULL,
	event_name VARCHAR2(256) NOT NULL,
	event_date DATE NOT NULL,
	cover_photo VARCHAR2(1000),
	description CLOB NOT NULL ,
	latitude NUMBER,
	longitude NUMBER,
	platform VARCHAR2(1000),
	fees NUMBER DEFAULT 0 NOT NULL check ( fees>=0 ),
	topic VARCHAR2(1000) NOT NULL,
	special_guests VARCHAR2(1000),
	available_for VARCHAR2(1000) default 'All' NOT NULL ,
	group_id NUMBER NOT NULL,
	timestamp timestamp default systimestamp NOT NULL ,
	CONSTRAINT SEMINARS_PK PRIMARY KEY(event_id),
	CONSTRAINT SEMINARS_FK1 FOREIGN KEY(event_id) REFERENCES EVENTS(event_id) on delete cascade ,
	CONSTRAINT SEMINARS_FK2 FOREIGN KEY(group_id) REFERENCES GROUPS(group_id)
);

CREATE TABLE EVENT_PARTICIPANTS(
	event_id NUMBER NOT NULL,
	user_id NUMBER NOT NULL,
	CONSTRAINT EVENT_PARTICIPANTS_PK PRIMARY KEY(event_id, user_id),
	CONSTRAINT EVENT_PARTICIPANTS_FK1 FOREIGN KEY(event_id) REFERENCES EVENTS(event_id) on delete cascade ,
	CONSTRAINT EVENT_PARTICIPANTS_FK2 FOREIGN KEY(user_id) REFERENCES USERS(user_id)
);

CREATE TABLE NOTIFICATION(
	notification_id NUMBER NOT NULL,
	user_id NUMBER NOT NULL,
	entity_name VARCHAR2(100) NOT NULL ,
	entity_id NUMBER NOT NULL ,
	notification_text VARCHAR2(100) NOT NULL ,
	notification_url VARCHAR2(100) NOT NULL ,
	seen VARCHAR2(100) NOT NULL check ( seen in ('YES', 'NO') ),
	TIMESTAMP TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
	CONSTRAINT NOTIFICATION_PK PRIMARY KEY(notification_id),
	CONSTRAINT NOTIFICATION_FK FOREIGN KEY(user_id) REFERENCES USERS(user_id) on delete cascade,
	CONSTRAINT entity_name CHECK ( entity_name in ('USERS', 'FOLLOWS', 'PENDING_MEMBERS', 'GROUP_MEMBERS', 'GROUPS',
	                                               'POSTS', 'LIKES', 'COMMENTS','EVENTS', 'EVENT_PARTICIPANTS') )
);
