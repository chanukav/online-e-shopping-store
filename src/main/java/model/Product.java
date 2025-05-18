package model;

import java.io.Serializable;

public class Product implements Serializable {
    private int pid;
    private String prodName;
    private String category;
    private String Pimg;
    private String descrip;
    private float Pprice;
    private int Pstock;
    private String Pbrand;

    public int getPid() {
        return pid;
    }
    public void setPid(int pid) {
        this.pid = pid;
    }
    public String getProdName() {
        return prodName;
    }
    public void setProdName(String prodName) {
        this.prodName = prodName;
    }
    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }
    public String getPimg() {
        return Pimg;
    }
    public void setPimg(String pimg) {
        Pimg = pimg;
    }
    public String getDescrip() {
        return descrip;
    }
    public void setDescrip(String descrip) {
        this.descrip = descrip;
    }
    public float getPprice() {
        return Pprice;
    }
    public void setPprice(float pprice) {
        Pprice = pprice;
    }
    public int getPstock() {
        return Pstock;
    }
    public void setPstock(int pstock) {
        Pstock = pstock;
    }
    public String getPbrand() {
        return Pbrand;
    }
    public void setPbrand(String pbrand) {
        Pbrand = pbrand;
    }
}