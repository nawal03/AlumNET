const Database = require('../database');
const database = new Database();

async function follow(follower, following){
    const sql =`INSERT INTO follows(follower, following) 
                VALUES (:follower, :following)`;

    const binds={
        follower : follower,
        following : following
    }

    await database.execute(sql, binds);
    return binds;
}

async function unfollow(follower, following){
    const sql =`DELETE FROM follows
                WHERE follower = :follower AND following = :following`;

    const binds={
        follower : follower,
        following : following
    }

    await database.execute(sql, binds);
    return binds;
}

async function getFollowing(follower){
    const sql =`SELECT user_id, first_name || ' ' || last_name name, profile_picture
                FROM users U 
                JOIN follows F ON (U.user_id = F.following)
                WHERE F.follower = :follower`;

    const binds={
        follower : follower,
    }

    return (await database.execute(sql, binds)).rows;
}

async function getFollowingCount(follower){
    const sql =`SELECT count(*) following_count
                FROM users U 
                JOIN follows F ON (U.user_id = F.following)
                WHERE F.follower = :follower`;

    const binds={
        follower : follower,
    }

    result = (await database.execute(sql, binds)).rows;
    return result[0];
}

async function getFollower(following){
    const sql =`SELECT user_id, first_name || ' ' || last_name name, profile_picture
                FROM users U 
                JOIN follows F ON (U.user_id = F.follower)
                WHERE F.following = :following`;

    const binds={
        following : following,
    }

    return (await database.execute(sql, binds)).rows;
}

async function getFollowerCount(following){
    const sql =`SELECT count(*) follower_count
                FROM users U 
                JOIN follows F ON (U.user_id = F.follower)
                WHERE F.following = :following`;

    const binds={
    following : following,
    }

    result = (await database.execute(sql, binds)).rows;
    return result[0];
}

async function getIsFollowing(follower, following){
    const sql =`SELECT COUNT(*) COUNT FROM FOLLOWS
                WHERE FOLLOWER = :follower AND FOLLOWING = :following`;

    const binds={
        following : following,
        follower : follower
    }

    result = (await database.execute(sql, binds)).rows;
    return result[0];
}

module.exports = {
    follow,
    unfollow,
    getFollowing,
    getFollowingCount,
    getFollower,
    getFollowerCount,
    getIsFollowing
}