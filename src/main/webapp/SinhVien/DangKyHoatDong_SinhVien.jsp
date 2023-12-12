<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Models.HoatDong" %>
<%@ page import="Models.Khoa" %>
<%@ page import="Models.ToChuc" %>
<%@ page import="Models.YeuCau" %>
<%@ page import="Models.ThamGiaHD" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Đăng ký hoạt động</title>

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
			            <div class="col-6">
			               <div class="form-group row">
							    <label for="activityType" class="col-sm-7 col-form-label">Trạng thái hoạt động:</label>
							    <div class="col-sm-5">
							        <select class="form-control" id="activityStatus">
							            <option>Chưa diễn ra</option>
							            <option>Đã hoàn thành</option>
							            <option>Tất cả</option>
							        </select>
							    </div>
							</div>

			                <table class="table table-bordered">
						        <thead>
						            <tr>
						                <th>Tên hoạt động</th>
						                <th>Ngày tổ chức</th>
						                <th>Khoa tổ chức</th>
						            </tr>
						        </thead>
						        <tbody>
						            <c:forEach var="hd" items="${dshd}" varStatus="status">
									    <tr class="clickable-row" data-id="${hd.getID_HoatDong()}">
									        <td>${hd.getTenHoatDong()}</td>
									        <td>${hd.getNgayThamGia()}</td>
									        <td>
									            <c:forEach var="tochuc" items="${dstochuc}">
									                <c:if test="${tochuc.getID_HoatDong() eq hd.getID_HoatDong()}">
									                    ${tochuc.getKhoaTC().getTenKhoa()}
									                </c:if>
									            </c:forEach>
									        </td>
									    </tr>
									</c:forEach>
						        </tbody>
						    </table>
			            </div>
			            <div class="col-6">
			                <form>
			                    <div class="form-group">
			                        <label for="activityName">Tên hoạt động:</label>
			                        <input type="text" class="form-control" id="activityName">
			                    </div>
			                    <div class="form-group">
			                        <label for="organizer">Tổ chức:</label>
			                        <input type="text" class="form-control" id="organizer">
			                    </div>
			                    <div class="form-group">
			                        <label for="rlPoints">Điểm RL:</label>
			                        <input type="number" class="form-control" id="rlPoints" min="0">
			                        <label for="ctxhPoints">Điểm CTXH:</label>
			                        <input type="number" class="form-control" id="ctxhPoints" min="0">
			                    </div>
			                    <div class="form-group">
			                        <label for="date">Ngày:</label>
			                        <input type="date" class="form-control" id="date">
			                        <label for="status">Trạng thái:</label>
			                        <input type="text" class="form-control" id="status">
			                    </div>
			                    <div class="form-group">
			                        <label for="description">Mô tả:</label>
			                        <textarea class="form-control" id="description" rows="3"></textarea>
			                    </div>
			                    <button type="submit" class="btn btn-primary">Đăng ký hoạt động</button>
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
    
    <!-- Custum JavaScript-->
    <c:set var="dstochucArray" value="${dstochuc.toArray()}"/>
    <c:set var="dshoatdongArray" value="${dshoatdong.toArray()}"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".clickable-row").click(function () {
            	console.log("Đã click");
                var idHoatDong = $(this).data("id");
                var organizerName = "";
                var dstochucArray = <c:out value="${dstochucArray}" escapeXml="false"/>;
                var dshoatdongArray = <c:out value="${dshoatdongArray}" escapeXml="false"/>;

                $.each(dstochucArray, function (index, tochuc) {
                    if (tochuc.ID_HoatDong == idHoatDong) {	
                        organizerName = tochuc.KhoaTC.TenKhoa;
                        return false;
                    }
                });
                var activityName = "";
                $.each(${dshoatdongArray}, function(index, hoatdong) {
                    if (hoatdong.ID_HoatDong == idHoatDong) {
                    	activityName = hoatdong.TenHoatDong;
                    	return false;
                 	}
                });

            	$("#activityName").val(activityName).prop("readonly", true);
            	$("#organizer").val(organizerName).prop("readonly", true);
            	
            });
        });
    </script>
</body>
</html>