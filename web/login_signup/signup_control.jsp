<%--
  Created by IntelliJ IDEA.
  User: 15173
  Date: 2018/6/13
  Time: 8:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="Javabean.LoginSignupBean" %>
<%
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    String password_confirm=request.getParameter("password_confirm");

    if(username==null||password==null||!password.equals(password_confirm)){
        response.sendRedirect("signup_password_unequal.jsp");
    }else{
        LoginSignupBean loginSignupBean=new LoginSignupBean();
        boolean isExist=loginSignupBean.isExist(username);
        if(!isExist){
            loginSignupBean.add(username,password);
            response.sendRedirect("login.jsp");
        }else{
            response.sendRedirect("signup_failed.jsp");
        }
    }

%>
