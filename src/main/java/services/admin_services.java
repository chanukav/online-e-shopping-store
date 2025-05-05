package services;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.Admin;
import util.DBConnect;

public class admin_services {
	
	public void regAdmin(Admin admin) {
		try {
			
			
			String query = "INSERT INTO gamudalk.admin (first_name, last_name, email, password) VALUES ('"
				    + admin.getFname() + "','"
				    + admin.getLname() + "','"
				    + admin.getEmail() + "','"
				    + admin.getPassword() + "')";

			
			
			Statement statement = DBConnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public boolean validate(Admin admin) {
		try {
			String query = "select * from gamudalk.admin where email = '"+admin.getEmail()+"' and password= '"+admin.getPassword()+"'";
			
			Statement statement = DBConnect.getConnection().createStatement();
			
			ResultSet rs = statement.executeQuery(query);
			
			if(rs.next()) {
				return true;
				
			}
			

		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Admin getOne(Admin admin) {
		try {
			String query = "select * from gamudalk.admin where email = '"+admin.getEmail()+"' and password= '"+admin.getPassword()+"'";
			
			Statement statement = DBConnect.getConnection().createStatement();
			
			ResultSet rs = statement.executeQuery(query);
			
			if(rs.next()) {
				admin.setAdminid(rs.getInt("admin_id"));
				admin.setFname(rs.getString("first_name"));
				admin.setLname(rs.getString("last_name"));
				admin.setEmail(rs.getString("email"));
				return admin;
				
			}

		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<Admin> getAllAdmins(){
		try {
			ArrayList<Admin> listAdmin = new ArrayList<Admin>();
			
			String query = "select * from gamudalk.admin";
			
			Statement  statement = DBConnect.getConnection().createStatement();
			ResultSet rs = statement.executeQuery(query);
			while(rs.next()) {
				Admin admin =new Admin();
				
				admin.setAdminid(rs.getInt("admin_id"));
				admin.setFname(rs.getString("first_name"));
				admin.setLname(rs.getString("last_name"));
				admin.setEmail(rs.getString("email"));
				admin.setPassword(rs.getString("password"));
				
				listAdmin.add(admin);
				
			}
			return listAdmin;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public Admin singleDataButton(Admin admin) {
		try {
			String query = "select * from gamudalk.admin where email = '"+admin.getEmail()+"'";
			
			Statement statement = DBConnect.getConnection().createStatement();
			
			ResultSet rs = statement.executeQuery(query);
			
			if(rs.next()) {

				admin.setAdminid(rs.getInt("admin_id"));
				admin.setFname(rs.getString("first_name"));
				admin.setLname(rs.getString("last_name"));
				admin.setEmail(rs.getString("email"));
				admin.setPassword(rs.getString("password"));
				return admin;
				
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void updateCustomer(Admin admin) {
		try {
			String query = "UPDATE customer SET first_name ='"+admin.getFname()+"', first_name ='"+admin.getLname()+"', email ='"+admin.getEmail()+"', password ='"+admin.getPassword()+"' WHERE email='"+admin.getEmail()+"'";
			
			
			Statement statement = DBConnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

}
