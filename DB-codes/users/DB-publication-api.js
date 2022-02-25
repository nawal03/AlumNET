const Database = require('../database');
const database = new Database();


async function addPublication(publication, user_id){
    const sql = `BEGIN
                    ADD_PUBLICATION(:user_id, :title, :authors, :journal, :publication_date, :pdf_link, :result);
                END;`;
    
    const binds={
        user_id : user_id,
        title : publication.title,
        authors : publication.authors,
        journal : publication.journal,
        publication_date : publication.publication_date,
        pdf_link : publication.pdf_link,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function updatePublication(publication, publication_id){
    const sql = `BEGIN
                    UPDATE_PUBLICATION(:publication_id, :title, :authors, :journal, :publication_date, :pdf_link, :result);
                END;`;
    
    const binds={
        publication_id : publication_id,
        title : publication.title,
        authors : publication.authors,
        journal : publication.journal,
        publication_date : publication.publication_date,
        pdf_link : publication.pdf_link,
        result: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.VARCHAR2
        }
    }
    return (await database.execute(sql, binds)).outBinds;
}

async function deletePublication(publication_id){
    const sql =`DELETE FROM publications
                WHERE publication_id = :publication_id`;

    const binds={
        publication_id : publication_id
    }
    await database.execute(sql, binds);
    return binds;
}

async function getPublications(user_id){
    const sql =`SELECT * FROM publications
                WHERE user_id = :user_id`;

    const binds={
        user_id : user_id,
    }

    return (await database.execute(sql, binds)).rows;
    
}

async function getPublication(publication_id){
    const sql =`SELECT * FROM publications
                WHERE publication_id = :publication_id`;

    const binds={
        publication_id : publication_id,
    }

    result = (await database.execute(sql, binds)).rows;
    return result[0];
}

module.exports = {
    addPublication,
    updatePublication,
    deletePublication,
    getPublications,
    getPublication
}