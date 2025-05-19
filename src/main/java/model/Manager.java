package model;

public class Manager {

	private int pid;
    private double price;
    private String cusname;
    private String cusadress;
    private String cuscontact;
    private String cusemail;
    private String date;
    private int orderid;
    private String status;
    private int quantity;
    private double total;
    
    
    
	public int getPid() {
		return pid;
	}
	public double getPrice() {
		return price;
	}
	public String getCusname() {
		return cusname;
	}
	public String getCusadress() {
		return cusadress;
	}
	public String getCuscontact() {
		return cuscontact;
	}
	public String getCusemail () {
		return cusemail;
	}
	public String getDate () {
		return date;
	}
	public int getOrderid() {
	    return orderid;
	}
	public String getStatus() {
	    return status;
	}
	public  int getQuantity() {
		return quantity;
	}
	public double getTotal() {
		return total;
	}
	
	public void setPid(int pid) {
		this.pid = pid;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public void setCusname(String cusname) {
		this.cusname = cusname;
	}
	public void setCusadress(String cusadress) {
		this.cusadress = cusadress;
	}
	public void setCuscontact(String cuscontact) {
		this.cuscontact = cuscontact;
	}
	public void setCusemail(String cusemail) {
		this.cusemail = cusemail;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public void setOrderid(int orderid) {
	    this.orderid = orderid;
	}
	public void setStatus(String status) {
	    this.status = status;
	}
	public String getFormattedOrderId() {
	    return String.format("%04d", this.orderid);
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public void setTotal(double total) {
		this.total = total;
	}
}
