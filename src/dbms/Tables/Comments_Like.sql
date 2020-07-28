drop table if exists comments_like;
CREATE TABLE comments_like(
  Comment_ID INT NOT NULL,
  Comment_liked_User_ID INT NOT NULL,
  PRIMARY KEY (Comment_ID,Comment_liked_User_ID)
);
ALTER TABLE comments_like ADD CONSTRAINT Comment_ID_fk FOREIGN KEY (Comment_ID) references post_comments(Comment_ID) on delete cascade;
ALTER TABLE comments_like ADD CONSTRAINT Comment_liked_user_ID_fk FOREIGN KEY (Comment_liked_User_ID) references users(User_ID) on delete cascade;
