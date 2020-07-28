insert into users (Email_ID,Phone_No,Pass_word,First_name,Last_name,City,PinCode,DOB,Gender) values ('dfsk@gmail.com','7895546456','afas','shubham','sddflk','skhd',487645,DATE '2001-04-19','M');
insert into users (Email_ID,Phone_No,Pass_word,First_name,Last_name,City,PinCode,DOB,Gender) values ('sfgdfg@gmail.com','9795546456','fkdj','bhavik','greg','gtetg',789645,DATE '2000-10-17','M');
insert into users (Email_ID,Phone_No,Pass_word,First_name,Last_name,City,PinCode,DOB,Gender) values ('rtwrt@gmail.com','9725546456','sfgks','keyur','retgr','qwerq',456645,DATE '2004-05-22','M');
insert into users (Email_ID,Phone_No,Pass_word,First_name,Last_name,City,PinCode,DOB,Gender) values ('hkfhf@gmail.com','9745546456','rwee','sager','lrrwg','thefw',16645,DATE '2000-02-02','M');
insert into users (Email_ID,Phone_No,Pass_word,First_name,Last_name,City,PinCode,DOB,Gender) values ('rqwerw@gmail.com','9785546456','yjgdhf','monik','lkdfh','hrynb',798645,DATE '2005-12-15','M');
select * from users;


insert into friends values(1,2);
insert into friends values(1,3);
insert into friends values(1,4);
insert into friends values(2,3);
insert into friends values(5,3);
insert into friends values(4,3);
insert into friends values(1,5);
select * from friends;


insert into pages(Page_Name,Page_Content) values("first name","first content");
insert into pages(Page_Name,Page_Content) values("second name","second content");
insert into pages(Page_Name,Page_Content) values("third name","third content");
insert into pages(Page_Name,Page_Content) values("fourth name","fourth content");
insert into pages(Page_Name,Page_Content) values("fifth name","fifth content");
insert into pages(Page_Name,Page_Content) values("sixth name","sixth content");
insert into pages(Page_Name,Page_Content) values("seventh name","seventh content");
select * from pages;


insert into page_likes values(1,1);
insert into page_likes values(3,1);
insert into page_likes values(4,2);
insert into page_likes values(5,4);
insert into page_likes values(7,2);
insert into page_likes values(3,3);
insert into page_likes values(2,1);
insert into page_likes values(1,5);
select * from page_likes;


insert into posts(Posted_User_ID,Post_Date,Post_Content) values(2,DATE '2020-09-19','first image');
insert into posts(Posted_User_ID,Post_Date,Post_Content) values(3,DATE '2019-08-20','second image');
insert into posts(Posted_User_ID,Post_Date,Post_Content) values(4,DATE '2018-07-21','fourth image');
insert into posts(Posted_User_ID,Post_Date,Post_Content) values(5,DATE '2017-06-22','fifth image');
insert into posts(Posted_User_ID,Post_Date,Post_Content) values(1,DATE '2016-05-23','sixth image');
insert into posts(Posted_User_ID,Post_Date,Post_Content) values(2,DATE '2015-04-24','seventh image');
insert into posts(Posted_User_ID,Post_Date,Post_Content) values(3,DATE '2014-03-25','eighth image');
insert into posts(Posted_User_ID,Post_Date,Post_Content) values(4,DATE '2013-02-26','nineth image');
select * from posts;


insert into post_likes values(1,2);
insert into post_likes values(2,5);
insert into post_likes values(3,1);
insert into post_likes values(4,3);
insert into post_likes values(5,4);
insert into post_likes values(3,4);
insert into post_likes values(2,4);
insert into post_likes values(1,4);
select * from post_likes;


insert into post_shares values(1,2);
insert into post_shares values(4,5);
insert into post_shares values(3,3);
insert into post_shares values(2,4);
insert into post_shares values(5,3);
insert into post_shares values(5,2);
insert into post_shares values(6,1);
insert into post_shares values(6,3);
select * from post_shares;


insert into post_comments(Post_id,Commented_Date,Comment_Content,Commented_User_ID) values(4,DATE '2020-05-14','hiiii .. ',3); 
insert into post_comments(Post_id,Commented_Date,Comment_Content,Commented_User_ID) values(3,DATE '2019-03-23','hooo .. ',4); 
insert into post_comments(Post_id,Commented_Date,Comment_Content,Commented_User_ID) values(2,DATE '2018-04-22','okkkk .. ',5); 
insert into post_comments(Post_id,Commented_Date,Comment_Content,Commented_User_ID) values(4,DATE '2017-05-11','nooop .. ',2);
insert into post_comments(Post_id,Commented_Date,Comment_Content,Commented_User_ID) values(5,DATE '2014-06-15','nice .. ',3);
insert into post_comments(Post_id,Commented_Date,Comment_Content,Commented_User_ID) values(3,DATE '2013-07-21','good .. ',1);
insert into post_comments(Post_id,Commented_Date,Comment_Content,Commented_User_ID) values(2,DATE '2012-08-17','very good..',1);
insert into post_comments(Post_id,Commented_Date,Comment_Content,Commented_User_ID) values(3,DATE '2011-09-01','super .. ',4);
select * from post_comments;


insert into comments_like values(2,1);
insert into comments_like values(4,2);
insert into comments_like values(3,3);
insert into comments_like values(6,4);
insert into comments_like values(2,5);
insert into comments_like values(3,4);
insert into comments_like values(4,3);
insert into comments_like values(5,2);
insert into comments_like values(6,1);
select * from comments_like;

