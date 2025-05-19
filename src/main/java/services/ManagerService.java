package services;

import model.Manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import util.DBConnect;



public class ManagerService {

 
        


	public static boolean validate(Manager cus) {
		String query = "INSERT INTO pcusdetails ( pid,price,cusname,cusadress,cuscontact,cusemail,date,quantity,total) VALUES (?, ?, ? ,? ,?,? ,? ,? ,?)";
	    try (Connection con = DBConnect.getConnection();
	         PreparedStatement stmt = con.prepareStatement(query)) {
	        
	    	stmt.setInt(1, cus.getPid());
	        stmt.setDouble(2, cus.getPrice());
	        stmt.setString(3, cus.getCusname());
	        stmt.setString(4, cus.getCusadress());
	        stmt.setString(5, cus.getCuscontact());
	        stmt.setString(6, cus.getCusemail());
	        stmt.setString(7, cus.getDate());
	        stmt.setInt(8, cus.getQuantity());
	        stmt.setDouble(9, cus.getTotal());
	        
	        
	        int rowsInserted = stmt.executeUpdate();
	        return rowsInserted > 0;
	
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	
	}
	
	
	// Get All Orders
    public ArrayList<Manager> getAllOrder() throws ClassNotFoundException {
        ArrayList<Manager> orderList = new ArrayList<>();
        String query = "SELECT * FROM pcusdetails";
        try (Connection connection = DBConnect.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Manager cus = new Manager();
                cus.setPid(rs.getInt("pid"));
                cus.setPrice(rs.getDouble("price"));
                cus.setCusname(rs.getString("cusname"));
                cus.setCusadress(rs.getString("cusadress"));
                cus.setCusemail(rs.getString("cusemail"));
                cus.setCuscontact(rs.getString("cuscontact"));
                cus.setDate(rs.getString("date"));
                cus.setQuantity(rs.getInt("quantity"));
                cus.setTotal(rs.getDouble("total"));
                cus.setOrderid(rs.getInt("orderid")); 
                cus.setStatus(rs.getString("status"));
                orderList.add(cus);
            }
            return orderList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public static boolean statusUpdate(Manager cus) {
        String query = "INSERT INTO pcusdetails (pid, price, cusname, cusemail, cusadress, cuscontact, date,quantity,total ,status) VALUES (?, ?, ?, ?, ?, ?, ?, ? ,? , ?)";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, cus.getPid());
            stmt.setDouble(2, cus.getPrice());
            stmt.setString(3, cus.getCusname());
            stmt.setString(4, cus.getCusemail());
            stmt.setString(5, cus.getCusadress());
            stmt.setString(6, cus.getCuscontact());
            stmt.setString(7, cus.getDate());
            stmt.setInt(8, cus.getQuantity());
	        stmt.setDouble(9, cus.getTotal());
            stmt.setString(10, "Pending");

            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    int orderid = rs.getInt(1);
                    cus.setOrderid(orderid);
                    System.out.println("Generated Order ID: " + orderid);
                }
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    
    public boolean updateOrderStatus(int orderid, String status) {
        String sql = "UPDATE pcusdetails SET status = ? WHERE orderid = ?";

        try (Connection con = DBConnect.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, status);
            stmt.setInt(2, orderid);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                return true;
            } else {
                System.out.println("Order not found or no change in status.");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

public  Manager getOrderById(Manager cus) {
        

        try {String query = "SELECT * FROM pcusdetails WHERE orderid='"+cus.getOrderid()+"' ";
            Statement statement = DBConnect.getConnection().createStatement();
            
            

            ResultSet rs = statement.executeQuery(query);
            if (rs.next()) {
                
                cus.setOrderid(rs.getInt("orderid"));
                cus.setCusname(rs.getString("cusname"));
                cus.setCusadress(rs.getString("cusadress"));
                cus.setCuscontact(rs.getString("cuscontact"));
                cus.setCusemail(rs.getString("cusemail"));
                cus.setPid(rs.getInt("pid"));
                cus.setPrice(rs.getInt("price"));
                cus.setQuantity(rs.getInt("quantity"));
                cus.setTotal(rs.getInt("total"));
                cus.setDate(rs.getString("date"));
                cus.setStatus(rs.getString("status"));
                return cus;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

	public void updateOrder(Manager cus) throws ClassNotFoundException {
	    String query = "UPDATE pcusdetails SET cusname=?, cusemail=?, cusadress=?, cuscontact=?, price=?, date=?, pid=?, total=?, quantity=? WHERE orderid=?";
	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(query)) {
	        pstmt.setString(1, cus.getCusname());
	        pstmt.setString(2, cus.getCusemail());
	        pstmt.setString(3, cus.getCusadress());
	        pstmt.setString(4, cus.getCuscontact());
	        pstmt.setDouble(5, cus.getPrice());
	        pstmt.setString(6, cus.getDate());
	        pstmt.setInt(7, cus.getPid());
	        pstmt.setDouble(8, cus.getTotal());
	        pstmt.setInt(9, cus.getQuantity());
	        pstmt.setInt(10, cus.getOrderid());
	
	        int rowsUpdated = pstmt.executeUpdate();
	        if (rowsUpdated == 0) {
	            System.out.println("No record found with orderid: " + cus.getOrderid());
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}


    
    
    public void deletOrder(Manager cus) {
        String query = "DELETE FROM pcusdetails WHERE orderid = ?";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setInt(1, cus.getOrderid());
            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

