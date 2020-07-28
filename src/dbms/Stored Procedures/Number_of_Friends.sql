CREATE DEFINER=`root`@`localhost` PROCEDURE `number_of_friends`()
BEGIN
 SELECT User_ID,COUNT(DISTINCT Friend_ID)
 FROM Friends
 GROUP BY User_ID;
END