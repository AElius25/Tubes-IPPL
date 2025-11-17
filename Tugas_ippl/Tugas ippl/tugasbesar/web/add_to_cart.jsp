<%-- 
    Document   : add_to_cart
    Created on : 9 Jun 2025, 21.48.40
    Author     : PLN
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String productName = request.getParameter("product_name");
    String productPrice = request.getParameter("product_price");

    if (productName != null && productPrice != null) {
        // Get cart from session
        java.util.List<String> cart = (java.util.List<String>) session.getAttribute("cart");
        if (cart == null) {
            cart = new java.util.ArrayList<>();
            session.setAttribute("cart", cart);
        }

        // Add product to cart
        cart.add(productName + " - $" + productPrice);

        // Redirect to cart page
        response.sendRedirect("cart.jsp");
    } else {
        response.sendRedirect("ecommerce.jsp");
    }
%>