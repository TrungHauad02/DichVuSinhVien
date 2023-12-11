package Controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.GiayVayVonDAO;
import DAO.GiayXacNhanDAO;
import Models.GiayVayVon;
import Models.GiayXacNhan;
import Models.SinhVien;

/**
 * Servlet implementation class GiayXacNhanController
 */
@WebServlet("/GiayXacNhan/*")
public class GiayXacNhanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GiayXacNhanController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();

        try {
            switch (action) {
                case "/ThongTinDS":
                	ThongTinDS(request, response);
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
	private void ThongTinDS(HttpServletRequest request, HttpServletResponse response)
	        throws SQLException, ServletException, IOException {
		HttpSession session = request.getSession();
		String mssv = (String) session.getAttribute("maND");
	    
	    GiayVayVonDAO giayVayVonDAO = new GiayVayVonDAO();
	    GiayXacNhanDAO giayXacNhanDAO = new GiayXacNhanDAO();
		try {
			List<GiayVayVon> dsgiayvay = giayVayVonDAO.getDSGiayVay(mssv);
			List<GiayXacNhan> dsgiayxn = giayXacNhanDAO.getDSGiayXN(mssv);
			request.setAttribute("dsgiayvay", dsgiayvay);
		    request.setAttribute("dsgiayxn", dsgiayxn);

		    RequestDispatcher dispatcher = request.getRequestDispatcher("/SinhVien/GiayXacNhan_SinhVien.jsp");
		    dispatcher.forward(request, response);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}    
	}
}
