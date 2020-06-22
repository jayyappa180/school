const { Router } = require("express");
const TenantDao = require("../dao/tenant-dao");
const jwt = require("jsonwebtoken");
const router = new Router();
const tenantDao = new TenantDao();

router.get("/list", verifyToken, (req, res) => {
  tenantDao
    .fetchTenant()
    .then((response) => {
      res.json({ response });
    })
    .catch((error) => console.error(error));
});

router.post("/save", (req, res) => {
  tenantDao
    .storeTenant(req.body)
    .then((response) => {
      res.json(response);
    })
    .catch((error) => console.error(error));
});

function verifyToken(req, res, next) {
  // Get auth header value
  const bearerHeader = req.headers["authorization"];
  // Check if bearer is undefined
  if (typeof bearerHeader !== "undefined") {
    // Split at the space
    const bearer = bearerHeader.split(" ");
    // Get token from array
    const bearerToken = bearer[1];
    // Set the token
    req.token = bearerToken;
    // Next middleware
    jwt.verify(req.token, "XT6PRpRuehFsyMa2", (err, authData) => {
      if (err) {
        console.error(err);
        res.sendStatus(403);
      } else {
        console.log(authData);
        next();
      }
    });
  } else {
    // Forbidden
    res.sendStatus(403);
  }
}

module.exports = router;
