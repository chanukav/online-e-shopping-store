package services;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.Category;
import util.DBConnect;

public class CategoryService {

    // Add Category
    public void addCategory(Category category) {
        try {
            String query = "INSERT INTO gamudalk.categories (name, description) VALUES ('" 
                         + category.getName() + "', '" 
                         + category.getDescription() + "')";

            Statement statement = DBConnect.getConnection().createStatement();
            statement.executeUpdate(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Get One Category by ID
    public Category getCategoryById(int id) {
        try {
            String query = "SELECT * FROM gamudalk.categories WHERE category_id = " + id;
            Statement statement = DBConnect.getConnection().createStatement();
            ResultSet rs = statement.executeQuery(query);

            if (rs.next()) {
                Category category = new Category();
                category.setCategoryId(rs.getInt("category_id"));
                category.setName(rs.getString("name"));
                category.setDescription(rs.getString("description"));
                return category;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Categories
    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM gamudalk.categories";
            Statement statement = DBConnect.getConnection().createStatement();
            ResultSet rs = statement.executeQuery(query);

            while (rs.next()) {
                Category category = new Category();
                category.setCategoryId(rs.getInt("category_id"));
                category.setName(rs.getString("name"));
                category.setDescription(rs.getString("description"));
                list.add(category);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Update Category
    public void updateCategory(Category category) {
        try {
            String query = "UPDATE gamudalk.categories SET name = '" + category.getName() 
                         + "', description = '" + category.getDescription() 
                         + "' WHERE category_id = " + category.getCategoryId();

            Statement statement = DBConnect.getConnection().createStatement();
            statement.executeUpdate(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
    // Delete Category
    public void deleteCategory(Category cat) {
        try {
        	String query = "DELETE FROM gamudalk.categories WHERE category_id = " + cat.getCategoryId();
            Statement statement = DBConnect.getConnection().createStatement();
            statement.executeUpdate(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
