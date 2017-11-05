<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String URL="jdbc::mysql://localhost/hw3";
	String USER="root";
	String PASS="";
	String bookName="";	String bookAuthor="";	String bookCompany="";		String bookPrice="";	String bookStock="";
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	try{
	   Class.forName("com.mysql.jdbc.Driver");
	   conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hw3",USER,"goeun15974");
	   
	   bookName=request.getParameter("bookName");
	   bookAuthor=request.getParameter("bookAuthor");
	   bookCompany=request.getParameter("bookCompany");
	   bookPrice=request.getParameter("bookPrice").trim();
	   bookStock=request.getParameter("bookStock").trim();
	   
	   int bookPriceNum=Integer.parseInt(bookPrice);
	   int bookStockNum=Integer.parseInt(bookStock);
	   
	   //out.println(bookName+" -  "+bookAuthor+"-  "+bookCompany+" -  "+bookPrice+" -  "+bookStock);
	   stmt=conn.createStatement();
	   stmt.executeUpdate("INSERT INTO `hw3`.`book` VALUES ('"+bookName+"','"+bookAuthor+"','"+bookCompany+"','"+bookPriceNum+"','"+bookStockNum+"');");
	 
	}
	catch(SQLException e){
		
  	out.print(e.getMessage());
  	out.println(bookName+" -  "+bookAuthor+"-  "+bookCompany+" -  "+bookPrice+" -  "+bookStock);
	}
	response.sendRedirect("post.html");
%>


