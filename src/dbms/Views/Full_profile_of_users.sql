CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `social_media`.`full_profile_of_users` AS
    SELECT 
        `u`.`User_ID` AS `User_ID`,
        `u`.`Email_ID` AS `Email_ID`,
        `u`.`First_name` AS `First_name`,
        `u`.`DOB` AS `DOB`,
        (SELECT 
                COUNT(0)
            FROM
                `social_media`.`friends` `fr`
            WHERE
                (`fr`.`User_ID` = `u`.`User_ID`)) AS `number_of_friends`,
        (SELECT 
                COUNT(0)
            FROM
                `social_media`.`page_likes` `pg`
            WHERE
                (`pg`.`Page_User_ID` = `u`.`User_ID`)) AS `number_of_pages`,
        (SELECT 
                COUNT(0)
            FROM
                `social_media`.`posts` `po`
            WHERE
                (`po`.`Posted_User_ID` = `u`.`User_ID`)) AS `number_of_posts`
    FROM
        `social_media`.`users` `u`