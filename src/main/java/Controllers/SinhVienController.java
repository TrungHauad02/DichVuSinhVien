package Controllers;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.SinhVienDAO;
import Models.SinhVien;

@WebServlet("/SinhVien")
public class SinhVienController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private SinhVienDAO sinhvienDAO;
    public SinhVienController() {
        super();
        
    }

	public void init(ServletConfig config) throws ServletException {
		sinhvienDAO = new SinhVienDAO();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SinhVienDAO SVDao = new SinhVienDAO();
        List<SinhVien> svList = SVDao.selectAllSV();

        request.setAttribute("svList", svList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("QuanLySinhVien_Admin_CTSV.jsp");
        dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	/*
	 * private void listSV(HttpServletRequest request, HttpServletResponse response)
	 * throws SQLException, IOException, ServletException { List<SinhVien> listSV =
	 * sinhvienDAO.selectAllSV(); request.setAttribute("listSV", listSV);
	 * RequestDispatcher dispatcher =
	 * request.getRequestDispatcher("./Admin/QuanLySinhVien_Admin_CTSV.jsp");
	 * dispatcher.forward(request, response); }
	 * 
	 * private void showNewForm(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { RequestDispatcher dispatcher
	 * = request.getRequestDispatcher("./Admin/QuanLySinhVien_Admin_CTSV.jsp");
	 * dispatcher.forward(request, response); }
	 * 
	 * private void showEditForm(HttpServletRequest request, HttpServletResponse
	 * response) throws SQLException, ServletException, IOException { String id =
	 * request.getParameter("id"); SinhVien existingSV = sinhvienDAO.selectSV(id);
	 * RequestDispatcher dispatcher =
	 * request.getRequestDispatcher("./Admin/QuanLySinhVien_Admin_CTSV.jsp");
	 * request.setAttribute("SV", existingSV); dispatcher.forward(request,
	 * response);
	 * 
	 * } private void deleteUser(HttpServletRequest request, HttpServletResponse
	 * response) throws SQLException, IOException { int id =
	 * Integer.parseInt(request.getParameter("id")); sinhvienDAO.deleteUser(id);
	 * response.sendRedirect("list");
	 * 
	 * }
	 */
}
