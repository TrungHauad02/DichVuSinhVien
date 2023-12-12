package Controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.LopHocDAO;
import DAO.ThamGiaLopHocDAO;
import DAO.XuLyYeuCauDao;
import Models.LopHoc;
import Models.TableYeuCau;
import Models.ThamGiaLopHoc;

/**
 * Servlet implementation class XuLyYeuCauController
 */
@WebServlet("/xu-ly-yeu-cau")
public class XuLyYeuCauController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XuLyYeuCauController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<TableYeuCau> danhSachYeuCau = new ArrayList<>();
			danhSachYeuCau = XuLyYeuCauDao.selectDSYeuCau();
	        request.setAttribute("danhSachYeuCau", danhSachYeuCau);
 
	        int ctsvId = 0;
	        if(request.getParameter("ctsvId") != null) {
	        	ctsvId = Integer.parseInt(request.getParameter("ctsvId"));			
	        }
	        request.setAttribute("ctsvId", ctsvId);
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/CTSV/XuLyYeuCau_CTSV.jsp");
	        dispatcher.forward(request, response);
	        
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
