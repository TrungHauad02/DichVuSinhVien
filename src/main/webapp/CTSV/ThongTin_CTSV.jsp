<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Thông tin công tác sinh viên</title>

    <!-- Custom fonts for this template-->
    <jsp:include page="../head.jsp" />
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
        <jsp:include page="./Sidebar_CTSV.jsp" />
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


                    <!-- Topbar Navbar -->
                    <jsp:include page="./Topbar_CTSV.jsp" />

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                
                    <h2>Thông tin cá nhân</h2>
                    <div class="row">
                    
                        <div class="col-md-6">
                            
					         <div class="form-group">
                                <label for="msctsv">MSCTSV</label>
                                <label for="msctsv" class="form-control">${ctsv.ID_CTSV}</label>
                            </div>
                            <div class="form-group">
                                <label for="ten">Họ Tên</label>
                                <label for="ten" class="form-control">${ctsv.getHoTen()}</label>
                            </div>
                            <div class="form-group">
                                <label for="ngaysinh">Ngày sinh</label>
                                <input type="date" class="form-control" id="ngaysinh" value="${ctsv.getNgaySinh()}">
                            </div>
                            <div class="form-group">
                                <label for="gioitinh">Giới tính</label>
                                <label for="gioitinh" class="form-control">${ctsv.getGioiTinh()}</label>
                            </div>
                            <div class="form-group">
                                <label for="cccd">CCCD</label>
                                <label for="cccd" class="form-control">${ctsv.getCCCD()}</label>
                            </div>
                            
                            
                        </div>
                        <div class="col-md-6">
                        	<div class="form-group">
                                <label for="sodienthoai">Số điện thoại</label>
                                <input type="" id="sdt"  class="form-control" value="${ctsv.getSDT()}">
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="text" id= "email" class="form-control" value="${ctsv.getEmail()}">
                            </div>
	                        <div class = "row">
	                        <div class="col-md-6">
	                            <button type="button" class="btn btn-success" id="updateButton">Cập nhật thông tin liên lạc</button>
	                        </div>
                            <div class="col-md-6">
	                            <button class="btn btn-primary mr-3" onclick="window.location.href='DoiMatKhau_CTSV.jsp'">Đổi mật khẩu</button>
	                        </div>
	                        </div>
                        </div>
                    </div>
                    
                    
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <jsp:include page="../footer.jsp" />
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

$("#updateButton").on("click", function(){
    const sdtValue = $("#sdt").val(); 
    const emailValue = $("#email").val();
	const url = "/DichVuSinhVien/ThongTin_CTSV/" + ${ctsv.ID_CTSV};
    $.ajax({
        url: url,
        method: "PUT",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify({
            sdt: sdtValue,
            email: emailValue,
        }),
        success: function (data) {
        	 window.location.href = url
        },
        error: function () {
            console.log("Error saving data");
        }
    });		
	})
	
$("#reset-password-button").on("click", function(){
    const sdtValue = $("#sdt").val(); 
	window.location.href = "/DichVuSinhVien/reset-password"
	})	
</script>
</body>
</html>