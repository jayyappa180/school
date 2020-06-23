class Tenant {
  constructor(name, email, phone, address, state, district, pincode,code, verified, status, subscribed) {
    this.name =name;
    this.email;
    this.phone;
    this.address;
    this.state;
    this.district;
    this.pincode;
    this.code;
    this.verified=verified;
    this.status=status;
    this.subscribed=subscribed;
  }
}
modules.exports = Tenant;
