package com.digizol.webapp.plotly;

public class Customer {

    private String id;
    private int age;
    private int salesCount;

    public Customer(String id, int age, int salesCount) {
        this.id = id;
        this.age = age;
        this.salesCount = salesCount;

    }

    public String getId() {
        return id;
    }

    public int getAge() {
        return age;
    }

    public int getSalesCount() {
        return salesCount;
    }
}