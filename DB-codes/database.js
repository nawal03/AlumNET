require('dotenv').config();

oracledb = require('oracledb');
oracledb.autoCommit = true;
oracledb.outFormat = oracledb.OBJECT;
oracledb.fetchAsString = [oracledb.CLOB];

class Database{
    constructor() {
        this.connection = undefined;
    }
    // code to execute sql
    execute=async function(sql, binds){
        let results;
        try {
            if(this.connection === undefined){
                this.connection = await oracledb.getConnection({
                    user: process.env.DB_USER,
                    password: process.env.DB_PASSWORD,
                    connectionString: process.env.DB_CONNECTSTRING
                });
            }
            results = await this.connection.execute(sql, binds);
            
        } catch (err) {
            console.log("ERROR executing sql: " + err.message);
            console.log(sql);
            console.log(binds);
        }

        return results;
    }

}
module.exports = Database;