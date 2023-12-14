<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Quản lý lớp học</title>

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
<%
	    String maND = (String) session.getAttribute("maND");
	    if (maND == null) {
	    	request.setAttribute("errMsg", "Phải đăng nhập trước khi sử dụng");
	        RequestDispatcher dispatcher = request.getRequestDispatcher("../DangNhap.jsp");
	        dispatcher.forward(request, response);
	    }
	%>
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
					<h1 class="h3 mb-2 text-gray-800">Quản lý lớp học</h1>
					<!-- DataTales Example -->
					<div class="row">
						<div class="ccol-xl-6 col-lg-6 col-md-12 col-sm-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">Thông tin
										lớp học</h6>
								</div>
								<div class="card-body">
									<div style="margin-top: 20px;"></div>
									<div class="table-responsive">
										<table class="table table-bordered" id=" dataTable"
											width="100%" cellspacing="0"">
											<thead>
												<tr>
													<th>Mã lớp</th>
													<th>Môn học</th>
													<th>Tên lớp học</th>
													<th>Tín chỉ</th>
													<th>Actions</th>
												</tr>
											</thead>
											<tbody>
												<!--   for (Todo todo: todos) {  -->
												<c:forEach var="lophoc" items="${lopHocList}">

													<tr>
														<td><c:out value="${lophoc.ID_LopHoc}" /></td>
														<td><c:out value="${lophoc.getMonHoc()}" /></td>
														<td><c:out value="${lophoc.getTenLopHoc()}" /></td>
														<td><c:out value="${lophoc.getTinChi()}" /></td>

														<td><a
															href="deletelophoc?id=<c:out value='${lophoc.ID_LopHoc}' />">Delete</a></td>
													</tr>
												</c:forEach>

											</tbody>

										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12">
							<form action="quanlylophoc" method="post">
								<table class="table">
									<thead>
									</thead>
									<tbody>
										<tr>
											<td><label for="tenMH" class="h5">Môn học:</label></td>
											<td><input type="text" id="tenMH" name="monHoc"
												class="form-control"></td>
										</tr>
										<tr>
											<td><label for="tenMH" class="h5">Tên lớp học</label></td>
											<td><input type="text" id="tenMH" name="tenLop"
												class="form-control"></td>
										</tr>
										<tr>
											<td><label for="tin" class="h5">Tín chỉ:</label></td>
											<td><input type="text" id="tin" name="tinChi"
												class="form-control"></td>
										</tr>

									</tbody>
								</table>
								<div class="text-center mt-3">
									<button class="btn btn-primary mr-3">Thêm lớp học</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->

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