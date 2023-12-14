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

<title>Cập nhật admin</title>

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

				<!-- Your Slide bar and main content goes here -->
				<div class="container">
				<form action="updateadmin" method="post">
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
										<td><label for="mssv" class="h4">ID:</label></td>
										<td><input type="text" id="mssv" name="id" class="form-control" value="${quanly.ID_QuanLy}"></td>
									</tr>
									<tr>
										<td><label for="name" class="h4">Họ tên:</label></td>
										<td><input type="text" id="name" name="name" class="form-control" value="${quanly.getHoTen()}"></td>
									</tr>
									<tr>
										<td><label for="dob" class="h4">Ngày sinh:</label></td>
										<td><input type="date" id="dob" name="date" class="form-control" value="${quanly.getNgaySinh()}"></td>
									</tr>
									<tr>
										<td><label class="h4">Giới tính:</label></td>
										<td>
											<input type="text" id="dob" name="gender" class="form-control"
											value="${quanly.getGioiTinh()}">

										</td>
									</tr>
									<tr>
										<td><label for="cccd" class="h4">CCCD:</label></td>
										<td><input type="text" id="cccd" name="cccd" class="form-control" value="${quanly.getCCCD()}"></td>
									</tr>
									<tr>
										<td><label for="faculty" class="h4">SDT:</label></td>
										<td><input type="text" id="faculty" name="sdt" class="form-control" value="${quanly.getSDT()}"></td>
									</tr>
									<tr>
										<td><label for="course" class="h4">Email:</label></td>
										<td><input type="text" id="course" name="email" class="form-control" value="${quanly.getEmail()}"></td>
									</tr>
								</tbody>
							</table>
							<!-- Nút Đổi mật khẩu và Cập nhật thông tin -->
							<div class="text-center mt-3">
								<button class="btn btn-primary mr-3">Cập nhật Admin</button>
							</div>
							<div style="margin-top: 40px;"></div>
						</div>

						</form>

						<!-- Hình ảnh -->
						<div class="col-lg-3 " >
							<img src="https://storage.googleapis.com/nguyenphat/assets/anhnen.png" alt="Hình ảnh" width="330" height="380">
						</div>
					</div>
				</div>


				<!-- End of Main Content -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<jsp:include page="./footer_admin.jsp" />
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
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>
	<script src="https://cdn.lordicon.com/lordicon.js"></script>

</body>

</html>