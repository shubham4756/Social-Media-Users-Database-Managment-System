/**
 * 
 */
package dbms;
import java.sql.*;
import java.io.IOException;
import java.math.BigInteger;
import java.util.Scanner;
/**
 * @author Shubham
 *
 */


public class Social_media {

	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
		Scanner inpu=new Scanner(System.in);
		String url="jdbc:mysql://localhost:3306/social_media";
		String uName="DatabaseUserName";
		String pass="YourPassword";
		String query="select * from users";
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,uName,pass);
		Statement st=con.createStatement();
		ResultSet rs;
		PreparedStatement std=con.prepareStatement(query);;
		
		String options="enter 0 for finish process \n"
		+"enter 1 for see users table \n" 
		+ "enter 2 for see pages table \n" 
		+ "enter 3 for insert data in users table \n"
		+"enter 4 for delete data from users table \n"
		+"enter 5 for update users password \n"
		+"enter 6 for show all users number of friends ---using PL/SQL PROCEDURES & CURSOR\n"
		+"enter 7 for show number of comments on any post ----using SQL FUNCTIONS \n"
		+"enter 8 for see all users profiles,number of friends,connected pages,posts --using CRATE VIEW \n"
		+"enter 9 for see all posts details,posted user name,post likes,post shares,post comments ---using CRATE VIEW\n"
		+"enter 10 for see all comments using only post_id ---using natural join\n"
		+"enter 11 for see list of friends name and User id and gender\n"
		+"enter 12 for find all pages all members details ----using natural join \n"
		+"enter 13 for delete any comment and see comment likes also delete\n"
		+"enter 14 for see user who liked any post comments ---using joins\n";
		boolean flag=true;
		int opt=0,cnt=0,id;
		while(flag) {
			System.out.println(options);
			opt=inpu.nextInt();
			switch(opt) {
			case 0:
				flag=false;
				break;
			case 1:
				try {
				query="select * from users";
				rs=st.executeQuery(query);
				System.out.println("USER_ID | EMAIL_ID  | PHONE_NO  |  PASSWORD | FIRST_NAME | LAST_NAME | CITY | PINCODE |  DOB  | GENDER | AGE");
				while(rs.next()) {
				String userdata=rs.getInt(1)+" | "+rs.getString(2)+" | "+rs.getString(3)+" | "+rs.getString(4)+" | "+rs.getString(5)+" | "+rs.getString(6)+" | "+rs.getString(7)+" | "+rs.getInt(8)+" | "+rs.getString(9)+" | "+rs.getString(10)+" | "+rs.getInt(11);
				System.out.println(userdata);
				}
				}
				catch(Exception e) {
					System.out.println(e);
				}
				break;
			case 2:
				try {
				query="select * from pages";
				rs=st.executeQuery(query);
				System.out.println("PAGE_ID | PAGE_NAME | PAGE_CONTENT");
				while(rs.next()) {
				String userdata=rs.getInt(1)+" | "+rs.getString(2)+" | "+rs.getString(3);
				System.out.println(userdata);
				}
				}
				catch(Exception e) {
					System.out.println(e);
				}
				break;
			case 3:
				try {
				query="insert into users(Email_ID,Phone_No,Pass_word,First_name,Last_name,City,PinCode,DOB,Gender) values (?,?,?,?,?,?,?,DATE ?,?)";
				std=con.prepareStatement(query);
				String Emailid,phoneno,Password,firstname,lastname,city,dob,gender;
				int pincode;
				System.out.println("enter user email id ");    Emailid=inpu.next();  ((PreparedStatement) std).setString(1,Emailid);
				System.out.println("enter user 10 digit phone no ");    phoneno=inpu.next();   ((PreparedStatement) std).setString(2,phoneno);
				System.out.println("enter user password ");    Password=inpu.next();    ((PreparedStatement) std).setString(3,Password);
				System.out.println("enter user first name ");    firstname=inpu.next();   ((PreparedStatement) std).setString(4,firstname);
				System.out.println("enter user last name ");    lastname=inpu.next();   ((PreparedStatement) std).setString(5,lastname);
				System.out.println("enter user city ");    city=inpu.next();    ((PreparedStatement) std).setString(6,city);
				System.out.println("enter user pincode ");    pincode=inpu.nextInt();  ((PreparedStatement) std).setInt(7,pincode);
				System.out.println("enter user date of birth in yyyy-mm-dd format ");    dob=inpu.next();  ((PreparedStatement) std).setString(8,dob);
				System.out.println("enter user gender 'M' or 'F' ");    gender=inpu.next(); ((PreparedStatement) std).setString(9,gender);
				cnt= (int) ((PreparedStatement) std).executeUpdate();
				System.out.print(cnt+" row/s affected !!! \n");
				}
				catch(Exception e) {
					System.out.println(e);
				}
				break;
			case 4:
				try {
				query ="delete from users where User_ID = ?";
				std=con.prepareStatement(query);
				System.out.println("Enter user id which you want to delete");
			    id=inpu.nextInt();
				std.setInt(1, id);
				cnt= std.executeUpdate();
				System.out.print(cnt+" row/s affected !!! \n");
				}
				catch(Exception e) {
					System.out.println(e);
				}
				break;
				
			case 5:
				try {
				query ="update users set Pass_word= ? where User_ID = ?";
				std=con.prepareStatement(query);
				System.out.println("Enter user id who want to change password");
				id=inpu.nextInt();
				System.out.println("Enter new password ");
				String p=inpu.next();
				std.setString(1, p);
				std.setInt(2, id);
				cnt= std.executeUpdate();
				System.out.print(cnt+" row/s affected !!! \n");
				}
				catch(Exception e) {
					System.out.println(e);
				}
				break;
			case 6:
				try {
					query="CALL `social_media`.`number_of_friends`()";
					rs=st.executeQuery(query);
					System.out.println("USER_ID | COUNT_OF_FRIENDS");
					while(rs.next()) {
					String userdata=rs.getInt(1)+"  |  "+rs.getInt(2);
					System.out.println(userdata);
					}
				}
				catch(Exception e) {
					System.out.println(e);
				}
				break;
			case 7:
				try {
				     System.out.println("enter a post_id for which you want to see number of comments");
				     String p=inpu.next();
					query="SELECT number_of_Comments("+p+")";
					rs=st.executeQuery(query);
					while(rs.next()) {
						System.out.println("number of comments on post_id "+p+" are "+rs.getInt(1));
					}
				}catch(Exception e) {
					System.out.println(e);
				}
				break;
				
			case 8:
				try {
					query="SELECT * from full_profile_of_users";
					rs=st.executeQuery(query);
					System.out.println("User_ID | Email_ID | First_name | DOB | number_of_friends | number_of_pages | number_of_posts");
					while(rs.next()) {
					String userdata=rs.getInt(1)+" | "+rs.getString(2)+" | "+rs.getString(3)+" | "+rs.getString(4)+" | "+rs.getInt(5)+" | "+rs.getInt(6)+" | "+rs.getInt(7);
					System.out.println(userdata);
					}
				}
				catch(Exception e) {
					System.out.println(e);
				}
				break;
				
			case 9:
				try {
					query="SELECT * from full_posts_details";
					rs=st.executeQuery(query);
					System.out.println("POST_ID | USER_ID | USER_NAME | USER_AGE | POSTED_DATE | POST_CONTENT | POST_LIKES | POST_SHARES | POST_COMMENTS ");
					while(rs.next()) {
					String userdata=rs.getInt(1)+" | "+rs.getInt(2)+" | "+rs.getString(3)+" | "+rs.getInt(4)+" | "+rs.getString(5)+" | "+rs.getString(6)+" | "+rs.getInt(7)+" | "+rs.getInt(8)+" | "+rs.getInt(9);
					System.out.println(userdata);
					}
				}
				catch(Exception e) {
					System.out.println(e);
				}
				break;
			case 10:
				try {
					query="SELECT po.Post_ID,po.Post_content,po.Post_Date,pc.Comment_ID,pc.Comment_Content,pc.Commented_Date from posts as po natural join post_comments as pc order by po.Post_ID asc,pc.Comment_ID asc";
					rs=st.executeQuery(query);
					System.out.println("POST_ID | POST_CONTENT | POSTED_DATE | COMMENT_ID | COMMENT_CONTENT | COMMENT_DATE");
					while(rs.next()) {
						String userdata=rs.getInt(1)+" | "+rs.getString(2)+" | "+rs.getString(3)+" | "+rs.getInt(4)+" | "+rs.getString(5)+" | "+rs.getString(6);
						System.out.println(userdata);
					}
					
				}
				catch(Exception e) {
					System.out.println();
				}
				break;
			case 11:
				try {
					query="select f1.User_ID,u1.First_name,u1.Gender,f1.Friend_ID,u2.First_name,u2.Gender from friends as f1 natural join users as u1,users as u2 where f1.Friend_ID=u2.User_ID order by f1.User_id asc,f1.friend_id asc";
					rs=st.executeQuery(query);
					System.out.println("USER_ID | FIRST_NAME | GENDER | FRIEND_ID | FRIEND_NAME | FRIEND_GENDER");
					while(rs.next()) {
						String userdata=rs.getInt(1)+" | "+rs.getString(2)+" | "+rs.getString(3)+" | "+rs.getInt(4)+" | "+rs.getString(5)+" | "+rs.getString(6);
						System.out.println(userdata);
					}
				}
				catch(Exception e) {
					System.out.println();
				}
				break;
			case 12:
				try {
					query="select pg.Page_ID,pg.Page_name,pg.Page_Content,u.User_ID,u.First_name,u.AGE from pages as pg natural join page_likes as pl,users as u where pl.Page_User_ID=u.User_ID order by pg.Page_ID asc,u.User_ID asc";
					rs=st.executeQuery(query);
					System.out.println("PAGE_ID | PAGE_NAME | PAGE_CONTENT | USER_ID | FIRST_NAME | AGE");
					while(rs.next()) {
						String userdata=rs.getInt(1)+" | "+rs.getString(2)+" | "+rs.getString(3)+" | "+rs.getInt(4)+" | "+rs.getString(5)+" | "+rs.getInt(6);
						System.out.println(userdata);
					}
				}
				catch(Exception e) {
					System.out.println();
				}
				break;
			case 13:
				try {
					query ="delete from post_comments where Comment_ID = ?";
					std=con.prepareStatement(query);
					System.out.println("Enter comment id which you want to delete");
				    id=inpu.nextInt();
					std.setInt(1, id);
					cnt= std.executeUpdate();
					System.out.print(cnt+" row/s affected !!! \n");
					try {
						query="select * from comments_like order by comment_ID";
						rs=st.executeQuery(query);
						System.out.println("COMMENT_ID | COMMENT_LIKED_USER_ID");
						while(rs.next()) {
							String userdata=rs.getInt(1)+" | "+rs.getString(2);
							System.out.println(userdata);
						}
					}
					catch(Exception e) {
						System.out.println();
					}
					}
					catch(Exception e) {
						System.out.println(e);
					}
				break;
			case 14:
				try {
					query="select co.Post_ID,co.Comment_ID,co.Comment_Content,cl.Comment_liked_User_ID,u.First_name from post_comments as co natural join comments_like as cl, users as u where cl.Comment_liked_User_ID=u.User_ID order by co.Post_ID asc,co.Comment_ID,cl.Comment_liked_User_ID;";
					rs=st.executeQuery(query);
					System.out.println("POST_ID | COMMENT_ID | COMMENT_CONTENT | COMMENT_LIKED_USER_ID | FIRST_NAME");
					while(rs.next()) {
						String userdata=rs.getInt(1)+" | "+rs.getInt(2)+" | "+rs.getString(3)+" | "+rs.getInt(4)+" | "+rs.getString(5);
						System.out.println(userdata);
					}
				}
				catch(Exception e) {
					System.out.println();
				}
				break;
			case 15:
				try {
					query="select co.Post_ID,co.Comment_ID,co.Comment_Content,cl.Comment_liked_User_ID,u.First_name from post_comments as co natural join comments_like as cl, users as u where cl.Comment_liked_User_ID=u.User_ID order by co.Post_ID asc,co.Comment_ID,cl.Comment_liked_User_ID;";
					rs=st.executeQuery(query);
					System.out.println("POST_ID | COMMENT_ID | COMMENT_CONTENT | COMMENT_LIKED_USER_ID | FIRST_NAME");
					while(rs.next()) {
						String userdata=rs.getInt(1)+" | "+rs.getInt(2)+" | "+rs.getString(3)+" | "+rs.getInt(4)+" | "+rs.getString(5);
						System.out.println(userdata);
					}
				}
				catch(Exception e) {
					System.out.println();
				}
				break;
				
			}
			
			System.out.println("\n******************** \n");
		}
		
		
		
		st.close();
		con.close();
	}
	
}