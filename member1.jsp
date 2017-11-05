<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%
	//request.setCharacterEncoding("utf-8");

	String URL="jdbc::mysql://localhost/hw3";
	String USER="root";
	String PASS="";
	String memberName="";
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	try{
	   Class.forName("com.mysql.jdbc.Driver");
	   conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hw3",USER,"goeun15974");
	   stmt=conn.createStatement();
	   rs=stmt.executeQuery("select * from member");
	 
	}
	catch(SQLException e){
		
  	out.print(e.getMessage());
	}
	//response.sendRedirect("destroy1.jsp");
%>
<!DOCTYPE html>
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
                    	<center><h1>회원 주문 정보</h1></center>
                    	<hr class="small">
                    	<center><h3 style="color:#5D6D7E;margin-top:40px;">원하는 항목을 입력하세요</h3></center>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Post Content -->
    <article>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <table class="tblClass" width="600" style="margin-left:70px;border-bottom:1px solid black;">
                       <tr>
                          <td>● 현재 등록 된 회원 ●</td>
                       </tr>
                       <%
                             while(rs.next()){
                       %>
                       <tr>
                       <td> <%=rs.getString("MId") %></td>
                  		</tr>
                  		<%  } %>
                  </table>
                  </br></br></br>
                	<form action="member.jsp" method="post">
                   <h2 class="list">회원&nbsp;&nbsp;ID&nbsp;&nbsp;&nbsp;> &nbsp; <input type="text" name="memberID" /></h2>
                   <input id="searchBtn1" type="submit" value="검색"/>
                   </form>
                   <a href="test1.jsp"><input id="homeBtn" type="button" value="home"/></a>
                </div>
            </div>
        </div>
    </article>

    <hr>

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
