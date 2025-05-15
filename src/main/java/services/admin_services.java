package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.Admin;
import util.DBConnect;

	public class admin_services {
		
		public void regAdmin(Admin admin) {
		    String query = "INSERT INTO gamudalk.admin (first_name, last_name, email, password, image) VALUES (?, ?, ?, ?, ?)";
	
		    try (Connection conn = DBConnect.getConnection();
		         PreparedStatement stmt = conn.prepareStatement(query)) {
	
		        stmt.setString(1, admin.getFname());
		        stmt.setString(2, admin.getLname());
		        stmt.setString(3, admin.getEmail());
		        stmt.setString(4, admin.getPassword());
		        stmt.setBytes(5, admin.getImage()); // image is a byte[]
	
		        stmt.executeUpdate();
	
		    } catch (Exception e) {
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
	    String query = "SELECT * FROM gamudalk.admin WHERE email = ? AND password = ?";

	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(query)) {

	        stmt.setString(1, admin.getEmail());
	        stmt.setString(2, admin.getPassword());

	        ResultSet rs = stmt.executeQuery();

	        if (rs.next()) {
	            admin.setAdminid(rs.getInt("admin_id"));
	            admin.setFname(rs.getString("first_name"));
	            admin.setLname(rs.getString("last_name"));
	            admin.setEmail(rs.getString("email"));
	            admin.setImage(rs.getBytes("image")); // Optional: if you're storing the image
	            return admin;
	        }

	    } catch (Exception e) {
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
				admin.setImage(rs.getBytes("image")); // Add this line
				
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
				admin.setImage(rs.getBytes("image")); // Added image support
				
				return admin;
				
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void updateAdmin(Admin admin, boolean isImageUpdated) {
	    try {
	        String query;
	        PreparedStatement statement;

	        if (isImageUpdated && admin.getImage() != null) {
	            // Update including the image
	            query = "UPDATE gamudalk.admin SET first_name = ?, last_name = ?, email = ?, password = ?, image = ? WHERE admin_id = ?";
	            statement = DBConnect.getConnection().prepareStatement(query);
	            statement.setString(1, admin.getFname());
	            statement.setString(2, admin.getLname());
	            statement.setString(3, admin.getEmail());
	            statement.setString(4, admin.getPassword());
	            statement.setBytes(5, admin.getImage());
	            statement.setInt(6, admin.getAdminid());
	        } else {
	            // Update without modifying image
	            query = "UPDATE gamudalk.admin SET first_name = ?, last_name = ?, email = ?, password = ? WHERE admin_id = ?";
	            statement = DBConnect.getConnection().prepareStatement(query);
	            statement.setString(1, admin.getFname());
	            statement.setString(2, admin.getLname());
	            statement.setString(3, admin.getEmail());
	            statement.setString(4, admin.getPassword());
	            statement.setInt(5, admin.getAdminid());
	        }

	        statement.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	
	
	public void deleteCustomer(Admin admin) {
		try {
			String query = "DELETE FROM gamudalk.admin WHERE email ='"+admin.getEmail()+"'";
			
			Statement statement = DBConnect.getConnection().createStatement();	
			statement.executeUpdate(query);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	

}
