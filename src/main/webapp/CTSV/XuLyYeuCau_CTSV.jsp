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

    <title>Ứng dụng dịch vụ sinh viên</title>

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="https://storage.googleapis.com/nguyenphat/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="https://storage.googleapis.com/nguyenphat/css/styles.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<style>
	* Reset some default styles for better consistency */
	  body, h1, h2, h3, p, ul, li {
	    margin: 0;
	    padding: 0;
	  }
	
	  body {
	    font-family: 'Arial', sans-serif;
	    line-height: 1.6;
	    background-color: #f8f9fa;
	  }
	
	  /* Style for tables */
	  table {
	    width: 100%;
	    margin-bottom: 20px;
	    border-collapse: collapse;
	    background-color: #fff;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	  }
	
	  th, td {
	    padding: 10px;
	    text-align: center;
	    border: 1px solid #dee2e6;
	  }
	
	  th {
	    background-color: #007bff;
	    color: #fff;
	  }
	
	  /* Style for buttons */
	  button {
	    margin-top: 10px;
	    padding: 10px;
	    background-color: #007bff;
	    color: #fff;
	    border: none;
	    cursor: pointer;
	  }
	
	  /* Style for the container */
	  .container-fluid {
	    padding: 20px;
	  }
	
	  /* Style for the row */
	  .row {
	    display: flex;
	    flex-wrap: wrap;
	    justify-content: space-between;
	  }
	
	  /* Style for each column */
	  .col-md-4 {
	    flex-basis: calc(33.33% - 20px); /* Adjust the width as needed, considering margin */
	    margin-bottom: 20px;
	  }
	
	  /* Additional styling for select and input */
	  label {
	    margin-top: 10px;
	    display: block;
	    font-weight: bold;
	  }
	
	  select, input {
	    width: 100%;
	    padding: 10px;
	    margin-top: 5px;
	    margin-bottom: 15px;
	    box-sizing: border-box;
	    border: 1px solid #ced4da;
	    border-radius: 4px;
	    background-color: #fff;
	  }
	</style>
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
			<!-- Sidebar - Brand -->
	        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="../index.jsp">
	            <div >
	                <img src="data:image/png;base64,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"
	                  alt="Logo HCMUTE" class ="mh-100 mw-100">
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
                            <a class="nav-link dropdown-toggle" data-toggle="modal" data-target="#logoutModal" href="../DichVuSinhVien/index.jsp">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Đăng xuất</span>
                                <!-- <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg"> -->
                            </a>
                            <!-- Dropdown - User Information -->
                            <!-- <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
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
                            </div> -->
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <h1>Bảng yêu cầu</h1>

				    <div class="row">
				      <div class="col-md-8">
				        <table class="table" id = "TBYeuCau">
						  <thead>
						    <tr>
						      <th>Mã yêu cầu</th>
						      <th>MSSV</th>
						      <th>Dịch vụ</th>
						      <th>Thời gian phản hồi</th>
						      <th>Trạng thái</th>
						    </tr>
						  </thead>
						  <tbody>
						        <c:forEach var="lopHoc" items="${danhSachYeuCau}">
						        	<tr>
							 			<td> ${lopHoc.getID_YeuCau()}</td>
							 			<td> ${lopHoc.getID_SinhVien()}</td>
							 			<td> ${lopHoc.getTenDichVu()}</td>
							 			<td> ${lopHoc.getThoiGianGui()}</td>
							 			<td> ${lopHoc.getTrangThai()}</td>
							 			<td> <button class="acceptButton">Chấp nhận</button></td>
							 			<td> <button class="denyButton">Từ chối</button></td>
						            </tr>
						        </c:forEach>						  
						  </tbody>
						</table>
											
						
				      </div>
				      <!-- <div class="col-md-6">
					      <div class = "row">
						      <div class = "col-md-6">
						        <label for="loai-yeucau">Loại yêu cầu</label>
						        <select id="loai-yeucau" class="form-control">
						          <option value="Loại 1">Giấy xác nhận sinh viên</option>
						          <option value="Loại 2">Giấy vay vốn</option>
						          <option value="Loại 3">Đăng ký học bổng</option>
						          <option value="Loại 4">Đăng ký tham gia hoạt động</option>
						        </select>
						        </div>
					        <div class="col-md-6">
						        <label for="trang-thai">Trạng thái</label>
						        <select id="trang-thai" class="form-control">
						          <option value="Đang xử lý">Hoàn thành</option>
						          <option value="Đã xử lý">Từ chối</option>
						        </select>
					        </div>
				      	</div>
				      	<div class="row">
					      <div class="col-md-4">
					        <label for="mssv">MSSV</label>
					        <input type="text" id="mssv" class="form-control" placeholder="Nhập MSSV">
					      </div>
					
					      <div class="col-md-4">
					        <label for="ngay-phan-hoi">Ngày phản hồi</label>
					        <input type="date" id="ngay-phan-hoi" class="form-control">
					      </div>
					
					      <div class="col-md-4">
					        <label for="ten-yeucau">Tên yêu cầu</label>
					        <input type="text" id="ten-yeucau" class="form-control" placeholder="Nhập tên yêu cầu">
					      </div>
					    </div>
					    <div class = "row">
					    	<div class="col-md-12">
						        <label for="chi-phi">Chi phí</label>
						        <input type="number" id="chi-phi" class="form-control" placeholder="Nhập chi phí">
						      </div>
					    </div>
					    <div class="row">
						    <div class="col-md-8">
						        <label for="noi-dung">Nội dung</label>
						        <textarea id="noi-dung" class="form-control" placeholder="Nhập nội dung"></textarea>
						      </div>
						</div>
				
					    <div class="row">
					      <div class="col-md-12">
					        <button type="button" id="btn-xu-ly">Xử lý</button>
					      </div>
    			</div>
				       </div> -->
				      </div>
				    
    			</div>

            </div>
            <!-- End of Main Content -->

            
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
			document.getElementById("TBYeuCau").querySelectorAll("tr").forEach(function(tr) {
				  tr.addEventListener("mouseover", function() {
				    tr.style.backgroundColor = "yellow";
				  });
				
				  tr.addEventListener("mouseout", function() {
				    tr.style.backgroundColor = "";
				  });
				});
			$(document).on("click", ".acceptButton", function() {
			    var row = $(this).closest("tr");
			    var idYeuCau = row.find("td:first-child").text().trim();
			    const ctsvId = `${ctsvId}`; // Use backticks for template literal
			    $.ajax({
			        url: "/DichVuSinhVien/xu-ly-yeu-cau",
			        method: "PUT",
			        contentType: "application/json; charset=utf-8",
			        data: JSON.stringify({
			            idYC: idYeuCau,
			            trangthai: 'HoanThanh'
			        }),
			        success: function (data) {
			        	console.log("1");
			            window.location.href = "/DichVuSinhVien/xu-ly-yeu-cau?ctsvId=" + ctsvId;
			        },
			        error: function () {
			            console.log("Error saving data");
			        }
			    });
			});
			$(document).on("click", ".denyButton", function() {
		        var row = $(this).closest("tr");
		
		        var idYeuCau = row.find("td:first-child").text().trim();
		        const ctsvId = ${ctsvId}
		        $.ajax({
			        url: "/DichVuSinhVien/xu-ly-yeu-cau",
			        method: "PUT",
			        contentType: "application/json; charset=utf-8",
			        data: JSON.stringify({
			            idYC: idYeuCau,
			            trangthai: 'TuChoi'
			        }),
			        success: function (data) {
			        	 window.location.href = "/DichVuSinhVien/xu-ly-yeu-cau?ctsvId=" + ctsvId;
			        },
			        error: function () {
			            console.log("Error saving data");
			        }
		    	});
			});
		</script>	

</body>
</html>