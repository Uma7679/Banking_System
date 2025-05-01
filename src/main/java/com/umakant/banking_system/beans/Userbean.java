package com.umakant.banking_system.beans;

import java.util.regex.Pattern;

public class Userbean {
    private String name;
    private String email;
    private String password;
    private String address;
    private String phone;

    public Userbean() {

    }

    public Userbean(String name, String email, String password, String address, String phone) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.address = address;
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        if (isValidName(name)) {
            this.name = name;
        } else {
            throw new RuntimeException("Invalid name: " + name);
        }
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        if(isValidEmail(email)){
            this.email = email;
        }
        else{
            throw new RuntimeException();
        }
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        if (isValidPassword(password)) {
            this.password = password;
        } else {
            throw new RuntimeException("Password must be at least 8 characters long and include uppercase, lowercase, digit, and special character.");
        }
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        if (isValidAddress(address)) {
            this.address = address;
        } else {
            throw new RuntimeException("Invalid address format.");
        }
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        if (isValidPhone(phone)) {
            this.phone = phone;
        }
        else {
            throw new RuntimeException("Invalid phone number: " + phone);
        }
    }

    private boolean isValidName(String name) {
        String nameRegex = "^[A-Za-z]+( [A-Za-z]+)*$";
        return Pattern.matches(nameRegex, name);
    }

    private boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        Pattern pattern = Pattern.compile(emailRegex);
        return pattern.matcher(email).matches();
    }

    private boolean isValidPassword(String password) {
        String passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=!]).{8,}$";
        return Pattern.matches(passwordRegex, password);
    }

    private boolean isValidAddress(String address) {
        String addressRegex = "^[A-Za-z0-9 ,./#\\-]{5,100}$";
        return Pattern.matches(addressRegex, address);
    }

    private boolean isValidPhone(String phone) {
        String phoneRegex = "^[0-9]{10}$";
        return Pattern.matches(phoneRegex, phone);
    }

}
