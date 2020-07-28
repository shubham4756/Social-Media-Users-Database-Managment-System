drop table if exists posts;
CREATE TABLE posts(
   Post_ID INT NOT NULL auto_increment,
   Posted_User_ID INT NOT NULL,
   Post_Date DATE NOT NULL,
   Post_Content VARCHAR(50) NOT NULL,
   PRIMARY KEY(Post_ID)
);


ALTER TABLE posts AUTO_INCREMENT=1;
ALTER TABLE posts ADD CONSTRAINT Post_User_fk FOREIGN KEY (Posted_User_ID) references users(User_ID) on delete cascade;