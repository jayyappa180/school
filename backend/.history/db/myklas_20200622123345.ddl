DROP DATABASE IF EXISTS myklas_v1;
CREATE DATABASE myklas_v1;
USE myklas_v1;

CREATE TABLE branch (
  id         INT NOT NULL AUTO_INCREMENT,
  tenant_id            VARCHAR(80)             COMMENT 'OAUTH_CLIENTS.CLIENT_ID',
  name              VARCHAR(80)             COMMENT 'OAUTH_USERS.USER_ID',
  address              TIMESTAMP      NOT NULL COMMENT 'When the token becomes invalid',
  state                VARCHAR(4000)           COMMENT 'Space-delimited list of scopes token can access',
  
  PRIMARY KEY (access_token)
);
