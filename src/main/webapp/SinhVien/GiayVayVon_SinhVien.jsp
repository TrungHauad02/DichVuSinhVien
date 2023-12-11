<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Giấy vay vốn</title>

    <!-- Custom fonts for this template-->
     <jsp:include page="../head.jsp" />
</head>
<body id="page-top">

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
                <a class="nav-link" href="<%= request.getContextPath()%>/ThongTinSinhVien">
                    <span >Thông tin cá nhân</span></a>
            </li>
            <hr class="sidebar-divider my-0">
            <li class="nav-item active mt-2">
                <a class="nav-link" href="<%= request.getContextPath()%>/BangDiemSinhVien">
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
                                <span class="mr-4 d-none d-lg-inline text-gray-900 medium">${sinhvien.getHoTen()}</span>
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
				<div class="container d-flex justify-content-center align-items-center">
			        <div class="col">
				        <h2 class="mt-4">Đăng ký vay vốn</h2>
				        <form>
				            <div class="form-group">
				                <label for="loanAmount">Khoản vay:</label>
				                <input type="number" class="form-control" id="loanAmount" placeholder="Nhập số tiền bạn muốn vay" min="0">
				            </div>
				            <div class="form-group">
				                <label for="loanPurpose">Mục đích vay:</label>
				                <textarea class="form-control" id="loanPurpose" rows="3" placeholder="Nhập mục đích vay của bạn"></textarea>
				            </div>
				            <button type="submit" class="btn btn-primary">Đăng ký</button>
				        </form>
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
</body>
</html>