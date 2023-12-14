<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">

<head>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Đăng nhập</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Đăng nhập</title>
    <jsp:include page="./head.jsp"/>
</head>
<body id="page-top">

	<%
	String user = (String) session.getAttribute("maND");
	if (user != null) {
		String phanQuyen = (String) session.getAttribute("phanQuyen");
		if (phanQuyen.equals("quanly"))
			response.sendRedirect("Admin/index_Admin.jsp");
		else if (phanQuyen.equals("ctsv"))
			response.sendRedirect("CTSV/index_CTSV.jsp");
		else
			response.sendRedirect("SinhVien/index_SinhVien.jsp");
	}
	%>

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">
			<!-- Sidebar - Brand -->

			<a class="sidebar-brand d-flex align-items-center justify-content-center"
				href="./index.jsp">
				<div>
					<img src="./assets/Logo.png" alt="Logo HCMUTE"
						class="mh-100 mw-100">
				</div>
				<div class="sidebar-brand-text mx-3">HCMUTE</div>
			</a>
			<li class="nav-item active mt-5"><a class="nav-link"
				href="index.jsp"> <i class="fas fa-fw fa-tachometer-alt"></i> <span>Giới
						thiệu chung</span></a></li>
		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Navigation -->
					<ul class="navbar-nav" style="width: 100%;">

						<li class="nav-item"><a class="nav-link text-gray-900 medium"
							href="#">Trang Chủ</a></li>
						<li class="nav-item"><a class="nav-link text-gray-900 medium"
							href="#">Hỗ Trợ</a></li>
						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow ml-auto"><a
							class="nav-link dropdown-toggle" href="DangNhap.jsp"> <span
								class="mr-4 d-none d-lg-inline text-gray-900 medium">Đăng
									Nhập</span> <lord-icon src="https://cdn.lordicon.com/kthelypq.json"
									trigger="hover" style="width:50px;height:50px"> </lord-icon>
						</a></li>
					</ul>

				</nav>

				<!-- Your Slide bar and main content goes here -->

				<div class="container">
					<div class="row h-100 justify-content-center align-items-center">
						<form action="<%=request.getContextPath()%>/dangNhap"
							method="post">
							<table class="table mw-80">
								<tbody>
									<tr>
										<td><label for="username"
											class="h4 justify-content-center">Tài khoản:</label></td>
										<td><input type="text" id="username" name="username"
											class="form-control"></td>
									</tr>
									<tr>
										<td><label for="password"
											class="h4 justify-content-center">Mật khẩu:</label></td>
										<td><input type="password" id="password" name="password"
											class="form-control"></td>
									</tr>
									<%
									if (request.getAttribute("errMsg") != null) {
									%>
									<tr>
										<td colspan=2>
											<p class="text-danger"><%=request.getAttribute("errMsg")%></p>
										</td>
									</tr>
									<%
									}
									%>
									<tr>
										<td><button class="btn btn-primary"
												onclick="window.location.href='QuenMatKhau.jsp'">Quên
												mật khẩu</button></td>
										<td><button type="submit" class="btn btn-primary">Đăng
												nhập</button></td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Trang web của nhóm 12</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/chart-area-demo.js"></script>
	<script src="js/demo/chart-pie-demo.js"></script>
	<script src="https://cdn.lordicon.com/lordicon.js"></script>
	        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
	            <div >
	                <img src="./assets/Logo.png"  alt="Logo HCMUTE" class ="mh-100 mw-100">
	            </div>
	            <div class="sidebar-brand-text mx-3">HCMUTE</div>
	        </a>
        	<li class="nav-item active mt-5">
                <a class="nav-link" href="index.jsp">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span >Giới thiệu chung</span></a>
            </li>
        </ul>
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
                    <ul class="navbar-nav" style="width: 100%;">
                    
                    	<li class ="nav-item">
							<a class ="nav-link text-gray-900 medium" href="#">Trang Chủ</a>
						</li>
						<li class ="nav-item">
							<a class ="nav-link text-gray-900 medium" href="#">Hỗ Trợ</a>
						</li>
                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow ml-auto">
                            <a class="nav-link dropdown-toggle" href="#">
                                <span class="mr-4 d-none d-lg-inline text-gray-900 medium">Đăng Nhập</span>
								<lord-icon
								    src="https://cdn.lordicon.com/kthelypq.json"
								    trigger="hover"
								    style="width:50px;height:50px">
								</lord-icon>
                            </a>
                        </li>
                    </ul>

                </nav>  

                <!-- Your Slide bar and main content goes here -->
				
				<div class="container">
				    <div class="row h-100 justify-content-center align-items-center">
				    	<form action="<%=request.getContextPath()%>/dangNhap" method="post">
				            <table class="table">
				                <tbody>
				                    <tr>
				                        <td><label for="username" class="h4 justify-content-center">Tài khoản:</label></td>
				                        <td><input type="text" id="username" name="username" class="form-control"></td>
				                    </tr>
				                    <tr>
				                        <td><label for="password" class="h4 justify-content-center">Mật khẩu:</label></td>
				                        <td><input type="password" id="password" name="password" class="form-control"></td>
				                    </tr>
				                    <% if (request.getAttribute("errMsg") != null) { %>
				                    <tr>
				                    	<td colspan=2>
						                    <p class="text-danger"><%= request.getAttribute("errMsg") %></p>											
										</td>
									</tr>
									<% } %>
				                    <tr>
				                        <td><button class="btn btn-primary common-btn"  onclick="window.location.href='QuenMatKhau.jsp'">Quên mật khẩu</button></td>
				                        <td><button type="submit" class="btn btn-primary ">Đăng nhập</button></td>
				                    </tr>
				                </tbody>
				            </table>
				     	</form>
				     </div>
				  </div>
	            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Trang web của nhóm 12</span>
                    </div>
                </div>	
            </footer>
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
    <jsp:include page="./Scripts.jsp" />

</body>
</html>