drop table if exists post_shares;
CREATE TABLE post_shares(
  Post_ID INT NOT NULL,
  Shared_User_ID INT NOT NULL,
  PRIMARY KEY(Post_ID,Shared_User_ID)
);
ALTER TABLE post_shares ADD CONSTRAINT Shared_Post_ID_fk FOREIGN KEY (Post_ID) references posts(Post_ID) on delete cascade;
ALTER TABLE post_shares ADD CONSTRAINT Shared_User_ID_fk FOREIGN KEY (Shared_User_ID) references users(User_ID) on delete cascade; 