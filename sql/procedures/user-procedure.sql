CREATE OR REPLACE PROCEDURE CREATE_USER(
    U_FIRST_NAME IN USERS.FIRST_NAME%type,
    U_LAST_NAME IN USERS.LAST_NAME%type,
    U_DEPARTMENT IN USERS.department%type,
    U_BATCH IN USERS.batch%type,
    U_GENDER IN USERS.GENDER%type,
    U_CITY IN USERS.CITY%type,
    U_STATE IN USERS.STATE%type,
    U_COUNTRY IN USERS.COUNTRY%type,
    U_EMAIL IN USERS.EMAIL%type,
    U_PASSWORD IN USERS.PASSWORD%type,
    RESULT OUT VARCHAR2
) IS
    U_USER_ID USERS.USER_ID%type;
BEGIN
    U_USER_ID := USER_SEQ.NEXTVAL;
    INSERT INTO
        USERS(USER_ID, FIRST_NAME, LAST_NAME, DEPARTMENT, BATCH, GENDER, CITY, STATE, COUNTRY, EMAIL, PASSWORD)
    VALUES
        (U_USER_ID, UPPER(U_FIRST_NAME), UPPER(U_LAST_NAME), U_DEPARTMENT, U_BATCH, U_GENDER, UPPER(U_CITY), UPPER(U_STATE),
                    UPPER(U_COUNTRY), LOWER(U_EMAIL), U_PASSWORD);

    RESULT := 'Registration is successful';

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RESULT := 'Email already exists';
    WHEN OTHERS THEN
        RESULT := 'Please enter the fields correctly';
END;


CREATE OR REPLACE PROCEDURE UPDATE_USER(
    U_USER_ID IN USERS.USER_ID%type,
    U_FIRST_NAME IN USERS.FIRST_NAME%type,
    U_LAST_NAME IN USERS.LAST_NAME%type,
    U_CITY IN USERS.CITY%type,
    U_STATE IN USERS.STATE%type,
    U_COUNTRY IN USERS.COUNTRY%type,
    U_PHONE_NO IN USERS.PHONE_NO%type,
	U_ABOUT_ME IN USERS.ABOUT_ME%type,
	U_DATE_OF_BIRTH IN USERS.DATE_OF_BIRTH%type,
	U_PROFILE_PICTURE IN USERS.PROFILE_PICTURE%type,
	U_STUDENT_ID IN USERS.STUDENT_ID%type,
	U_HALL IN USERS.HALL%type,
	U_FACEBOOK IN USERS.FACEBOOK%type,
	U_TWITTER IN USERS.TWITTER%type,
	U_LINKEDIN IN USERS.LINKEDIN%type,
	U_GOOGLE_SCHOLAR IN USERS.GOOGLE_SCHOLAR%type,
	U_RESEARCH_GATE IN USERS.RESEARCH_GATE%type,
    RESULT OUT VARCHAR2
) IS
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
                    date_of_birth = U_DATE_OF_BIRTH,
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

