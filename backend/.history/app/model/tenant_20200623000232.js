class Tenant {
  constructor(name, email, phone, address, state, district, pincode,code, verified, status, subscribed) {
    this.name =name;
    this.email=email;
    this.phone=phone;
    this.address=address;
    this.state=state;
    this.district=district;
    this.pincode=pincode;
    this.code=code;
    this.verified=verified;
    this.status=status;
    this.subscribed=subscribed;
  }
}
modules.exports = Tenant;
