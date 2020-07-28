drop table if exists page_likes;
CREATE TABLE page_likes(
  Page_ID INT NOT NULL,
  Page_User_ID INT NOT NULL,
  PRIMARY KEY(Page_ID,Page_User_ID)
);
ALTER TABLE page_likes ADD CONSTRAINT Page_ID_fk FOREIGN KEY (Page_ID) references pages(Page_ID) on delete cascade;
ALTER TABLE page_likes ADD CONSTRAINT Page_User_ID_fk FOREIGN KEY (Page_User_ID) references users(User_ID) on delete cascade;
