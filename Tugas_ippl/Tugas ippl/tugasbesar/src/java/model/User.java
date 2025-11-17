/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class User {
    private int id;
    private String username;
    private String password;
    private String email;
    private String role; // <-- TAMBAHKAN INI

    public User() {}

    // Modifikasi constructor agar bisa menerima role
    public User(int id, String username, String password, String email, String role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.role = role; // <-- TAMBAHKAN INI
    }

    // Getters dan Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    // Tambahkan Getter dan Setter untuk role
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
}
