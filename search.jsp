<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<%!
    String bookName="";	String bookAuthor="";	String bookCompany="";
    int bookPrice=0; int bookStock=0;
    ResultSet rs=null;
%>
<%
	request.setCharacterEncoding("utf-8");

	String URL="jdbc::mysql://localhost/hw3";
	String USER="root";
	String PASS="";
	
	Connection conn=null;
	Statement stmt=null;
	
	try{
	   Class.forName("com.mysql.jdbc.Driver");
	   conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hw3",USER,"goeun15974");
	   
	   bookName=request.getParameter("bookName");	//책이름
	   bookAuthor=request.getParameter("bookAuthor");	//저자
	   bookCompany=request.getParameter("bookCompany");	//출판사
	   //out.println(bookName+" -  "+bookAuthor+"-  "+bookCompany+" -  ");
	   
	   stmt=conn.createStatement();
	   
	   if(bookName!=""&&bookAuthor==""&&bookCompany==""){	//책만 지움
		   String query="select * from hw3.book where BName="+"'"+bookName+"'"+";";
			rs = stmt.executeQuery(query);
	   }
	   else if(bookName==""&&bookAuthor!=""&&bookCompany==""){	//저자가 쓴 책
		   String query="select * from hw3.book where BAuthor="+"'"+bookAuthor+"'"+";";
			rs = stmt.executeQuery(query);
	   }
	   else if(bookName==""&&bookAuthor==""&&bookCompany!=""){	//출판사
		   String query="select * from hw3.book where BCompany="+"'"+bookCompany+"'"+";";
			rs = stmt.executeQuery(query);
	   }
	   else if(bookName!=""&&bookAuthor==""&&bookCompany!=""){	//책+출판사 책
		   String query="SELECT * FROM hw3.book where BName="+"'"+bookName+"'"+" and BCompany="+"'"+bookCompany+"'"+";";
			rs = stmt.executeQuery(query); 
	   }
	   else if(bookName!=""&&bookAuthor!=""&&bookCompany==""){	//책+저자책
		   String query="SELECT * FROM hw3.book where BName="+"'"+bookName+"'"+" and BAuthor="+"'"+bookAuthor+"'"+";";
			rs = stmt.executeQuery(query);
	   }
	   else if(bookName==""&&bookAuthor!=""&&bookCompany!=""){	//책+저자책
		   String query="SELECT * FROM hw3.book where BAuthor="+"'"+bookAuthor+"'"+" and BCompany="+"'"+bookCompany+"'"+";";
			rs = stmt.executeQuery(query); 
	   }
	   else if(bookName!=""&&bookAuthor!=""&&bookCompany!=""){//책+출판사+작가
		   String query= "SELECT * FROM hw3.book where BName="+"'"+bookName+"'"+" and BAuthor="+"'"+bookAuthor+"'"+" and BCompany="+"'"+bookCompany+"'"+";";
			rs = stmt.executeQuery(query);
	   } 
	}
	catch(SQLException e){
  	 out.print(e.getMessage());
  		out.println(bookName+" -  "+bookAuthor+"-  "+bookCompany);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Clean Blog - Sample Post</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="css/clean-blog.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="mycss.css"/>
    
	<link href="startbootstrap-clean-blog-gh-pages/css/jquery-ui.css" rel="stylesheet">
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="startbootstrap-clean-blog-gh-pages/css/jquery-ui.js"></script>

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="db.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-custom navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    Menu <i class="fa fa-bars"></i>
                </button>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Header -->
    <!-- Set your background image for this header on the line below. -->
    <header class="intro-header" style="background-color: #FFF176">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="post-heading">
                    	<center><h1>검색 된 책 정보</h1></center>
                    	<hr class="small">
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Post Content -->
    <article>
        <div class="container">
            <div class="row" style="border: 1px solid #613F0A; padding-top:80px;padding-bottom:80px;">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                   <table class="tblClass" width="600" style="margin-left:60px;border-bottom:1px solid black;">
                       <tr>
                          <td> 책 이름 </td>
                          <td> 저자  </td>
                          <td> 출판사 </td>
                          <td> 가격  </td>
                          <td> 재고 </td>
                       </tr>
                       <%
                             while(rs.next()){
                       %>
                       <tr>
                       <td><%=rs.getString("BName")%></td>
                       <td><%=rs.getString("BAuthor")%></td>
                       <td><%=rs.getString("BCompany")%></td>
                  		<td><%= Integer.parseInt(rs.getString("BPrice"))%></td>
                  		<td><%= Integer.parseInt(rs.getString("BStock"))%></td>
                  		</tr>
                  		<% } %>

                  </table>
                </div>
            </div>
        </div>
    </article>

    <hr>
	<a href="test1.jsp"><input id="homeBtn" type="button" value="home" style="margin-left:44%;"/></a>
    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <p class="copyright text-muted">Copyright &copy; Your Website 2016</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="js/clean-blog.min.js"></script>

</body>

</html>
