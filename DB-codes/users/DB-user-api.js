const Database = require('../database');
const database = new Database();


async function insertUser(user, password){
    const sql = `BEGIN
                    CREATE_USER(:first_name, :last_name, :department, :batch, :gender, 
                        :city, :state, :country , :email, :password, :result);
                END;`;
    
    const binds={
        first_name: user.first_name,
        last_name: user.last_name,
        department: user.department, 
        batch: user.batch, 
        gender: user.gender, 
        city: user.city, 
        state: user.state, 
        country: user.country, 
        email: user.email, 
        password: password,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
    
}

async function updateUser(user, user_id){
    const sql =`BEGIN
                    UPDATE_USER(:user_id, :first_name, :last_name, :city, :state, :country, :phone_no,
                        :about_me, :date_of_birth, :profile_picture, :student_id, :hall, :facebook, :twitter,
                        :linkedin, :google_scholar, :research_gate, :result
                        );
                end;`;

    const binds={
        user_id : user_id,
        first_name: user.first_name,
        last_name: user.last_name,
        city: user.city, 
        state: user.state, 
        country: user.country, 
        phone_no : user.phone_no,
        about_me : user.about_me,
        date_of_birth : user.date_of_birth,
        profile_picture : user.profile_picture,
        student_id : user.student_id,
        hall : user.hall,
        facebook : user.facebook,
        twitter : user.twitter,
        linkedin : user.linkedin,
        google_scholar : user.google_scholar,
        research_gate : user.research_gate,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function updatePassword(password, user_id){
    const sql =`UPDATE users
                SET 
                    password = :password
                WHERE user_id = :user_id`;

    const binds={
        user_id : user_id,
        password : password
    }
    await database.execute(sql, binds);
    return;
}

async function getUsers(query){
    const sql = `SELECT distinct U.user_id, U.first_name || ' ' || U.last_name name, U.profile_picture, U.department, U.batch
                    FROM users U
                    LEFT OUTER JOIN research_interests RI on U.user_id = RI.user_id
                    LEFT OUTER JOIN education E on U.user_id = E.user_id
                    LEFT OUTER JOIN work_experience WE on U.user_id = WE.user_id
                    WHERE U.first_name || ' ' || U.last_name like UPPER('%'||:name||'%')
                    AND (U.batch = :batch OR :batch is null) 
                    AND (U.department = :department OR :department is null)
                    AND NVL(U.hall, ' ') like UPPER('%'||:hall ||'%')
                    AND U.city like UPPER('%'||:city||'%')
                    AND NVL(U.state, ' ') like UPPER('%'||:state||'%')
                    AND U.country like UPPER('%'||:country||'%')
                    AND NVL(RI.research_interest, ' ') like UPPER('%'||:research_interest||'%')
                    AND NVL(E.institute,' ') like UPPER('%'||:e_institute||'%')
                    AND NVL(WE.organization, ' ') like UPPER('%'||:we_organization||'%')`;
    const binds ={
        name : query.name,
        batch : query.batch,
        department : query.department,
        hall : query.hall,
        city : query.city,
        state : query.state,
        country : query.country,
        research_interest : query.research_interest,
        e_institute : query.e_institute,
        we_organization : query.we_organization

    };
    
    return (await database.execute(sql, binds)).rows;
    
}

async function getUserById(user_id){
    const sql = `SELECT * FROM users
                WHERE user_id = :user_id`;
    const binds ={
        user_id : user_id
    };
    const result = (await database.execute(sql, binds)).rows;
    return result[0];
}

async function getUserByEmail(email){
    const sql = `SELECT * FROM users 
                WHERE email = :email`;
    const binds ={
        email : email
    };
    const result = (await database.execute(sql, binds)).rows;
    return result[0];
}

module.exports = {
    insertUser,
    updateUser,
    updatePassword,
    getUsers,
    getUserById,
    getUserByEmail
}