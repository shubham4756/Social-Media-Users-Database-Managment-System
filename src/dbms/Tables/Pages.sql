drop table if exists pages;
CREATE TABLE pages(
   Page_ID INT NOT NULL auto_increment,
   Page_Name VARCHAR(20) NOT NULL,
   Page_Content VARCHAR(50) NOT NULL,
   PRIMARY KEY(Page_ID)
);
ALTER TABLE pages AUTO_INCREMENT=1;