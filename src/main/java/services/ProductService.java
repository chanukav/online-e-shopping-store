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
	
	public static List<Product> getAllProduct() {
	    ArrayList<Product> allProduct = new ArrayList<Product>();
	    try {
	        String query = "SELECT p.pid, p.pname, p.category_id, p.descrip, p.proImg, p.price, p.pStk, p.pBrnd, c.name AS category " +
	                       "FROM product p LEFT JOIN categories c ON p.category_id = c.category_id";
	        Statement statement = DBConnect.getConnection().createStatement();
	        ResultSet rs = statement.executeQuery(query);

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
	            pro.setCategory(rs.getString("category")); // NEW LINE

	            allProduct.add(pro);
	        }
	        return allProduct;

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
	        String query = "SELECT p.pid, p.pname, p.category_id, p.descrip, p.proImg, p.price, p.pStk, p.pBrnd, c.name AS category " +
	                       "FROM product p LEFT JOIN categories c ON p.category_id = c.category_id WHERE p.category_id = ?";
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
	            pro.setCategory(rs.getString("category"));  // category name from join

	            products.add(pro);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return products;
	}

    public static List<Product> searchProducts(String keyword) throws ClassNotFoundException {
        ArrayList<Product> products = new ArrayList<>();
        if (keyword == null) {
            return products;
        }
        String trimmed = keyword.trim();
        if (trimmed.isEmpty()) {
            return products;
        }
        try {
            String query = "SELECT p.pid, p.pname, p.category_id, p.descrip, p.proImg, p.price, p.pStk, p.pBrnd, c.name AS category " +
                    "FROM product p LEFT JOIN categories c ON p.category_id = c.category_id " +
                    "WHERE LOWER(p.pname) LIKE ? OR LOWER(p.descrip) LIKE ?";
            PreparedStatement ps = DBConnect.getConnection().prepareStatement(query);
            String like = "%" + trimmed.toLowerCase() + "%";
            ps.setString(1, like);
            ps.setString(2, like);
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
                pro.setCategory(rs.getString("category"));

                products.add(pro);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }



}
