const mysql = require("mysql");
const dbConfig = require("../../secrets/dbConfig");

const connectionPool = mysql.createPool(dbConfig);

module.exports = connectionPool;
