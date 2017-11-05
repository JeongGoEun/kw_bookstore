<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Book Master</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="css/clean-blog.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- Page Header -->
    <!-- Set your background image for this header on the line below. -->
    <header class="intro-header" style="background-color: #FFF176">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="site-heading">
                        <h1>K.W BOOK MASTER</h1>
                        <hr class="small">
                        <span class="subheading">광운서점</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div class="post-preview">
                    <a href="post.html">
                        <h2 class="post-title">
                            책 등록
                        </h2>
                    </a>
                </div>
                <hr>
                <center><form action="destroy1.jsp" method="post">
                <div class="post-preview">
                    <a href="destroy1.jsp">
                        <h2 class="post-title">
                           	책폐기
                        </h2>
                    </a>
                </div>
                </form></center>
                <hr>
                <center><form action="search1.jsp" method="post">
                <div class="post-preview">
                    <a href="search1.jsp">
                        <h2 class="post-title">
                           	책검색
                        </h2>
                    </a>
                </div>
                </form></center>
                <hr>
               <center><form action="inventory1.jsp" method="post">
                <div class="post-preview">
                    <a href="inventory1.jsp">
                        <h2 class="post-title">
                           	재고 검색
                        </h2>
                    </a>
                </div>
                </form></center>
                <hr>
               <div class="post-preview">
                    <center><form action="member1.jsp" method="post">
                <div class="post-preview">
                    <a href="member1.jsp">
                        <h2 class="post-title">
                           	회원 주문 정보
                        </h2>
                    </a>
                </div>
                </form></center>
                </div>
                <hr>
                <div class="post-preview">
                    <a href="sales.html">
                        <h2 class="post-title">
                            월별 매출 관리
                        </h2>
                    </a>
                </div>
                <hr>
            </div>
        </div>
    </div>


    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <p class="copyright text-muted">Copyright &copy; Data Base HW3</p>
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