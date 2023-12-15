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
    
     <jsp:include page="../head.jsp" />
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
                    <h1>Bảng yêu cầu</h1>

				    <div class="row">
				      <div class="col-md-8">
				        <table class="table" id = "TBYeuCau">
						  <thead>
						    <tr>
						      <th>Mã yêu cầu</th>
						      <th>MSSV</th>
						      <th>Dịch vụ</th>
						      <th>Thời gian yêu cầu</th>
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
				      <div class="col-md-4">
				      		<div class="form-group">
								<label for="noidungPhanHoi">Nội dung phản hồi</label>
								<textarea class="form-control" id="noidungPhanHoi" rows="5"></textarea>
							</div>
				      </div>
				      
            
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
			document.getElementById("TBYeuCau").querySelectorAll("tr").forEach(function(tr) {
				  tr.addEventListener("mouseover", function() {
				    tr.style.backgroundColor = "yellow";
				  });
				
				  tr.addEventListener("mouseout", function() {
				    tr.style.backgroundColor = "";
				  });
				});
			$(document).on("click", ".acceptButton", function () {
			    var row = $(this).closest("tr");
			    var idYeuCau = row.find("td:first-child").text().trim();
			    const ctsvId = ${ctsvId};
			    var noiDungPh = $("#noidungPhanHoi").val();

			    $.ajax({
			        url: "/DichVuSinhVien/xu-ly-yeu-cau",
			        method: "PUT",
			        contentType: "application/json; charset=utf-8",
			        data: JSON.stringify({
			            idYC: idYeuCau,
			            trangthai: "HoanThanh",
			        }),
			        success: function (data) {
			            $.ajax({
			                url: "/DichVuSinhVien/xu-ly-yeu-cau",
			                method: "POST",
			                contentType: "application/json; charset=utf-8",
			                data: JSON.stringify({
			                    idYC: idYeuCau,
			                    trangthai: "HoanThanh",
			                    idctsv: ctsvId,
			                    noidungph: noiDungPh,
			                }),
			                success: function (data) {
			                    window.location.href = "/DichVuSinhVien/xu-ly-yeu-cau?ctsvId=" + ctsvId;
			                },
			                error: function () {
			                    console.log("Error saving data1");
			                },
			            });
			        },
			        error: function () {
			            console.log("Error saving data");
			        },
			    });
			});
			$(document).on("click", ".denyButton", function () {
			    var row = $(this).closest("tr");
			    var idYeuCau = row.find("td:first-child").text().trim();
			    console.log(idYeuCau);
			    const ctsvId = ${ctsvId};
			    var noiDungPh = $("#noidungPhanHoi").val();

			    $.ajax({
			        url: "/DichVuSinhVien/xu-ly-yeu-cau",
			        method: "PUT",
			        contentType: "application/json; charset=utf-8",
			        data: JSON.stringify({
			            idYC: idYeuCau,
			            trangthai: "TuChoi",
			        }),
			        success: function (data) {
			            $.ajax({
			                url: "/DichVuSinhVien/xu-ly-yeu-cau",
			                method: "POST",
			                contentType: "application/json; charset=utf-8",
			                data: JSON.stringify({
			                    idYC: idYeuCau,
			                    trangthai: "TuChoi",
			                    idctsv: ctsvId,
			                    noidungph: noiDungPh,
			                }),
			                success: function (data) {
			                    window.location.href = "/DichVuSinhVien/xu-ly-yeu-cau?ctsvId=" + ctsvId;
			                },
			                error: function () {
			                    console.log("Error saving data");
			                },
			            });
			        },
			        error: function () {
			            console.log("Error saving data");
			        },
			    });
			});
		</script>	

</body>
</html>