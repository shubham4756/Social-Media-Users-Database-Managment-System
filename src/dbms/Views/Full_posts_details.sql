CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `social_media`.`full_posts_details` AS
    SELECT 
        `po`.`Post_ID` AS `Post_ID`,
        `po`.`Posted_User_ID` AS `Posted_User_ID`,
        (SELECT 
                `u`.`First_name`
            FROM
                `social_media`.`users` `u`
            WHERE
                (`u`.`User_ID` = `po`.`Posted_User_ID`)) AS `Posted_Users_name`,
        (SELECT 
                `u`.`AGE`
            FROM
                `social_media`.`users` `u`
            WHERE
                (`u`.`User_ID` = `po`.`Posted_User_ID`)) AS `Posted_Users_age`,
        `po`.`Post_Date` AS `Post_Date`,
        `po`.`Post_Content` AS `Post_Content`,
        (SELECT 
                COUNT(0)
            FROM
                `social_media`.`post_likes` `pl`
            WHERE
                (`pl`.`Post_ID` = `po`.`Post_ID`)) AS `numbet_of_likes`,
        (SELECT 
                COUNT(0)
            FROM
                `social_media`.`post_shares` `ps`
            WHERE
                (`ps`.`Post_ID` = `po`.`Post_ID`)) AS `numbet_of_shares`,
        (SELECT 
                COUNT(0)
            FROM
                `social_media`.`post_comments` `pc`
            WHERE
                (`pc`.`Post_ID` = `po`.`Post_ID`)) AS `numbet_of_comments`
    FROM
        `social_media`.`posts` `po`