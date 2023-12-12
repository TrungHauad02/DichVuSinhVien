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

    <title>Đăng ký học bổng</title>

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
				 <div class="container">
			        <div class="row">
			            <div class="col-8">
			                <table class="table text-dark table-bordered">
			                    <thead>
			                        <tr>
			                            <th>Tên học bổng</th>
			                            <th>Điều kiện</th>
			                            <th>Số lượng</th>
			                            <th>Tiền thưởng</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                        <tr>
			                            <td>Học bổng 1</td>
			                            <td>Điều kiện 1</td>
			                            <td>10</td>
			                            <td>10.000.000đ</td>
			                        </tr>
			                    </tbody>
			                </table>
			            </div>
			            <div class="col-4">
			                <div class="d-flex justify-content-center">
			                	<button type="button" class="btn btn-primary mb-3">Đăng ký học bổng</button>
			                </div>
			                <form>
			                    <div class="form-group">
			                        <label for="scholarshipDescription">Mô tả học bổng:</label>
			                        <textarea class="form-control" id="scholarshipDescription" rows="3"></textarea>
			                    </div>
			                </form>
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
    <jsp:include page="../Scripts.jsp" />
</body>
</html>