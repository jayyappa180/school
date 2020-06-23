DROP DATABASE IF EXISTS myklas_v1;
CREATE DATABASE myklas_v1;
USE myklas_v1;

CREATE TABLE branch (
  id                INT          NOT NULL AUTO_INCREMENT,
  tenant_id         INT          NOT NULL,            
  name              VARCHAR(100) NOT NULL,      
  address           VARCHAR(500) NOT NULL, 
  state             VARCHAR(100) NOT NULL,  
  district          VARCHAR(100) NOT NULL,  
  poincode          VARCHAR(100) NOT NULL,
  created_date      TIMESTAMP    NOT NULL,
  created_by        INT          NOT NULL,
  updated_date      TIMESTAMP    NOT NULL ,
  updated_by        INT          NOT NULL
  PRIMARY KEY (tenant_id)
);
