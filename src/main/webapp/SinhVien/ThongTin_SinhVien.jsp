<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Models.SinhVien" %>.
<!DOCTYPE html>
<html lang="vi">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
     <%-- <jsp:include page="../head.jsp" /> --%>
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
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
			<!-- Sidebar - Brand -->
	        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="../index_SinhVien.jsp">
	            <div >
	                <img src="../assets/Logo.png"  alt="Logo HCMUTE" class ="mh-100 mw-100">
	            </div>
	            <div class="sidebar-brand-text mx-3 h4">HCMUTE</div>
	        </a>
        	<li class="nav-item active mt-5">
                <a class="nav-link" href="ThongTin_SinhVien.jsp">
                    <span >Thông tin cá nhân</span></a>
            </li>
            <hr class="sidebar-divider my-0">
            <li class="nav-item active mt-2">
                <a class="nav-link" href="BangDiem_SinhVien.jsp">
                    <span >Bảng điểm</span></a>
            </li>
            <hr class="sidebar-divider my-0">
            <li class="nav-item active mt-2">
                <a class="nav-link" href="GiayXacNhan_SinhVien.jsp">
                    <span >Giấy xác nhận</span></a>
            </li>
            <hr class="sidebar-divider my-0">
            <li class="nav-item active mt-2">
                <a class="nav-link" href="GiayVayVon_SinhVien.jsp">
                    <span >Giấy vay vốn</span></a>
            </li>
            <hr class="sidebar-divider my-0">
            <li class="nav-item active mt-2">
                <a class="nav-link" href="DangKyHoatDong_SinhVien.jsp">
                    <span >Đăng ký hoạt động</span></a>
            </li>
            <hr class="sidebar-divider my-0">
            <li class="nav-item active mt-2">
                <a class="nav-link" href="DangKyHocBong_SinhVien.jsp">
                    <span >Đăng ký học bổng</span></a>
            </li>
            <hr class="sidebar-divider my-0">
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
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-4 d-none d-lg-inline text-gray-900 medium">Trung Hậu</span>
								<lord-icon
								    src="https://cdn.lordicon.com/kthelypq.json"
								    trigger="hover"
								    style="width:50px;height:50px">
								</lord-icon>
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="ThongTin_SinhVien.jsp">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Thông tin cá nhân
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="../DangNhap.jsp" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Đăng xuất
                                </a>
                            </div>
                        </li>
                    </ul>

                </nav>  

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
						                <td><input type="text" id="mssv" class="form-control" value="${sinhvien.ID_SinhVien}" readonly></td>
						            </tr>
						            <tr>
						                <td><label for="name" class="h4">Họ tên:</label></td>
						                <td><input type="text" id="name" class="form-control" value="${sinhvien.getHoTen()}" readonly></td>
						            </tr>
						            <tr>
						                <td><label for="dob" class="h4">Ngày sinh:</label></td>
						                <td><input type="date" id="dob" class="form-control" value="${sinhvien.getNgaySinh()}" readonly></td>
						            </tr>
						            <tr>
						                <td><label class="h4">Giới tính:</label></td>
						                <td>
						                    <div class="form-check form-check-inline">
						                        <input class="form-check-input" type="radio" name="gender" id="male" value="male" ${sinhvien.getGioiTinh() == 1 ? 'checked' : ''} readonly>
						                        <label class="form-check-label h4" for="male">
						                            Nam
						                        </label>
						                    </div>
						                    <div class="form-check form-check-inline">
						                        <input class="form-check-input" type="radio" name="gender" id="female" value="female" ${sinhvien.getGioiTinh() == 0 ? 'checked' : ''} readonly>
						                        <label class="form-check-label h4" for="female">
						                            Nữ
						                        </label>
						                    </div>
						                </td>
						            </tr>
						            <tr>
						                <td><label for="cccd" class="h4">CCCD:</label></td>
						                <td><input type="text" id="cccd" class="form-control" value="${sinhvien.getCCCD()}" readonly></td>
						            </tr>
						            <tr>
						                <td><label for="faculty" class="h4">Khoa:</label></td>
						                <td><input type="text" id="faculty" class="form-control" value="${sinhvien.getKhoa()}" readonly></td>
						            </tr>
						            <tr>
						                <td><label for="course" class="h4">Khóa học:</label></td>
						                <td><input type="text" id="course" class="form-control" value="${sinhvien.getNamHoc()}" readonly></td>
						            </tr>
						            <tr>
						                <td><label for="rl-score" class="h4">Điểm RL:</label></td>
						                <td><input type="text" id="rl-score" class="form-control" value="${sinhvien.getDiemRL()}" readonly></td>
						            </tr>
						            <tr>
						                <td><label for="ctxh-score" class="h4">Điểm CTXH:</label></td>
						                <td><input type="text" id="ctxh-score" class="form-control" value="${sinhvien.getDiemCTXH()}"readonly></td>
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
						                <td><input type="text" id="contact-name" class="form-control" value="${sinhvien.getHoTen()}" readonly></td>
						            </tr>
						            <tr>
						                <td><label for="phone" class="h4">SDT:</label></td>
						                <td><input type="tel" id="phone" class="form-control" value="${sinhvien.getSDT()}" readonly></td>
						            </tr>
						            <tr>
						                <td><label for="email" class="h4">Email:</label></td>
						                <td><input type="email" id="email" class="form-control" value="${sinhvien.getEmail()}" readonly></td>
						            </tr>
						            <tr>
						                <td><label for="address" class="h4">Địa chỉ:</label></td>
						                <td><input type="text" id="address" class="form-control" value="${sinhvien.getDiaChi()}" readonly></td>
						            </tr>
						        </tbody>
						    </table>
						    <!-- Nút Đổi mật khẩu và Cập nhật thông tin -->
						    <div class="text-center mt-3">
						        <button class="btn btn-primary mr-3">Đổi mật khẩu</button>
						        <button id="update-button" class="btn btn-primary ml-3">Cập nhật thông tin</button>
						        <button id="confirm-button" class="btn btn-success ml-3" style="display: none;">Xác nhận</button>
								<button id="cancel-button" class="btn btn-danger ml-3" style="display: none;">Hủy</button>
						    </div>
						</div>
						
						<!-- Hình ảnh -->
						<div class="col-lg-2 d-flex flex-column justify-content-center">
				            <div class="mb-3 text-center" style="height: 200px;"><img id="image" src="https://www.google.com/url?sa=i&url=https%3A%2F%2Fcommunity.atlassian.com%2Ft5%2FConfluence-questions%2FJIRA-macro-in-Confluence-filter-null%2Fqaq-p%2F459510&psig=AOvVaw0eHjxhflOKkqifXxdvIqMb&ust=1702293454249000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCLCY37ffhIMDFQAAAAAdAAAAABAD"
				             alt="Hình ảnh" class="img-fluid mx-auto d-block mw-100 mh-100"></div>
				            <div class="text-center"><input type="file" id="selectImage" accept="image/*"></div>
				        </div>
						
				</div>
			</div>


            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
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
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="../vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="../js/demo/chart-area-demo.js"></script>
    <script src="../js/demo/chart-pie-demo.js"></script>
	<script src="https://cdn.lordicon.com/lordicon.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		document.getElementById('selectImage').addEventListener('change', function(event) {
	        var files = event.target.files;
	        if (files && files.length > 0) {
	            var reader = new FileReader();
	            reader.onload = function() {
	                var dataURL = reader.result;
	                if (dataURL != null) {
	                    document.getElementById('image').src = dataURL;
	                }
	            };
	            reader.readAsDataURL(files[0]);
	        } else {
	            console.error("No files selected or FileReader not supported.");
	        }
	    });
	</script>
	<script>
		$(document).ready(function () {
	        var updateButton = $('#update-button');
	        var confirmButton = $('#confirm-button');
	        var cancelButton = $('#cancel-button');
	
	        updateButton.on('click', function () {
	            $('input').not('#mssv, #ctxh-score, #faculty, #course, #rl-score, #contact-name').removeAttr('readonly');
	            updateButton.hide();
	            confirmButton.show();
	            cancelButton.show();
	        });
	
	        confirmButton.on('click', function () {
            	$('input').not('#mssv, #ctxh-score, #faculty, #course, #rl-score, #contact-name').attr('readonly', true);
	            var data = {
	            	    mssv: $('#mssv').val(),
	            	    name: $('#name').val(),
	            	    dob: $('#dob').val(),
	            	    gender: $('input[name=gender]:checked').val(),
	            	    cccd: $('#cccd').val(),
	            	    phone: $('#phone').val(),
	            	    email: $('#email').val(),
	            	    address: $('#address').val()
	            	};
	            $.ajax({
	                type: "POST",
	                url: "<%= request.getContextPath() %>/CapNhatSinhVien",
	                data: data,
	                success: function (response) {
	                    console.log(response);
	                    window.location.href = '<%= request.getContextPath() %>/SinhVien/ThongTin_SinhVien.jsp';
	                },
	                error: function (error) {
	                    console.log(error);
	                }
	            });
	        });
	
	        cancelButton.on('click', function () {
	            $('input').not('#mssv, #ctxh-score, #faculty, #course, #rl-score, #contact-name').attr('readonly', true);
	            updateButton.show();
	            confirmButton.hide();
	            cancelButton.hide();
	        });
	    });

	</script>
	
</body>
</html>