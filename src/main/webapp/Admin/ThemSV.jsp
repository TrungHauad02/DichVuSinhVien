<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Thêm sinh viên</title>

<!-- Custom fonts for this template-->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<link href="../css/styles.css" rel="stylesheet">
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="index_Admin.jsp">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">Dịch vụ sinh viên</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item"><a class="nav-link" href="index_Admin.jsp">
					<i class="fas fa-home"></i> <span>Trang chủ</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Dịch vụ</div>
			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-wrench"></i> <span>Quản lý</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Các loại quản lý:</h6>
						<a class="collapse-item" href="QuanLySinhVien_Admin_CTSV.jsp">Quản lý
							sinh viên</a> <a class="collapse-item" href="QuanLyCTSV_Admin.jsp">Quản
							lý CTSV</a> <a class="collapse-item" href="QuanLyKhoa_Admin.jsp">Quản
							lý khoa</a> <a class="collapse-item" href="QuanLyHoatDong_Admin.jsp">Quản
							lý hoạt động</a> <a class="collapse-item" href="QuanLyHocBong_Admin.jsp">Quản
							lý học bổng</a>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Divider -->
			<li class="nav-item"><a class="nav-link" href="ThongTin_Admin.jsp">
					<i class="fas fa-fw fa-user"></i> <span>Thông tin cá nhân</span>
			</a></li>
			<hr class="sidebar-divider">
			<li class="nav-item"><a class="nav-link" href="HoTroAdmin.jsp">
					<i class='fas fa-fw fa-headset'></i> <span>Hỗ trợ</span>
			</a></li>
			<hr class="sidebar-divider d-none d-md-block">
			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

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

					
					<ul class="navbar-nav mr-auto ml-md-3 my-2 my-md-0 mw-100 ml-auto">
						<a class="nav-link" href="index.html">
							<div>
								<span class="high">Trang chủ</span>
							</div>

						</a>
						<div class="topbar-divider d-none d-sm-block"></div>
						<div>
							<a class="nav-link" href="HoTroAdmin.jsp"> <span class="high">Hỗ
									trợ</span>
						</div>
						</a>
					</ul>
					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">Admin</span>
								<img class="img-profile rounded-circle"
								src="img/undraw_profile.svg">
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
									Settings
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
									Activity Log
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Your Slide bar and main content goes here -->
				<div class="container">
					<div class="row">
						<!-- Bảng Thông tin cá nhân -->
						<div class="col-lg-6">
							<table class="table">
								<thead>
									<tr>
										<th colspan="2" class="h3">Thông tin cá nhân</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><label for="mssv" class="h4">MSSV:</label></td>
										<td><input type="text" id="mssv" class="form-control"></td>
									</tr>
									<tr>
										<td><label for="name" class="h4">Họ tên:</label></td>
										<td><input type="text" id="name" class="form-control"></td>
									</tr>
									<tr>
										<td><label for="dob" class="h4">Ngày sinh:</label></td>
										<td><input type="date" id="dob" class="form-control"></td>
									</tr>
									<tr>
										<td><label class="h4">Giới tính:</label></td>
										<td>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="gender"
													id="male" value="male"> <label
													class="form-check-label h4" for="male"> Nam </label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="gender"
													id="female" value="female"> <label
													class="form-check-label h4" for="female"> Nữ </label>
											</div>
										</td>
									</tr>
									<tr>
										<td><label for="cccd" class="h4">CCCD:</label></td>
										<td><input type="text" id="cccd" class="form-control"></td>
									</tr>
									<tr>
										<td><label for="faculty" class="h4">Khoa:</label></td>
										<td><input type="text" id="faculty" class="form-control"></td>
									</tr>
									<tr>
										<td><label for="course" class="h4">Khóa học:</label></td>
										<td><input type="text" id="course" class="form-control"></td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- Bảng Thông tin liên hệ -->
						<div class="col-lg-4">
							<table class="table">
								<thead>
									<tr>
										<th colspan="2" class="h3">Thông tin liên hệ</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><label for="contact-name" class="h4">Họ tên:</label></td>
										<td><input type="text" id="contact-name"
											class="form-control"></td>
									</tr>
									<tr>
										<td><label for="phone" class="h4">SDT:</label></td>
										<td><input type="tel" id="phone" class="form-control"></td>
									</tr>
									<tr>
										<td><label for="email" class="h4">Email:</label></td>
										<td><input type="email" id="email" class="form-control"></td>
									</tr>
									<tr>
										<td><label for="address" class="h4">Địa chỉ:</label></td>
										<td><input type="text" id="address" class="form-control"></td>
									</tr>
								</tbody>
							</table>
							<!-- Nút Đổi mật khẩu và Cập nhật thông tin -->
							<div class="text-center mt-3">
								<button class="btn btn-primary mr-3">Thêm sinh viên</button>
							</div>
						</div>


						<!-- Hình ảnh -->
						<div class="col-lg-2 d-flex justify-content-center">
							<img src="đường dẫn đến hình ảnh của bạn" alt="Hình ảnh">
						</div>
					</div>
				</div>


				<!-- End of Main Content -->

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