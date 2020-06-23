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
    BEGIN
    DECLARE v_tenant_id,v_status_code,record_count  INT DEFAULT 0;
    DECLARE v_status_message VARCHAR(50);
    END
    --SET record_count = SELECT COUNT (NAME) FROM branch b WHERE b.name = name AND b.email = email AND b.phone = phone;

    INSERT INTO branch ( 
            name, 
            email, 
            phone,
            address,
            state,
            district,
            pincode,
            created_date,
            created_by,
            updated_date,
            updated_by) 
        VALUES (
            name, 
            email, 
            phone,
            address,
            state,
            district,
            pincode,
            created_date,
            created_by,
            updated_date,
            updated_by
        );
-- SET tenant_id = 0;
-- SET status_code = 0;
-- SET status_message = 'SS';
		
END$$
DELIMITER ;