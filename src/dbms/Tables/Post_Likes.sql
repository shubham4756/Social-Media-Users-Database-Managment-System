drop table if exists post_likes;
CREATE TABLE post_likes(
  Post_ID INT NOT NULL,
  Liked_User_ID INT NOT NULL,
  PRIMARY KEY(Post_ID,Liked_User_ID)
);
ALTER TABLE post_likes ADD CONSTRAINT Liked_Post_ID_fk FOREIGN KEY (Post_ID) references posts(Post_ID) on delete cascade;
ALTER TABLE post_likes ADD CONSTRAINT Liked_User_ID_fk FOREIGN KEY (Liked_User_ID) references users(User_ID) on delete cascade; 