CREATE PROCEDURE proc_short_pipe(IN p_wt_amt DECIMAL(4,3), OUT p_pipe_name VARCHAR(25), OUT p_pipe_length DECIMAL(4,2))
BEGIN
	DECLARE v_p_name VARCHAR(25);
	DECLARE v_length DECIMAL(4,2);
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