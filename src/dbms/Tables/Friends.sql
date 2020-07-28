DROP TABLE if exists friends;
CREATE TABLE friends(
   User_ID INT NOT NULL,
   Friend_ID INT NOT NULL,
   PRIMARY KEY(User_ID,Friend_ID)
);
ALTER TABLE friends ADD CONSTRAINT User_ID_fk FOREIGN KEY (User_ID) references users(User_ID) on delete cascade on update cascade; 
ALTER TABLE friends ADD CONSTRAINT Friend_ID_fk FOREIGN KEY (Friend_ID) references users(User_ID) on delete cascade;