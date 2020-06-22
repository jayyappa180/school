const express = require("express");
const cors = require("cors");
const tenantRouter = require("./controller/tenant-controller");
const app = express();
const bodyParser = require("body-parser");
var oauthserver = require("oauth2-server");
var memorystore = require("./oauth/oauth-server");


app.use(cors({ origin: "http://localhost:1234" }));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());


app.oauth =  oauthserver({
  model: memorystore,
  grants: ["password","access_token"],
  debug: true,
  accessTokenLifetime: memorystore.JWT_ACCESS_TOKEN_EXPIRY_SECONDS, // expiry time in seconds, consistent with JWT setting in model.js
  refreshTokenLifetime: memorystore.JWT_REFRESH_TOKEN_EXPIRY_SECONDS, // expiry time in seconds, consistent with JWT setting in model.js
});

app.all("/oauth/token", app.oauth.grant());

app.get("/", app.oauth.authorise(), function (req, res) {
  res.send("Secret area");
});

app.use(app.oauth.errorHandler());

app.use("/tenant", tenantRouter);


module.exports = app;
