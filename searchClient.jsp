<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
    <%!
    String bookName="";	String bookAuthor="";	String bookCompany="";
    int bookPrice=0; int bookStock=0;
%>
<%
	request.setCharacterEncoding("utf-8");

	String URL="jdbc::mysql://localhost/hw3";
	String USER="root";
	String PASS="";
	
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	try{
	   Class.forName("com.mysql.jdbc.Driver");
	   conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hw3",USER,"goeun15974");
	   
	   bookName=request.getParameter("bookName");	//å�̸�
	   bookAuthor=request.getParameter("bookAuthor");	//����
	   bookCompany=request.getParameter("bookCompany");	//���ǻ�
	   out.println(bookName+" -  "+bookAuthor+"-  "+bookCompany+" -  ");
	   
	   stmt=conn.createStatement();
	   
	   if(bookName!=""&&bookAuthor==""&&bookCompany==""){	//å�� ����
		   String query="select * from hw3.book where BName like "+"'%"+bookName+"%'"+";";
			rs = stmt.executeQuery(query);
			   while(rs.next()){
				   bookName=rs.getString("BName");
				   bookAuthor=rs.getString("BAuthor");
				   bookCompany=rs.getString("BCompany");
				   bookPrice=Integer.parseInt(rs.getString("BPrice"));
				   bookStock=Integer.parseInt(rs.getString("BStock"));
				   out.println(bookName+" -  "+bookAuthor+"-  "+bookCompany+" -  "+bookPrice+" ");
			   }
	   }
	   else if(bookName==""&&bookAuthor!=""&&bookCompany==""){	//���ڰ� �� å
		   String query="select * from hw3.book where BAuthor like "+"'%"+bookAuthor+"%'"+";";
			rs = stmt.executeQuery(query);
			   while(rs.next()){
				   bookName=rs.getString("BName");
				   bookAuthor=rs.getString("BAuthor");
				   bookCompany=rs.getString("BCompany");
				   bookPrice=Integer.parseInt(rs.getString("BPrice"));
				   bookStock=Integer.parseInt(rs.getString("BStock"));
				   out.println(bookName+" -  "+bookAuthor+"-  "+bookCompany+" -  "+bookPrice+" ");
			   }
	   }
	   else if(bookName==""&&bookAuthor==""&&bookCompany!=""){	//���ǻ�
		   String query="select * from hw3.book where BCompany like "+"'%"+bookCompany+"%'"+";";
			rs = stmt.executeQuery(query);
			   while(rs.next()){
				   bookName=rs.getString("BName");
				   bookAuthor=rs.getString("BAuthor");
				   bookCompany=rs.getString("BCompany");
				   bookPrice=Integer.parseInt(rs.getString("BPrice"));
				   bookStock=Integer.parseInt(rs.getString("BStock"));
				   out.println(bookName+" -  "+bookAuthor+"-  "+bookCompany+" -  "+bookPrice+" ");
			   }
	   }
	   else if(bookName!=""&&bookAuthor==""&&bookCompany!=""){	//å+���ǻ� å
		   String query="SELECT * FROM hw3.book where BName like "+"'%"+bookName+"%'"+" and BCompany like "+"'"+bookCompany+"'"+";";
			rs = stmt.executeQuery("select * from book where BName="+"'"+bookName+"'"+";");
			   while(rs.next()){
				   bookName=rs.getString("BName");
				   bookAuthor=rs.getString("BAuthor");
				   bookCompany=rs.getString("BCompany");
				   bookPrice=Integer.parseInt(rs.getString("BPrice"));
				   bookStock=Integer.parseInt(rs.getString("BStock"));
				   out.println(bookName+" -  "+bookAuthor+"-  "+bookCompany+" -  "+bookPrice+" ");
			   }
	   }
	   else if(bookName!=""&&bookAuthor!=""&&bookCompany==""){	//å+����å
		   String query="SELECT * FROM hw3.book where BName like "+"'%"+bookName+"%'"+" and BAuthor like "+"'"+bookAuthor+"'"+";";
			rs = stmt.executeQuery(query);
			   while(rs.next()){
				   bookName=rs.getString("BName");
				   bookAuthor=rs.getString("BAuthor");
				   bookCompany=rs.getString("BCompany");
				   bookPrice=Integer.parseInt(rs.getString("BPrice"));
				   bookStock=Integer.parseInt(rs.getString("BStock"));
				   out.println(bookName+" -  "+bookAuthor+"-  "+bookCompany+" -  "+bookPrice+" ");
			   }
	   }
	   else if(bookName!=""&&bookAuthor!=""&&bookCompany!=""){//å+���ǻ�+�۰�
		   String query= "SELECT * FROM hw3.book where BName like "+"'%"+bookName+"%'"+" and BAuthor like "+"'%"+bookAuthor+"%'"+" and BCompany like "+"'"+bookCompany+"'"+";";
			rs = stmt.executeQuery(query);
			   while(rs.next()){
				   bookName=rs.getString("BName");
				   bookAuthor=rs.getString("BAuthor");
				   bookCompany=rs.getString("BCompany");
				   bookPrice=Integer.parseInt(rs.getString("BPrice"));
				   bookStock=Integer.parseInt(rs.getString("BStock"));
				   out.println(bookName+" - asdf "+bookAuthor+"-  "+bookCompany+" -  "+bookPrice+" ");
			   }
	   } 
	}
	catch(SQLException e){
  	 out.print(e.getMessage());
  		out.println(bookName+" -  "+bookAuthor+"-  "+bookCompany);
	}
%>