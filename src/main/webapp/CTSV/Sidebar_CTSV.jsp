<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
			<!-- Sidebar - Brand -->
	        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="../index.jsp">
	            <div >
	                <img src="../assets/Logo.png"  alt="Logo HCMUTE" class ="mh-100 mw-100">
	            </div>
	            <div class="sidebar-brand-text mx-3 h4">HCMUTE</div>
	        </a>
        	<li class="nav-item active mt-5">
                <a class="nav-link" href="/DichVuSinhVien/ThongTin_CTSV/${ctsvId}">
                    <span >Thông tin cá nhân</span></a>
            </li>
            <hr class="sidebar-divider my-0">
            <li class="nav-item active mt-2">
                <a class="nav-link" href="/DichVuSinhVien/ThemDiem?ctsvId=${ctsvId}">
                    <span >Thêm điểm</span></a>
            </li>
            <hr class="sidebar-divider my-0">
            <li class="nav-item active mt-2">
                <a class="nav-link" href="/DichVuSinhVien/ThemSinhVien?ctsvId=${ctsvId}">
                    <span >Thêm sinh viên vào lớp</span></a>
            </li>
            <hr class="sidebar-divider my-0">
            <li class="nav-item active mt-2">
                <a class="nav-link" href="/DichVuSinhVien/xu-ly-yeu-cau?ctsvId=${ctsvId}">
                    <span >Xử lý yêu cầu</span></a>
            </li>
            <hr class="sidebar-divider my-0">
            <li class="nav-item active mt-2">
                <a class="nav-link" href="PhanHoi_CTSV.jsp">
                    <span >Phản hồi</span></a>
            </li>
            <hr class="sidebar-divider my-0">
            
        </ul>
</body>
</html>