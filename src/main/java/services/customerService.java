package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import util.DBConnect;
import model.customer;

public class customerService {
	
	public void regCustomer(customer cus) {
		
		try {
			
			String query="insert into gamudalk.customer values('"+cus.getEmail()+"','"+cus.getName()+"','"+cus.getAge()+"','"+cus.getGender()+"','"+cus.getAddress()+"','"+cus.getPassword()+"')";
			Statement statement = DBConnect.getConnection().createStatement();
			
			statement.executeUpdate(query);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	
	
	public boolean validate(customer cus) {
		try {
			String query="select * from gamudalk.customer where email='"+cus.getEmail()+"'and password='"+cus.getPassword()+"'"; 
			Statement statement= DBConnect.getConnection().createStatement();
			
			ResultSet  rs=statement.executeQuery(query);
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
	}
	
	public customer getone(customer cus) {
	    try {
	        String query = "select * from gamudalk.customer where email='" + cus.getEmail() + "'";
	        System.out.println("Running query: " + query);
	        Statement statement = DBConnect.getConnection().createStatement();

	        ResultSet rs = statement.executeQuery(query);
	        if (rs.next()) {
	            System.out.println("Customer found!");

	            cus.setName(rs.getString("name"));
	            cus.setAge(rs.getString("age"));
	            cus.setGender(rs.getString("gender"));
	            cus.setAddress(rs.getString("address"));
	            cus.setEmail(rs.getString("email"));
	            cus.setPassword(rs.getString("password")); // Changed from getNString
	            return cus;
	        } else {
	            System.out.println("No customer found with that email.");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}

	public ArrayList<customer> getAllCustomer(){
		try {
			
			ArrayList<customer> listCus =new ArrayList<customer>();
			
			String query="select * from gamudalk.customer";
			
			Statement statement=DBConnect.getConnection().createStatement();
			ResultSet rs= statement.executeQuery(query);
			while(rs.next()) {
				customer cus =new customer();
				cus.setName(rs.getString("name"));
				cus.setAge(rs.getString("age"));
				cus.setGender(rs.getString("gender"));
	            cus.setAddress(rs.getString("address"));
				cus.setEmail(rs.getString("email"));
				cus.setPassword(rs.getString("password"));
				
				listCus.add(cus);
				
			}
			return listCus;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
	
	public customer singleDataButton(customer cus) {
		try {
			String query="select * from gamudalk.customer where email='"+cus.getEmail()+"'"; 
			Statement statement= DBConnect.getConnection().createStatement();
			
			ResultSet  rs=statement.executeQuery(query);
			if(rs.next()) {
				
				cus.setName(rs.getString("name"));
				cus.setAge(rs.getString("age"));
				cus.setGender(rs.getString("gender"));
	            cus.setAddress(rs.getString("address"));
				cus.setEmail(rs.getString("email"));
				cus.setPassword(rs.getString("password"));
				return cus;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	
	
	
public void updateCustomer(customer customer) {
		
		try {
			
			String query="update gamudalk.customer SET  name='"+customer.getName()+"',age='"+customer.getAge()+"',gender='"+customer.getGender()+"',address='"+customer.getAddress()+"',email='"+customer.getEmail()+"',password ='"+customer.getPassword()+"'where email='"+customer.getEmail()+"'";
			 Statement statement=DBConnect.getConnection().createStatement();
			 statement.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void deleteCustomer(customer cus) {
		try {
			String query="Delete from gamudalk.customer where email= '"+cus.getEmail()+"'";
			
			Statement statement=DBConnect.getConnection().createStatement();
			statement.execute(query);
			
			
		} catch ( Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}


	public customer getCustomerByEmailAndPassword(String email, String password) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	

}
