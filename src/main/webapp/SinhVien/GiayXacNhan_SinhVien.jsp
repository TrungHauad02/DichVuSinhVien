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

    <title>Giấy xác nhận sinh viên</title>

    <!-- Custom fonts for this template-->
     <jsp:include page="../head.jsp" />

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
				<div class="container mh-80">
			        <div class="row table-container h6">
			            <div class="col-md-9">
			                <table class="table table-bordered text-dark">
						        <thead>
						            <tr>
						                <th>Thời gian đăng ký</th>
						                <th>Tên giấy tờ</th>
						                <th>STT</th>
						                <th>Chi phí</th>
						                <th>Thời gian nhận</th>
						                <th>Tình trạng</th>
						            </tr>
						        </thead>
						        <tbody>
						            <!-- Danh sách Giấy Vay -->
						            <c:forEach var="giayVay" items="${dsgiayvay}">
						                <tr>
						                    <td>${giayVay.ngayNhan}</td>
						                    <td>Giấy vay vốn</td>
						                    <td>${giayVay.ID_GiayVay}</td>
						                    <td>${giayVay.soTien}</td>
						                    <td>${giayVay.ngayNhan}</td>
						                    <td>
						                        <select>
						                            <option>${giayVay.trangThai == 0 ? 'Đang xử lý' : giayVay.trangThai == 1 ? 'Hoàn thành' : 'Từ chối'}</option>
						                        </select>
						                    </td>
						                </tr>
						            </c:forEach>
						
						            <!-- Danh sách Giấy Xác Nhận -->
						            <c:forEach var="giayXN" items="${dsgiayxn}">
						                <tr>
						                    <td>${giayXN.ngayNhan}</td>
						                    <td>Giấy xác nhận sinh viên</td>
						                    <td>${giayXN.ID_GiayXN}</td>
						                    <td>200.00</td> <!-- Thay thế bằng thuộc tính tương ứng trong đối tượng -->
						                    <td>${giayXN.ngayNhan}</td>
						                    <td>
						                        <select>
						                            <option>${giayXN.trangThai == 0 ? 'Đang xử lý' : giayXN.trangThai == 1 ? 'Hoàn thành' : 'Từ chối'}</option>
						                        </select>
						                    </td>
						                </tr>
						            </c:forEach>
						        </tbody>
						    </table>
			            </div>
			            <div class="col-md-3 d-flex flex-column align-items-center mt-auto mb-auto">
			                <label class="text-dark h5">Giấy xác nhận sinh viên</label>
			                <button class="btn btn-primary">Đăng ký</button>
			            </div>
			        </div>
			        <div class="row notes-container">
			            <div class="col-md-12">
			                <fieldset style="border: 4px solid black; padding: 10px">
					            <legend style="width: auto; border: none; padding: 0; margin: 2px 8px;">Ghi chú</legend>
					            <textarea class="form-control h6 text-dark" rows="5" placeholder="Ghi chú" readonly>Đây là ghi chú</textarea>
					        </fieldset>
			            </div>
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