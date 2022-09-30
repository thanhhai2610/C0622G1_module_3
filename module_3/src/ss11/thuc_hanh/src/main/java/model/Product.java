package model;

public class Product {
    private int id;
    private String nameProduct;
    private String company;
    private String madeIn;

    public Product() {
    }

    public Product(int id, String nameProduct, String company, String madeIn) {
        this.id = id;
        this.nameProduct = nameProduct;
        this.company = company;
        this.madeIn = madeIn;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getMadeIn() {
        return madeIn;
    }

    public void setMadeIn(String madeIn) {
        this.madeIn = madeIn;
    }
}
