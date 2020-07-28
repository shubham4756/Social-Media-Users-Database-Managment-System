select distinct(users.First_name) from comments_like natural join users where comments_like.Comment_liked_User_ID=users.User_ID and comments_like.Comment_ID=3;

CALL `social_media`.`number_of_friends`();

SELECT * from full_profile_of_users;

SELECT * from full_posts_details;

SELECT po.Post_ID,po.Post_content,po.Post_Date,pc.Comment_ID,pc.Comment_Content,pc.Commented_Date from posts as po natural join post_comments as pc order by po.Post_ID asc,pc.Comment_ID asc; 

select f1.User_ID,u1.First_name,u1.Gender,f1.Friend_ID,u2.First_name,u2.Gender from friends as f1 natural join users as u1,users as u2 where f1.Friend_ID=u2.User_ID order by f1.User_id asc,f1.friend_id asc;

select pg.Page_ID,pg.Page_name,pg.Page_Content,u.User_ID,u.First_name,u.AGE from pages as pg natural join page_likes as pl,users as u where pl.Page_User_ID=u.User_ID order by pg.Page_ID asc,u.User_ID asc;

select co.Post_ID,co.Comment_ID,co.Comment_Content,cl.Comment_liked_User_ID,u.First_name from post_comments as co natural join comments_like as cl, users as u where cl.Comment_liked_User_ID=u.User_ID order by co.Post_ID asc,co.Comment_ID,cl.Comment_liked_User_ID;

select u.User_ID,u.First_name from users as u,posts as p where u.User_ID=p.Posted_User_ID and p.Post_ID in (select pl.Post_ID from post_likes as pl order by COUNT(pl.Liked_User_ID) AS likes desc);