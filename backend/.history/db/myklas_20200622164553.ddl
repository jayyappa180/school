DROP DATABASE IF EXISTS myklas_v1;
CREATE DATABASE myklas_v1;
USE myklas_v1;


CREATE TABLE branch (
  tenant_id         INT          AUTO_INCREMENT  PRIMARY KEY,            
  name              VARCHAR(100) NOT NULL,
  email             VARCHAR(100) NOT NULL,
  phone             VARCHAR(20)  NOT NULL,      
  address           VARCHAR(500) NOT NULL, 
  state             VARCHAR(100) NOT NULL,  
  district          VARCHAR(100) NOT NULL,  
  pincode           VARCHAR(100) NOT NULL,
  created_date      DATETIME     NOT NULL,
  created_by        INT          NOT NULL,
  updated_date      DATETIME     NOT NULL,
  updated_by        INT          NOT NULL
);

CREATE TABLE tenant (
  id                INT          AUTO_INCREMENT,
  tenant_id         INT          NOT NULL,
  name              VARCHAR(100) NOT NULL,      
  code              VARCHAR(100) NOT NULL, 
  verified          TINYINT(1)   NOT NULL,  
  status            TINYINT(1)   NOT NULL,  
  subscribed        TINYINT(1)   NOT NULL,
  created_date      DATETIME     NOT NULL,
  created_by        INT          NOT NULL,
  updated_date      DATETIME     NOT NULL,
  updated_by        INT          NOT NULL,
  PRIMARY KEY (id , tenant_id),
  FOREIGN KEY (tenant_id)
  REFERENCES branch (tenant_id)
);
