<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="Models.SinhVien"%>
<%@ page import="DAO.TaiKhoanDao"%>
<%@ page import="java.util.Base64"%>

<!DOCTYPE html>
<html lang="vi">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Navigation -->
					<jsp:include page="./Topbar_SinhVien.jsp" />

				</nav>

				<!-- Your Slide bar and main content goes here -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-4 text-gray-800">Hỗ trợ</h1>
					<div>
						<label class="h5">Bạn gặp các vấn đề khi sử dụng ứng dụng?</label>
					</div>
					<div>
						<label> <i class="fa fa-arrow-right"></i> <label
							class="h6">Liên hệ chúng tôi theo SDT: 19093123</label>
						</label>
					</div>
					<div style="margin-top: 20px;"></div>
					<div>
						<label> <label class="h5">Bạn muốn thay đổi mật
								khẩu?</label>
						</label>
					</div>
					<div>
						<label> <i class="fa fa-arrow-right"></i> <label>
								Click vào: <a target="_blank" href="DoiMatKhau">Đổi mật khẩu</a>
						</label>
						</label>
					</div>
					<div style="margin-top: 20px;"></div>
					<div>
						<div>
							<div class="my-2"></div>
							<a href="chinhsach" class="btn btn-primary btn-icon-split"> <span
								class="text">Chính sách</span>
							</a>
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
	                        url: "<%=request.getContextPath()%>/CapNhatSinhVien",
	                        data: data,
	                        success: function (response) {
	                            console.log(response);
	                            window.location.href = '<%=request.getContextPath()%>/ThongTinSinhVien';
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
	                    url: "<%=request.getContextPath()%>/CapNhatSinhVien",
	                    data: data,
	                    success: function (response) {
	                        console.log(response);
	                        window.location.href = '<%=request.getContextPath()%>
			/ThongTinSinhVien';
																	},
																	error : function(
																			error) {
																		console
																				.log(error);
																	}
																});
													}
												});

								cancelButton
										.on(
												'click',
												function() {
													$('input')
															.not(
																	'#mssv, #ctxh-score, #faculty, #course, #rl-score, #contact-name')
															.attr('readonly',
																	true);
													updateButton.show();
													confirmButton.hide();
													cancelButton.hide();
													$('#selectImage').hide();
												});
							});
		</script>
</body>
</html>