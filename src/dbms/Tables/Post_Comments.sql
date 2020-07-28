drop table if exists post_comments;
CREATE TABLE post_comments(
  Comment_ID INT NOT NULL auto_increment,
  Post_ID INT NOT NULL,
  Commented_Date DATE,
  Comment_Content VARCHAR(50),
  Commented_User_ID INT NOT NULL,
  PRIMARY KEY(Comment_ID)
);
ALTER TABLE post_comments AUTO_INCREMENT=1;
ALTER TABLE post_comments ADD CONSTRAINT Commented_Post_ID_fk FOREIGN KEY (Post_ID) references posts(Post_ID) on delete cascade;
ALTER TABLE post_comments ADD CONSTRAINT Commented_User_ID_fk FOREIGN KEY (Commented_User_ID) references users(User_ID) on delete cascade;