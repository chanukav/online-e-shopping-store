package services;



import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Product;
import util.DBConnect;

public class ProductService {
	
	public void regProduct(Product pro) {
		try {
			
			String query = "INSERT INTO product(pname,category,descrip,proImg,price,pStk,pBrnd) VALUES (?,?,?,?,?,?,?)";
			PreparedStatement preparedStatement = DBConnect.getConnection().prepareStatement(query);
			
			preparedStatement.setString(1,pro.getProdName());
			preparedStatement.setString(2,pro.getCategory());
			preparedStatement.setString(3,pro.getDescrip());
			preparedStatement.setString(4,pro.getPimg());
			preparedStatement.setFloat(5,pro.getPprice());
			preparedStatement.setInt(6,pro.getPstock());
			preparedStatement.setString(7,pro.getPbrand());
			
			preparedStatement.executeUpdate();
			
			
			
		} catch (SQLException e) {
		    System.out.println("Database error: " + e.getMessage());
		} catch (Exception e) {
		    e.printStackTrace();
		}
	}
	

}
