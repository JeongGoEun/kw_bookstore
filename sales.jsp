<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<%!
	int buyDate=0;	int buyMonth=0; int sum=0; int daySum=0;
%>
<%
	request.setCharacterEncoding("utf-8");

	String URL="jdbc::mysql://localhost/hw3";
	String USER="root";
	String PASS="";
	
	Connection conn=null;
	Statement stmt=null;	Statement stmt2=null;
	ResultSet rs=null;
	ResultSet rs2=null;
	
	try{
	   Class.forName("com.mysql.jdbc.Driver");
	   conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hw3",USER,"goeun15974");
	   
	   if(request.getParameter("buyDate")!="")
	   		buyDate=Integer.parseInt(request.getParameter("buyDate"));	//책 이름
	   else
		   	buyDate=0;
	   if(request.getParameter("buyMonth")!="")		
	  		buyMonth=Integer.parseInt(request.getParameter("buyMonth"));
	   else
		   buyMonth=0;
	   
	   //out.println(buyMonth+"-  "+buyDate+" -  ");
	   stmt=conn.createStatement();
	   stmt2=conn.createStatement();
	   if(buyMonth!=0&&buyDate==0){	//월만 입력
		   //out.println(buyMonth+"-  "+buyDate+" -  ");
		   rs = stmt.executeQuery("select * from sales where SMonth="+"'"+buyMonth+"'"+";");
		   rs2= stmt2.executeQuery("select * from soldlist where BuyMonth="+"'"+buyMonth+"'"+";");
			daySum=0;
		   while(rs.next()){
			   sum+=Integer.parseInt(rs.getString("SSum"));
			   //out.println(sum);
		   }
	   }
	   else if(buyMonth==0&&buyDate!=0){	//월만 입력
		   rs = stmt.executeQuery("select * from sales where SDay="+"'"+buyDate+"' and "+" SMonth="+buyMonth+";");
		   
	   		sum=0;
		   while(rs.next()){
			   daySum+=Integer.parseInt(rs.getString("SSum"));
		   }
	   }
	   else{	//월만 입력
		   rs = stmt.executeQuery("select * from sales where SMonth="+"'"+buyMonth+"' "+"and SDay="+"'"+buyDate+"'"+";");
		   rs2= stmt2.executeQuery("select * from soldlist where BuyMonth="+"'"+buyMonth+"' and "+" BuyDate='"+buyDate+"'"+";");
		   out.println(buyDate+" -  "+buyMonth+"-  ");
		   while(rs.next()){
			   sum+=Integer.parseInt(rs.getString("SSum"));
			   daySum+=Integer.parseInt(rs.getString("SSum"));
		   }
	   }
	}
	catch(SQLException e){
  	 out.print(e.getMessage());
  		out.println(buyDate+" -  "+buyMonth+"-  ");
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
                    	<center><h1>검색 된 매출 정보</h1></center>
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
                	<table class="tblClass" width="600" style="margin-left:50px;border-bottom:1px solid black;">
                       <tr>
                          <td>● 책 이름 ●</td>
                          <td>● 책 가격  ●</td>
                          <td>● 월 ●</td>
                          <td>● 일 ●</td>
                       </tr>
                       <%
                             while(rs2.next()){
                       %>
                       <tr>
                       <td> <%=rs2.getString("BName")%></td>
                  		<td><%=Integer.parseInt(rs2.getString("BPrice"))%></td>
                  		<td><%=Integer.parseInt(rs2.getString("BuyMonth"))%></td>
                  		<td><%=Integer.parseInt(rs2.getString("BuyDate"))%></td>
                  		</tr>
                  		<%  } %>
                  </table><br><br>
                   <h2 class="list"><%=buyMonth %>월별 매출 총합: &nbsp;<%=sum %></h2></br>
                   <h2 class="list"><%=buyDate %>일별 매출 총합: &nbsp;<%=daySum %></h2></br>
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
                    <p class="copyright text-muted">Copyright &copy; Your Website 2016<%=sum=0 %>	<%=daySum=0 %></p>
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