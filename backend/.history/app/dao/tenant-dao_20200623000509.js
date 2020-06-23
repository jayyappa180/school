const connectionPool = require("../connection/db-connection");
const selectQuery = "SELECT id,name,email,phone,address FROM tenant";
//const insertQuery =  "INSERT INTO tenant ( name,email,phone,address) VALUES ( ?,?,?,?)";
const storeProc = "CALL tenant_onboard(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?, @tenant_id, @status_code, @status_message);SELECT @tenant_id AS tenant_id, @status_code AS status_code, @status_message AS status_message"
class TenantDao {
  storeTenant(tenant) {
    return new Promise((resolve, reject) => {
      connectionPool.query(
        storeProc,
        [tenant.name, tenant.email, tenant.phone, tenant.address, tenant.state, tenant.district, tenant.pincode,tenant.code, verified, status, subscribed, '2020-06-21 01:02:03', 1, '2020-06-21 01:02:03', 1],
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
