package services;



import java.sql.Connection;
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
			
			String query = "INSERT INTO product(pname,category_id,descrip,proImg,price,pStk,pBrnd) VALUES (?,?,?,?,?,?,?)";
			PreparedStatement preparedStatement = DBConnect.getConnection().prepareStatement(query);
			
			preparedStatement.setString(1,pro.getProdName());
			preparedStatement.setInt(2, pro.getCategoryId());
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
				pro.setCategoryId(rs.getInt(3));
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
	
	public void updateProduct(Product pro) {
		try {
		String query = "UPDATE product SET pname = ?, category_id = ?, descrip = ?, proImg = ?, price = ?,pStk = ?, pBrnd =? WHERE pid = ?";
		PreparedStatement preparedStatement = DBConnect.getConnection().prepareStatement(query);
		
		preparedStatement.setString(1, pro.getProdName());
		preparedStatement.setInt(2, pro.getCategoryId());
		preparedStatement.setString(3, pro.getDescrip());
		preparedStatement.setString(4, pro.getPimg());
		preparedStatement.setFloat(5,pro.getPprice());
		preparedStatement.setInt(6,pro.getPstock());
		preparedStatement.setString(7,pro.getPbrand());
		preparedStatement.setInt(8, pro.getPid());
		
		preparedStatement.executeUpdate();
		} catch (SQLException e) {
	        System.out.println("Database error: " + e.getMessage());
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	public void deleteProduct(Product pro) {
		try {
			
			String query = "Delete From product where pid = '"+pro.getPid()+"'";
			Statement statement = DBConnect.getConnection().createStatement();
			statement.executeUpdate(query);
			
		} catch (SQLException e) {
	        System.out.println("Database error: " + e.getMessage());
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static List<Product> getProductById(int productId) throws ClassNotFoundException {
        List<Product> productList = new ArrayList<>();
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement("SELECT * FROM product WHERE pid = ?")) {

            preparedStatement.setInt(1, productId);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Product pro = new Product();
                pro.setPid(rs.getInt("pid"));
                pro.setProdName(rs.getString("pname"));
                pro.setCategoryId(rs.getInt("category"));
                pro.setDescrip(rs.getString("descrip"));
                pro.setPimg(rs.getString("proImg"));
                pro.setPprice(rs.getFloat("price"));
                pro.setPstock(rs.getInt("pStk"));
                pro.setPbrand(rs.getString("pBrnd"));

                productList.add(pro);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

	public static List<Product> getProductsByCategoryId(int categoryId) throws ClassNotFoundException {
	    ArrayList<Product> products = new ArrayList<>();
	    try {
	        String query = "SELECT * FROM product WHERE category_id = ?";
	        PreparedStatement ps = DBConnect.getConnection().prepareStatement(query);
	        ps.setInt(1, categoryId);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Product pro = new Product();
	            pro.setPid(rs.getInt("pid"));
	            pro.setProdName(rs.getString("pname"));
	            pro.setCategoryId(rs.getInt("category_id"));
	            pro.setDescrip(rs.getString("descrip"));
	            pro.setPimg(rs.getString("proImg"));
	            pro.setPprice(rs.getFloat("price"));
	            pro.setPstock(rs.getInt("pStk"));
	            pro.setPbrand(rs.getString("pBrnd"));

	            products.add(pro);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return products;
	}


}
