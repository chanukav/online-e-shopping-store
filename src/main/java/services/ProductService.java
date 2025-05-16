package services;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
	
	public static List<Product>getAllProduct(){
		ArrayList<Product>allProduct = new ArrayList<Product>();
		try {
			
			String query = "SELECT * FROM product";
			Statement statement = DBConnect.getConnection().createStatement();
			ResultSet rs = statement.executeQuery(query);
			
			while(rs.next()) {
				Product pro = new Product();
				
				pro.setPid(rs.getInt(1));
				pro.setProdName(rs.getString(2));
				pro.setCategory(rs.getString(3));
				pro.setDescrip(rs.getString(4));
				pro.setPimg(rs.getString(5));
				pro.setPprice(rs.getFloat(6));
				pro.setPstock(rs.getInt(7));
				pro.setPbrand(rs.getString(8));
				
				allProduct.add(pro);
			}return allProduct;
			
		} catch (SQLException e) {
		    System.out.println("Database error: " + e.getMessage());
		    return null;
		} catch (Exception e) {
		    e.printStackTrace();
		    return null;
		}
	}
	

}
