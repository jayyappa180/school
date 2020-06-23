USE myklas_v1;

DROP PROCEDURE IF EXISTS tenant_onboard;

CREATE PROCEDURE tenant_onboard(
  IN  name               VARCHAR(100) ,  
  IN  email              VARCHAR(100) ,
  IN  phone              VARCHAR(20) ,
  IN  address            VARCHAR(500) , 
  IN  state              VARCHAR(100) ,  
  IN  district           VARCHAR(100) ,  
  IN  pincode            VARCHAR(100) ,
  IN  code               VARCHAR(100) , 
  IN  verified           TINYINT(1)   ,  
  IN  status             TINYINT(1)   ,  
  IN  subscribed         TINYINT(1)   ,
  IN  created_date       DATETIME     ,
  IN  created_by         INT          ,
  IN  updated_date       DATETIME     ,
  IN  updated_by         INT          ,
  OUT tenant_id          INT          ,
  OUT status_code        INT          ,
  OUT status_message     VARCHAR(50))
BEGIN

    DECLARE v_tenant_id,v_status_code,record_count  INT DEFAULT 0;
    DECLARE v_status_message VARCHAR(50);
  
		
END
DELIMITER ;