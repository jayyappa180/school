const connectionPool = require("../connection/db-connection");
const dateFormat = require('dateformat');
const selectQuery = "SELECT id,name,email,phone,address FROM tenant";
//const insertQuery =  "INSERT INTO tenant ( name,email,phone,address) VALUES ( ?,?,?,?)";
const storeProc = "CALL tenant_onboard(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?, @tenant_id, @status_code, @status_message);SELECT @tenant_id AS tenant_id, @status_code AS status_code, @status_message AS status_message"
class TenantDao {
  storeTenant(tenant) {
    let isodate = dateFormat(new Date(), "yyyy-mm-dd h:MM:ss");
    return new Promise((resolve, reject) => {
      connectionPool.query(
        storeProc,
        [tenant.name, tenant.email, tenant.phone, tenant.address, tenant.state, tenant.district, tenant.pincode,tenant.code, 0, 0, 0, isodate, 1, isodate, 1],
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
