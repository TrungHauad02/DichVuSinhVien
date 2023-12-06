package Controllers;

import java.io.IOException;
import java.sql.SQLException;
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
		TaiKhoan  tk = new TaiKhoan();
		tk.setTaiKhoan(taiKhoan);
		tk.setMatKhau(matKhau);
		try {
            if (taiKhoanDao.DangNhap(tk)) {
            	HttpSession session = request.getSession();
                session.setAttribute("username", taiKhoan);                
                switch (taiKhoanDao.LayPhanQuyen(tk)) {
                case "quanly":
                	response.sendRedirect(request.getContextPath()+"/Admin/index_Admin.jsp");
                    break;     
                case "ctsv":
                	response.sendRedirect(request.getContextPath()+"/CTSV/index_CTSV.jsp");
                    break;
                case "sinhvien":                
                	response.sendRedirect(request.getContextPath()+"/SinhVien/index_SinhVien.jsp");
                    break;
                default:
                	response.sendRedirect(request.getContextPath()+"/DangNhap.jsp");
                    break;
            }
            } else {
            	request.setAttribute("errMsg", "Thong tin dang nhap khong chinh xac");
				RequestDispatcher dispatcher = request.getRequestDispatcher("DangNhap.jsp");
				dispatcher.forward(request, response);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
