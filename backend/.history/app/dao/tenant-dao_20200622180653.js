const connectionPool = require("../connection/db-connection");
const selectQuery = "SELECT id,name,email,phone,address FROM tenant";
//const insertQuery =  "INSERT INTO tenant ( name,email,phone,address) VALUES ( ?,?,?,?)";
const storeProc = "CALL tenant_onboard(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
class TenantDao {
  storeTenant(tenant) {
    return new Promise((resolve, reject) => {
      connectionPool.query(
        insertQuery,
        [('sp3', 'r3@gmail.com', '123456783', '123 main', 'ar', 'benton', '72713', 'Y123', '1', 1, 1, '2020-06-21 01:02:03', 1, '2020-06-21 01:02:03', 1)],
        (error, response) => {
          if (error) return reject(error);
          resolve(response);
        }
      );
    });
  }
  fetchTenant() {
    return new Promise((resolve, reject) => {
      connectionPool.query(selectQuery, (error, response) => {
        if (error) return reject(error);
        resolve(response);
      });
    });
  }
}

module.exports = TenantDao;
