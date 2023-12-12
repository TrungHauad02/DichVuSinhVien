package Controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.QuanLyDAO;
import Models.SinhVien;

@WebServlet("/quanlysinhvien")
public class QuanLySV_AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private QuanLyDAO dao;

	public QuanLySV_AdminController() {
		super();

	}

	public void init(ServletConfig config) throws ServletException {
		dao = new QuanLyDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<SinhVien> svList = dao.selectAllSV();
		request.setAttribute("svList", svList);
		request.getRequestDispatcher("/Admin/QuanLySinhVien_Admin_CTSV.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	
}
