<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Trang Chủ</title>

    <jsp:include page="../head.jsp" />
	<style>
	    .container {
	      display: flex;
	      flex-wrap: wrap;
	    }
	
	    .rectangle {
	      width: 200px;
	      height: 100px;
	      border: 1px solid #000;
	      
	      margin: 10px;
	      display: flex;
	      align-items: center;
	      justify-content: center;
	      background-color: #f0f0f0;
      	  box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
      	  
	    }
	    .rectangle p {
	    	color: black; 
      		margin: 0;
      		text-align: center;
    	}
	  </style>
</head>
<body id="page-top">
	<%
	    String maND = (String) session.getAttribute("maND");
	    if (maND == null) {
	    	request.setAttribute("errMsg", "Phải đăng nhập trước khi sử dụng");
	        RequestDispatcher dispatcher = request.getRequestDispatcher("../DangNhap.jsp");
	        dispatcher.forward(request, response);
	    }
	%>
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <jsp:include page="./Sidebar_SinhVien.jsp" />
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Navigation -->
                    <jsp:include page="./Topbar_SinhVien.jsp" />

                </nav>  

                <!-- Your Slide bar and main content goes here -->
				<div class="container">
			        <div class="rectangle">
				      <p>Trang web dịch vụ sinh viên</p>
				    </div>
				
				    <div class="rectangle">
				      <p>Trang web phục vụ cho quản lý</p>
				    </div>
				    <div class="rectangle">
				      <p>Trang web phục vụ cho ctsv</p>
				    </div>
				    <div class="rectangle">
				      <p>Trang web phục vụ cho sinh viên</p>
				    </div>
			    </div>
				
            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
    			<jsp:include page="../footer.jsp" />
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    <!-- Bootstrap core JavaScript-->
    <jsp:include page="../Scripts.jsp" />
</body>
</html>