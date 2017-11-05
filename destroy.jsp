<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>

<%
	request.setCharacterEncoding("utf-8");

	String URL="jdbc::mysql://localhost/hw3";
	String USER="root";
	String PASS="";
	String bookName="";	String bookAuthor="";	String bookCompany="";;
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	try{
	   Class.forName("com.mysql.jdbc.Driver");
	   conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hw3",USER,"goeun15974");
	   
	   bookName=request.getParameter("bookName");	//책이름
	   bookAuthor=request.getParameter("bookAuthor");	//저자
	   bookCompany=request.getParameter("bookCompany");	//출판사
	   stmt=conn.createStatement();
	   //out.println(bookName+" -  "+bookAuthor+"-  "+bookCompany);
	   if(bookName!=""&&bookAuthor==""&&bookCompany==""){	//책만 지움
			String query="delete from hw3.book where BName="+"'"+bookName+"'"+";";
			 stmt.executeUpdate(query);
	   }
	   else if(bookName==""&&bookAuthor!=""&&bookCompany==""){	//저자가 쓴 책
		   String query="delete from hw3.book where BAuthor="+"'"+bookAuthor+"'"+";";
		   stmt.executeUpdate(query);
	   }
	   else if(bookName==""&&bookAuthor==""&&bookCompany!=""){	//저자가 쓴 책
		   String query="delete from hw3.book where BCompany="+"'"+bookCompany+"'"+";";
		   stmt.executeUpdate(query);
	   }
	   else if(bookName!=""&&bookAuthor==""&&bookCompany!=""){	//책+출판사 책
		   String query="delete from hw3.book where BName="+"'"+bookName+"' "+"and"+" BCompany="+"'"+bookCompany+"'"+";";
		   stmt.executeUpdate(query);
	   }
	   else if(bookName!=""&&bookAuthor!=""&&bookCompany==""){	//책+저자책
		   String query="delete from hw3.book where BName="+"'"+bookName+"' "+"and"+" BAuthor="+"'"+bookAuthor+"'"+";";
		   stmt.executeUpdate(query);
	   }
	   else {//책+출판사+작가
		   String query="delete from hw3.book where BAuthor="+"'"+bookAuthor+"' "+"and"+" BName="+"'"+bookName+"'"+" and"+" BCompany="+"'"+bookCompany+"'"+";";
		   stmt.executeUpdate(query);
	   }	 
	}
	catch(SQLException e){
  	 out.print(e.getMessage());
  		out.println(bookName+" -  "+bookAuthor+"-  "+bookCompany);
	}
	response.sendRedirect("destroy1.jsp");
%>

