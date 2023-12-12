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

@WebServlet("/sinhVien")
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

        request.getRequestDispatcher("/Admin/QuanLySinhVien_Admin_CTSV.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
}
