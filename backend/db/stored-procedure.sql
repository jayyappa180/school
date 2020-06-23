CREATE DEFINER=`root`@`localhost` PROCEDURE `tenant_onboard`(
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

    DECLARE v_tenant_id, v_status_code, v_branch_record_count  INT DEFAULT 0;
    DECLARE v_status_message VARCHAR(50);
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    
    START TRANSACTION;
    
    SELECT COUNT(b.name) INTO  v_branch_record_count FROM branch b WHERE b.name = name AND b.email = email AND b.phone = phone;
    
    IF v_branch_record_count = 0
    
    THEN
		INSERT INTO branch (name, email, phone, address, state, district, pincode, created_date, created_by, updated_date, updated_by) 
					VALUES (name, email, phone, address, state, district, pincode, created_date, created_by, updated_date, updated_by);
		
        SET v_tenant_id = LAST_INSERT_ID();
        
        INSERT INTO tenant (tenant_id, name, code, verified, status, subscribed, created_date, created_by, updated_date, updated_by) 
					VALUES (v_tenant_id, name, code, verified, status, subscribed, created_date, created_by, updated_date, updated_by);
        
		SET status_code = 200;
		SET status_message = 'Records created successfully.';

    ELSE
		SET status_code = 100;
		SET status_message = 'User already exists.';
        ROLLBACK;
    END IF;
    
 SET tenant_id = v_tenant_id;		
END