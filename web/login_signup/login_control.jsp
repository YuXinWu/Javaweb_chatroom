<%--
  Created by IntelliJ IDEA.
  User: 15173
  Date: 2018/6/12
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Javabean.LoginSignupBean" %>
<%
    //获取参数
    String username=request.getParameter("username");
    String password=request.getParameter("password");

    if(username==null || password==null){
        response.sendRedirect("login.jsp");
    }else{
        //检查是否登录成功
        LoginSignupBean loginSignupBean=new LoginSignupBean();
        boolean isValid=loginSignupBean.valid(username,password);
        if(isValid){
            session.setAttribute("username",username);
            response.sendRedirect("/Javaweb/chat/chatroom.jsp"); //加个路径就可以访问了。
        }else{
            response.sendRedirect("login_failed.jsp");
        }
    }
%>