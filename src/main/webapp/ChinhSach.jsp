<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Models.SinhVien" %>
<%@ page import="DAO.TaiKhoanDao" %>
<%@ page import="java.util.Base64" %>

<!DOCTYPE html>
<html lang="vi">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Thông tin sinh viên</title>

    <!-- Custom fonts for this template	-->
    <jsp:include page="../head.jsp" />
</head>
<body id="page-top">
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
					<div class="container-fluid">

					<!-- Page Heading -->
					<div style="display: flex; justify-content: center;">
						<h1 class="h3 mb-4 text-gray-800">Chính sách của chúng tôi</h1>
					</div>
					<hr class="sidebar-divider">
					<div>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
							aute irure dolor in reprehenderit in voluptate velit esse cillum
							dolore eu fugiat nulla pariatur. Excepteur sint occaecat
							cupidatat non proident, sunt in culpa qui officia deserunt mollit
							anim id est laborum.</p>
						<p>Faucibus a pellentesque sit amet porttitor eget dolor
							morbi. Risus nullam eget felis eget nunc lobortis mattis aliquam
							faucibus. Interdum consectetur libero id faucibus nisl tincidunt.
							Dignissim suspendisse in est ante. Scelerisque purus semper eget
							duis at tellus at urna condimentum. Tortor at auctor urna nunc id
							cursus. Sociis natoque penatibus et magnis dis parturient</p>
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
    
    <jsp:include page="../Scripts.jsp" />
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
	        console.log(updateButton);
	
	        updateButton.on('click', function () {
	            $('input').not('#mssv, #ctxh-score, #faculty, #course, #rl-score, #contact-name').removeAttr('readonly');
	            updateButton.hide();
	            confirmButton.show();
	            cancelButton.show();
	            $('#selectImage').show();
	        });
	
	        confirmButton.on('click', function () {
	            $('input').not('#mssv, #ctxh-score, #faculty, #course, #rl-score, #contact-name').attr('readonly', true);
	            var imageInput = document.getElementById('selectImage');

	            if (imageInput.files.length > 0) {
	                var reader = new FileReader();

	                reader.onload = function () {
	                    var dataURL = reader.result;

	                    var data = {
	                        mssv: $('#mssv').val(),
	                        name: $('#name').val(),
	                        dob: $('#dob').val(),
	                        gender: $('input[name=gender]:checked').val(),
	                        cccd: $('#cccd').val(),
	                        phone: $('#phone').val(),
	                        email: $('#email').val(),
	                        address: $('#address').val(),
	                        image: dataURL
	                    };

	                    $.ajax({
	                        type: "POST",
	                        url: "<%= request.getContextPath() %>/CapNhatSinhVien",
	                        data: data,
	                        success: function (response) {
	                            console.log(response);
	                            window.location.href = '<%= request.getContextPath() %>/ThongTinSinhVien';
	                        },
	                        error: function (error) {
	                            console.log(error);
	                        }
	                    });
	                };

	                reader.readAsDataURL(imageInput.files[0]);
	            } else {
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
	                        window.location.href = '<%= request.getContextPath() %>/ThongTinSinhVien';
	                    },
	                    error: function (error) {
	                        console.log(error);
	                    }
	                });
	            }
	        });

	
	        cancelButton.on('click', function () {
	            $('input').not('#mssv, #ctxh-score, #faculty, #course, #rl-score, #contact-name').attr('readonly', true);
	            updateButton.show();
	            confirmButton.hide();
	            cancelButton.hide();
	            $('#selectImage').hide();
	        });
	    });
	</script>
	
</body>
</html>