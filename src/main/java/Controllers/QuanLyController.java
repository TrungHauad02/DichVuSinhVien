package Controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.QuanLyDAO;
import Models.QuanLy;

@WebServlet("/admin")
public class QuanLyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QuanLyController() {
		super();

	}

	private QuanLyDAO quanlyDAO;

	public void init(ServletConfig config) throws ServletException {
		quanlyDAO = new QuanLyDAO();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int idquanly = 1;
		QuanLy quanly = quanlyDAO.selectAdmin(idquanly);
		
		request.setAttribute("quanly", quanly);
		request.getRequestDispatcher("/Admin/ThongTin_Admin.jsp").forward(request, response);
	}
}
