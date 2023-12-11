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
import DAO.TaiKhoanDao;
import Models.QuanLy;

@WebServlet("/ThongTin_Admin/*")
public class QuanLyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public QuanLyController() {
		super();

	}

	private QuanLyDAO quanlyDAO;

	public void init() {
		quanlyDAO = new QuanLyDAO();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int idquanly = Integer.parseInt(request.getPathInfo().substring(1));
		QuanLy quanly = quanlyDAO.getQuanLy(idquanly);
		request.setAttribute("quanly", quanly);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/ThongTin_Admin.jsp");
		dispatcher.forward(request, response);
	}

}
