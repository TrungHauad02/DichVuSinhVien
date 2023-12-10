package Controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Base64;
import java.util.List;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	            switch (tk.getPhanQuyen()) {
	            case "quanly":
	                QuanLy quanly = taiKhoanDao.getQuanLy(maND);
	                request.setAttribute("quanly", quanly);
	                dispatcher = request.getRequestDispatcher("/Admin/index_Admin.jsp");
	                dispatcher.forward(request, response);
	                break;     
	            case "ctsv":
	                CTSV ctsv = taiKhoanDao.getCTSV(maND);
	                request.setAttribute("ctsv", ctsv);
	                dispatcher = request.getRequestDispatcher("/CTSV/index_CTSV.jsp");
	                dispatcher.forward(request, response);
	                break;
	            case "sinhvien":     
	            	SinhVien sinhvien = taiKhoanDao.getSinhVien(maND);
	                request.setAttribute("sinhvien", sinhvien);
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

}
