CREATE DEFINER=`root`@`localhost` FUNCTION `number_of_Comments`(P_ID INT) RETURNS int
BEGIN
 declare count INT default 0;
 SELECT count(*) from post_comments WHERE
post_comments.Post_ID = P_ID into count;
 RETURN count;
END