const connectionPool = require("../connection/dbConnection");
const selectQuery = "SELECT id,name,email,phone,address FROM tenant";
const insertQuery =
  "INSERT INTO tenant ( name,email,phone,address) VALUES (?,?,?,?)";
class TenantDao {
  storeTenant(tenant) {
    return new Promise((resolve, reject) => {
      connectionPool.query(
        insertQuery,
        [tenant.name, tenant.email, tenant.phone, tenant.address],
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
        resolve(response.rows);
      });
    });
  }
}

module.exports = TenantDao;
