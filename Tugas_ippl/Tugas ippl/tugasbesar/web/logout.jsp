<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Hapus semua atribut session
    session.invalidate();
    // Redirect ke halaman index.jsp
    response.sendRedirect("index.jsp");
%>