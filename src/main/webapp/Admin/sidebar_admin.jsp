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
	<ul
		class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
		id="accordionSidebar">

		<!-- Sidebar - Brand -->
		<a
			class="sidebar-brand d-flex align-items-center justify-content-center"
			href="admin">
			<div class="sidebar-brand-icon rotate-n-15">
				<i class="fas fa-laugh-wink"></i>
			</div>
			<div class="sidebar-brand-text mx-3">Dịch vụ sinh viên</div>
		</a>

		<!-- Divider -->
		<hr class="sidebar-divider my-0">

		<!-- Nav Item - Dashboard -->
		<li class="nav-item"><a class="nav-link" href="admin"> <i
				class="fas fa-home"></i> <span>Trang chủ</span>
		</a></li>

		<!-- Divider -->
		<hr class="sidebar-divider">
		<!-- Divider -->
		<li class="nav-item"><a class="nav-link" href="quanlysinhvien">
				<span>Quản lý sinh viên</span>
		</a></li>

		<!-- Divider -->
		<hr class="sidebar-divider">
		<!-- Divider -->
		<li class="nav-item"><a class="nav-link" href="quanlyctsv"> <span>Quản
					lý CTSV</span>
		</a></li>

		<!-- Divider -->
		<hr class="sidebar-divider">
		<!-- Divider -->
		<li class="nav-item"><a class="nav-link" href="quanlykhoa"><span>Quản
					lý khoa</span> </a></li>

		<!-- Divider -->
		<hr class="sidebar-divider">
		<!-- Divider -->
		<li class="nav-item"><a class="nav-link" href="quanlyhoatdong"><span>Quản
					lý hoạt động</span> </a></li>

		<!-- Divider -->
		<hr class="sidebar-divider">
		<!-- Divider -->
		<li class="nav-item"><a class="nav-link" href="quanlyhocbong">
				<i class="fas fa-fw fa-user"></i> <span>Quản lý học bổng</span>
		</a></li>

		<hr class="sidebar-divider">
		<li class="nav-item"><a class="nav-link" href="quanlylophoc">
				<i class='fas fa-fw fa-headset'></i> <span>Quản lý lớp học</span>
		</a></li>

		<hr class="sidebar-divider">
		<li class="nav-item"><a class="nav-link" href="hotro"> <i
				class='fas fa-fw fa-headset'></i> <span>Hỗ trợ</span>
		</a></li>

	</ul>


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