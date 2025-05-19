package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.payment;
import util.DBConnect;

public class paymentService {

    // Register Card
    public void regCard(payment pay) {
        try (Connection conn = DBConnect.getConnection()) {
            String query = "INSERT INTO card_details (cardNumber, cardName, expMonth, expYear, cvv) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, pay.getCardNumber());
            ps.setString(2, pay.getCardName());
            ps.setString(3, pay.getExpMonth());
            ps.setString(4, pay.getExpYear());
            ps.setString(5, pay.getCvv());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Read All Cards
    public ArrayList<payment> getAllCards() {
        ArrayList<payment> cards = new ArrayList<>();
        try (Connection conn = DBConnect.getConnection()) {
            String query = "SELECT * FROM card_details";
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery(query);

            while (rs.next()) {
                payment card = new payment();
                card.setCardNumber(rs.getString("cardNumber"));
                card.setCardName(rs.getString("cardName"));
                card.setExpMonth(rs.getString("expMonth"));
                card.setExpYear(rs.getString("expYear"));
                card.setCvv(rs.getString("cvv"));
                cards.add(card);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return cards;
    }

    // Read Card by Number
    public payment getCardByNumber(String cardNumber) {
        try (Connection conn = DBConnect.getConnection()) {
            String query = "SELECT * FROM card_details WHERE cardNumber = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, cardNumber);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                payment card = new payment();
                card.setCardNumber(rs.getString("cardNumber"));
                card.setCardName(rs.getString("cardName"));
                card.setExpMonth(rs.getString("expMonth"));
                card.setExpYear(rs.getString("expYear"));
                card.setCvv(rs.getString("cvv"));
                return card;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // Update Card
    public boolean updateCard(payment card) {
        try (Connection conn = DBConnect.getConnection()) {
            String sql = "UPDATE card_details SET cardName=?, expMonth=?, expYear=?, cvv=? WHERE cardNumber=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, card.getCardName());
            ps.setString(2, card.getExpMonth());
            ps.setString(3, card.getExpYear());
            ps.setString(4, card.getCvv());
            ps.setString(5, card.getCardNumber());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete Card
    public void deleteCard(String cardNumber) {
        try (Connection conn = DBConnect.getConnection()) {
            String query = "DELETE FROM card_details WHERE cardNumber = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, cardNumber);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
