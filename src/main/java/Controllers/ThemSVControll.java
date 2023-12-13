package Controllers;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.QuanLyDAO;
import Models.SinhVien;

@WebServlet("/insertsv")
public class ThemSVControll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private QuanLyDAO dao;

	public ThemSVControll() {
		super();

	}

	public void init(ServletConfig config) throws ServletException {
		dao = new QuanLyDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Admin/ThemSV.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String hoTen = request.getParameter("name");
		String cccd = request.getParameter("cccd");
		int gioiTinh = Integer.parseInt(request.getParameter("gender"));

		java.util.Date ngaySinh = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String dobParameter = request.getParameter("date");
			if (dobParameter != null && !dobParameter.isEmpty()) {
				ngaySinh = sdf.parse(dobParameter);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}

		String sdt = request.getParameter("sdt");
		String email = request.getParameter("email");
		String namHoc = request.getParameter("khoaHoc");
		int khoa = Integer.parseInt(request.getParameter("khoa"));
		SinhVien sinhVien = new SinhVien(hoTen, cccd, gioiTinh, ngaySinh, sdt, email, namHoc, khoa);
		dao.insertSV(sinhVien);
		response.sendRedirect("quanlysinhvien");
	}

}
