package Controllers;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.List;
import java.util.Date;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import DAO.TaiKhoanDao;
import Models.TaiKhoan;
import Models.CTSV;
import Models.QuanLy;
import Models.SinhVien;

/**
 * Servlet implementation class TaiKhoanController
 */
@WebServlet("/")
public class TaiKhoanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private TaiKhoanDao taiKhoanDao;

    public void init() {
		taiKhoanDao = new TaiKhoanDao();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException {
		String action = request.getServletPath();

        try {
            switch (action) {
                case "/dangNhap":
                	dangNhap(request, response);
                    break;
                case "/ThongTinSinhVien":
                	ThongTinSinhVien(request, response);
                	break;
                case "/CapNhatSinhVien":
                	CapNhatSinhVien(request, response);
                	break;
                case "/BangDiemSinhVien":
                	BangDiemSinhVien(request, response);
                	break;
                default:
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/DangNhap.jsp");
                    dispatcher.forward(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
	}
	
	private void dangNhap(HttpServletRequest request, HttpServletResponse response)
	        throws SQLException, ServletException, IOException {
	    String taiKhoan = request.getParameter("username");
	    String matKhau = request.getParameter("password");
	    TaiKhoan tk = new TaiKhoan();
	    tk.setTaiKhoan(taiKhoan);
	    tk.setMatKhau(matKhau);
	    try {
	        if (taiKhoanDao.DangNhap(tk)) {
	            HttpSession session = request.getSession();              
	            tk.setPhanQuyen(taiKhoanDao.LayPhanQuyen(tk));
	            String maND = taiKhoanDao.MaNguoiDung(tk);
	            session.setAttribute("maND", maND);
	            session.setAttribute("phanQuyen", tk.getPhanQuyen());
	            RequestDispatcher dispatcher;
	            System.out.println(maND);

	            switch (tk.getPhanQuyen()) {
	            case "quanly":
	                QuanLy quanly = taiKhoanDao.getQuanLy(maND);
	                session.setAttribute("quanly", quanly);
	                dispatcher = request.getRequestDispatcher("/Admin/index_Admin.jsp");
	                dispatcher.forward(request, response);
	                break;     
	            case "ctsv":
	                CTSV ctsv = taiKhoanDao.getCTSV(maND);
	                session.setAttribute("ctsv", ctsv);
	                dispatcher = request.getRequestDispatcher("/CTSV/index_CTSV.jsp");
	                dispatcher.forward(request, response);
	                break;
	            case "sinhvien":     
	            	SinhVien sinhvien = taiKhoanDao.getSinhVien(maND);
	            	session.setAttribute("sinhvien", sinhvien);
	                if(sinhvien.getAnhCaNhan() != null) {
		                String encodedImage = Base64.getEncoder().encodeToString(sinhvien.getAnhCaNhan());
		                request.setAttribute("encodedImage", encodedImage);
		            }
	                dispatcher = request.getRequestDispatcher("/SinhVien/index_SinhVien.jsp");
	                dispatcher.forward(request, response);
	                break;
	            default:
	                dispatcher = request.getRequestDispatcher("/DangNhap.jsp");
	                dispatcher.forward(request, response);
	                break;
	            }
	        } else {
	            request.setAttribute("errMsg", "Thông tin đăng nhập không chính xác");
	            RequestDispatcher dispatcher = request.getRequestDispatcher("/DangNhap.jsp");
	            dispatcher.forward(request, response);
	        }
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    }
	}
	
	private void ThongTinSinhVien(HttpServletRequest request, HttpServletResponse response)
	        throws SQLException, ServletException, IOException {
		HttpSession session = request.getSession();
		String maND = (String) session.getAttribute("maND");
		RequestDispatcher dispatcher;
	    SinhVien sinhvien = new SinhVien();
		try {
			sinhvien = taiKhoanDao.getSinhVien(maND);
			request.setAttribute("sinhvien", sinhvien);
		    if(sinhvien.getAnhCaNhan() != null) {
		    	String encodedImage = Base64.getEncoder().encodeToString(sinhvien.getAnhCaNhan());
			    request.setAttribute("encodedImage", encodedImage);
			}
		    dispatcher = request.getRequestDispatcher("/SinhVien/ThongTin_SinhVien.jsp");
		    dispatcher.forward(request, response);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	private void CapNhatSinhVien(HttpServletRequest request, HttpServletResponse response)
	        throws SQLException, ServletException, IOException {
		String mssv = request.getParameter("mssv");
	    String hoTen = request.getParameter("name");
	    String cccd = request.getParameter("cccd");
  	    int gioiTinh = "male".equals(request.getParameter("gender")) ? 1 : 0;
  	    System.out.println(request.getParameter("gender"));
	    
	    Date ngaySinh = null;
	    try {
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        String dobParameter = request.getParameter("dob");
	        if (dobParameter != null && !dobParameter.isEmpty()) {
	            ngaySinh = sdf.parse(dobParameter);
	        }
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }
	    String image = request.getParameter("image");
	    String base64Image = image.replaceAll("data:image/\\w+;base64,", "");
	    byte[] imageBytes = Base64.getDecoder().decode(base64Image);
	    String sdt = request.getParameter("phone");
	    String email = request.getParameter("email");
	    String diaChi = request.getParameter("address");
	    SinhVien sinhvien = new SinhVien();
	    sinhvien.setID_SinhVien(mssv);
	    sinhvien.setHoTen(hoTen);
	    sinhvien.setCCCD(cccd);
	    sinhvien.setGioiTinh(gioiTinh);
	    sinhvien.setNgaySinh(ngaySinh);
	    sinhvien.setSDT(sdt);
	    sinhvien.setEmail(email);
	    sinhvien.setDiaChi(diaChi);
	    sinhvien.setAnhCaNhan(imageBytes);
	    
	    try {
			boolean status = taiKhoanDao.updateSinhVien(sinhvien);
			sinhvien = taiKhoanDao.getSinhVien(mssv);
			HttpSession session = request.getSession();
			session.setAttribute("maND", sinhvien.getID_SinhVien());
			if(!status) {
				request.setAttribute("errMsg", "Cập nhật không thành công");
		    }
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	private void BangDiemSinhVien(HttpServletRequest request, HttpServletResponse response)
	        throws SQLException, ServletException, IOException {
		HttpSession session = request.getSession();
		String maND = (String) session.getAttribute("maND");
		RequestDispatcher dispatcher;
	    SinhVien sinhvien = new SinhVien();
		try {
			sinhvien = taiKhoanDao.getSinhVien(maND);
			request.setAttribute("sinhvien", sinhvien);
		    dispatcher = request.getRequestDispatcher("/SinhVien/BangDiem_SinhVien.jsp");
		    dispatcher.forward(request, response);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
