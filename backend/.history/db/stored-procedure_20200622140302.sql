CREATE PROCEDURE tenant.tenant_onboard(
  IN  name              VARCHAR(100) ,      
  IN address            VARCHAR(500) , 
  IN state              VARCHAR(100) ,  
  IN district           VARCHAR(100) ,  
  IN pincode            VARCHAR(100) ,
  IN code               VARCHAR(100) , 
  IN verified           TINYINT(1)   ,  
  IN status             TINYINT(1)   ,  
  IN subscribed         TINYINT(1)   ,
  IN created_date       DATETIME     ,
  IN created_by         INT          ,
  IN updated_date       DATETIME     ,
  IN updated_by         INT          ,
  OUT tenant_id INT)
BEGIN
	DECLARE v_tenant_id INT;
		SELECT p.pipe_name, p.pipe_length
		INTO v_p_name, v_length
		FROM pipe AS p
	    INNER JOIN pw_wall_thickness AS pw
		ON p.pipe_id = pw.pw_pipe_id
	    INNER JOIN wall_thickness AS wt
	    ON pw.pw_thickness_id = wt.w_thickness_id
	    WHERE wt.wall_thickness_amount = p_wt_amt
	    ORDER BY p.pipe_length ASC
		LIMIT 1;
	SELECT CONCAT(v_p_name, ' has the shortest length of ', v_length);
END $$
DELIMITER ;