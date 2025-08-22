package com.aimae.model;

public class Cart {
    private String CART_ID;
    private String USER_ID;
    private String PRODUCT_ID;
    private int QUANTITY;
    private String ADD_DATE;
    
    // Product 정보 (조인용)
    private String PRODUCT_NAME;
    private int PRICE;
    private String PHOTO_PATH;
    
    // 생성자
    public Cart() {}
    
    public Cart(String CART_ID, String USER_ID, String PRODUCT_ID, int QUANTITY, String ADD_DATE) {
        this.CART_ID = CART_ID;
        this.USER_ID = USER_ID;
        this.PRODUCT_ID = PRODUCT_ID;
        this.QUANTITY = QUANTITY;
        this.ADD_DATE = ADD_DATE;
    }
    
    // Getter & Setter
    public String getCART_ID() {
        return CART_ID;
    }
    
    public void setCART_ID(String CART_ID) {
        this.CART_ID = CART_ID;
    }
    
    public String getUSER_ID() {
        return USER_ID;
    }
    
    public void setUSER_ID(String USER_ID) {
        this.USER_ID = USER_ID;
    }
    
    public String getPRODUCT_ID() {
        return PRODUCT_ID;
    }
    
    public void setPRODUCT_ID(String PRODUCT_ID) {
        this.PRODUCT_ID = PRODUCT_ID;
    }
    
    public int getQUANTITY() {
        return QUANTITY;
    }
    
    public void setQUANTITY(int QUANTITY) {
        this.QUANTITY = QUANTITY;
    }
    
    public String getADD_DATE() {
        return ADD_DATE;
    }
    
    public void setADD_DATE(String ADD_DATE) {
        this.ADD_DATE = ADD_DATE;
    }
    
    public String getPRODUCT_NAME() {
        return PRODUCT_NAME;
    }
    
    public void setPRODUCT_NAME(String PRODUCT_NAME) {
        this.PRODUCT_NAME = PRODUCT_NAME;
    }
    
    public int getPRICE() {
        return PRICE;
    }
    
    public void setPRICE(int PRICE) {
        this.PRICE = PRICE;
    }
    
    public String getPHOTO_PATH() {
        return PHOTO_PATH;
    }
    
    public void setPHOTO_PATH(String PHOTO_PATH) {
        this.PHOTO_PATH = PHOTO_PATH;
    }
    
    // 총 가격 계산 메서드
    public int getTOTAL_PRICE() {
        return this.PRICE * this.QUANTITY;
    }
    
    @Override
    public String toString() {
        return "Cart [CART_ID=" + CART_ID + ", USER_ID=" + USER_ID + ", PRODUCT_ID=" + PRODUCT_ID + 
               ", QUANTITY=" + QUANTITY + ", ADD_DATE=" + ADD_DATE + ", PRODUCT_NAME=" + PRODUCT_NAME + 
               ", PRICE=" + PRICE + ", PHOTO_PATH=" + PHOTO_PATH + "]";
    }
}
