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

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="https://storage.googleapis.com/nguyenphat/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="https://storage.googleapis.com/nguyenphat/css/styles.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        
                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <h1>Bảng điểm</h1>
					<div class = "row">
						<div class = "col-md-4">
						    <table id="TBLop" class="table table-bordered">
						      <thead>
						        <tr>
						          <th>Mã lớp</th>
						          <th>Lớp học</th>
						          <th>Tín chỉ</th>
						        </tr>
						      </thead>
						      <tbody>
						        <c:forEach var="lopHoc" items="${danhSachLopHoc}">
						        	<tr>
							 			<td> ${lopHoc.getID_LopHoc()}</td>
							 			<td> ${lopHoc.getMonHoc()}</td>
							 			<td> ${lopHoc.getTinChi()}</td>
						            </tr>
						        </c:forEach>
						      </tbody>
						    </table>
						</div>
						<div class = "md-col-4">
						    <table id="TBDiem" class="table table-bordered">
						      <thead>
						        <tr>
						          <th>MSSV</th>
						          <th>Điểm quá trình</th>
						          <th>Điểm cuối kỳ</th>
						        </tr>
						      </thead>
						      <tbody>
						        <c:forEach var="sv" items="${DSSinhVienLop}">
						        	<tr>
							 			<td> ${sv.getID_SinhVien()}</td>
							 			<td> ${sv.getDiemQuaTrinh()}</td>
							 			<td> ${sv.getDiemCuoiKy()}</td>
						            </tr>
						        </c:forEach>
						      </tbody>
						    </table>
						</div>
						<script>
						document.getElementById("TBLop").querySelectorAll("tr").forEach(function(tr) {
						  tr.addEventListener("mouseover", function() {
						    tr.style.backgroundColor = "yellow";
						  });
						
						  tr.addEventListener("mouseout", function() {
						    tr.style.backgroundColor = "";
						  });
						  tr.addEventListener("click", function() {
							  const lopHocId = tr.querySelector("td:first-child").textContent.trim();
							  const ctsvId = ${ctsvId}
							  window.location.href = "/DichVuSinhVien/ThemDiem?ctsvId=" + ctsvId + "&lophoc=" + lopHocId;
							  });
						});
						
						</script>

						<div class = "md-col-4">
								
								<label for="lophoc">Lớp học</label>
						        <label id="lopHocId" for="lophoc" class="form-control">${lopHoc}</label>
							    <label for="mssv">MSSV</label>
						        <label for ="mssv" id="mssvId" class="form-control"></label>
						        <label for="diemQT">Điểm quá trình</label>
						        <input for = "diemQT" class = "form-control" placeholder = "DiemQuaTrinh" id="diemQT">
						        <label for="diemCK">Điểm cuối kỳ</label>
						        <input for = "diemCK" class = "form-control" placeholder = "DiemCuoiKy" id="diemCK">
						        
						    <button type="button" id="btn-excel">Xuất Excel</button>
						
						    <button type="button" id="btn-luudiem">Lưu điểm</button>
		                <!-- /.container-fluid -->
		                </div>
				</div>
            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
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

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
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

	<script>
	document.getElementById("TBDiem").querySelectorAll("tr").forEach(function(tr) {
		  tr.addEventListener("mouseover", function() {
		    tr.style.backgroundColor = "yellow";
		  });
		
		  tr.addEventListener("mouseout", function() {
		    tr.style.backgroundColor = "";
		  });
		  tr.addEventListener("click", function() {
			  const sinhVienId = tr.querySelector("td:first-child").textContent.trim();
			  const diemQT = tr.querySelector("td:nth-child(2)").textContent.trim();
			  const diemCK = tr.querySelector("td:nth-child(3)").textContent.trim();
			  const lopHocId = ${lopHoc}
			  
			  
            document.getElementById("mssvId").textContent = sinhVienId;
            document.getElementById("lopHocId").textContent = lopHocId;
            document.getElementById("diemQT").value = diemQT;
            document.getElementById("diemCK").value = diemCK;
		  })
		});
	
	
	$("#btn-luudiem").on("click", function(){
		const diemQTValue = $("#diemQT").val();
	    const diemCKValue = $("#diemCK").val();
	    const mssvValue = $("#mssvId").text(); 
	    const lopHocValue = $("#lopHocId").text();
	    const ctsvId = ${ctsvId}
	    $.ajax({
	        url: "/DichVuSinhVien/ThemDiem",
	        method: "POST",
	        contentType: "application/json; charset=utf-8",
	        data: JSON.stringify({
	            diemQT: diemQTValue,
	            diemCK: diemCKValue,
	            mssv: mssvValue,
	            lopHoc: lopHocValue
	            // Add more data properties as needed
	        }),
	        success: function (data) {
	        	 window.location.href = "/DichVuSinhVien/ThemDiem?ctsvId=" + ctsvId + "&lophoc=" + lopHocValue;
	        },
	        error: function () {
	            console.log("Error saving data");
	        }
	    });
	})
	</script>
</body>
</html>