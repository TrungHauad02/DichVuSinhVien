<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="Models.QuanLy"%>
<%@ page import="DAO.QuanLyDAO"%>
<%@ page import="DAO.TaiKhoanDao"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Thông tin cá nhân</title>

<!-- Custom fonts for this template-->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="https://storage.googleapis.com/nguyenphat/css/sb-admin-2.css"
	rel="stylesheet">
<link
	href="https://storage.googleapis.com/nguyenphat/css/sb-admin-2.min.css"
	rel="stylesheet">
<link href="https://storage.googleapis.com/nguyenphat/css/styles.css"
	rel="stylesheet">
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
		<jsp:include page="./sidebar_admin.jsp" />
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="./topbar_admin.jsp" />
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-4 text-gray-800">Profile</h1>

					<div class="row">

						<!-- Area Chart -->
						<div class="col-xl-7 col-lg-7">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">Thông tin cá
										nhân</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class=" row">
										<!-- Hiển thị thông tin từ đối tượng quanly -->
										<div class="col-xl-5 col-lg-4 col-md-6 col-sm-6"
											style="text-align: left; width: 50%;">Mã số admin:</div>
										<div class="col-xl-7 col-lg-8 col-md-6 col-sm-6"
											style="text-align: left; width: 50%;">${quanly.ID_QuanLy}
										</div>
										<div style="margin-top: 40px;"></div>
										<div class="col-xl-5 col-lg-4 col-md-6 col-sm-6"
											style="text-align: left; width: 50%;">Họ tên:</div>
										<div class="col-xl-7 col-lg-8 col-md-6 col-sm-6"
											style="text-align: left; width: 50%;">${quanly.getHoTen()}</div>
										<div style="margin-top: 40px;"></div>
										<div class="col-xl-5 col-lg-4 col-md-6 col-sm-6"
											style="text-align: left; width: 50%;">Ngày sinh:</div>
										<div class="col-xl-7 col-lg-8 col-md-6 col-sm-6"
											style="text-align: left; width: 50%;">${quanly.getNgaySinh()}</div>
										<div style="margin-top: 40px;"></div>
										<div class="col-xl-5 col-lg-4 col-md-6 col-sm-6"
											style="text-align: left; width: 50%;">Giới tính:</div>
										<div class="col-xl-7 col-lg-8 col-md-6 col-sm-6"
											style="text-align: left; width: 50%;">${quanly.getGioiTinh()}</div>
										<div style="margin-top: 40px;"></div>
										<div class="col-xl-5 col-lg-4 col-md-6 col-sm-6"
											style="text-align: left; width: 50%;">CCCD:</div>
										<div class="col-xl-7 col-lg-8 col-md-6 col-sm-6"
											style="text-align: left; width: 50%;">${quanly.getCCCD()}</div>
										<div style="margin-top: 40px;"></div>
										<div class="col-xl-5 col-lg-4 col-md-6 col-sm-6"
											style="text-align: left; width: 50%;">SDT:</div>
										<div class="col-xl-7 col-lg-8 col-md-6 col-sm-6"
											style="text-align: left; width: 50%;">${quanly.getSDT()}</div>
										<div style="margin-top: 40px;"></div>
										<div class="col-xl-5 col-lg-4 col-md-6 col-sm-6"
											style="text-align: left; width: 50%;">Email:</div>
										<div class="col-xl-7 col-lg-8 col-md-6 col-sm-6"
											style="text-align: left; width: 50%;">${quanly.getEmail()}</div>
										<!-- và các thuộc tính khác -->
									</div>

								</div>
							</div>
						</div>
						<div class="col-xl-5 col-lg-5">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">Admin</h6>

								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div style="display: flex; justify-content: center;">
										<img src="anhnen.png" width="130" height="160">
									</div>
									<div style="margin-top: 15px;"></div>
									<div style="display: flex; justify-content: center;">
										<div class="my-2"></div>
										<a href="updateadmin?id=${quanly.ID_QuanLy}"
											class="btn btn-primary btn-icon-split"> <span
											class="text">Cập nhật thông tin</span>
										</a>
									</div>
									<div style="margin-top: 15px;"></div>
									<div style="display: flex; justify-content: center;">
										<div class="my-2"></div>
										<a href="DoiMatKhau" class="btn btn-primary btn-icon-split"> <span
											class="text">Đổi mật khẩu</span>
										</a>
									</div>

								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2023</span>
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

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>


	<!-- Bootstrap core JavaScript-->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>
	<script src="https://cdn.lordicon.com/lordicon.js"></script>

</body>

</html>