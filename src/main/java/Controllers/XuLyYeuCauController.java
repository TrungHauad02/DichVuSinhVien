package Controllers;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import DAO.LopHocDAO;
import DAO.ThamGiaLopHocDAO;
import DAO.ThemSinhVienLopDao;
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
       
    /**a
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
 
	        HttpSession session = request.getSession();
			String maND = (String) session.getAttribute("maND");
	        int ctsvId = Integer.parseInt(maND);
	        request.setAttribute("ctsvId", ctsvId);
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/CTSV/XuLyYeuCau_CTSV.jsp");
	        dispatcher.forward(request, response);
	        
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
	}
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			BufferedReader reader = request.getReader();
	        StringBuilder jsonData = new StringBuilder();
	        String line;
	        while ((line = reader.readLine()) != null) {
	            jsonData.append(line);
	        } 
	        JSONObject jsonObject = new JSONObject(jsonData.toString());
	        String trangthai = jsonObject.getString("trangthai");
	        int idYeuCau = Integer.parseInt(jsonObject.getString("idYC"));
	        XuLyYeuCauDao.xuLyYeuCau(trangthai ,idYeuCau);
			}
			    catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	/**
	 * Debug đi
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			BufferedReader reader = request.getReader();
	        StringBuilder jsonData = new StringBuilder();
	        String line;
	        while ((line = reader.readLine()) != null) {
	            jsonData.append(line);
	        } 
	        JSONObject jsonObject = new JSONObject(jsonData.toString());
	        System.out.println(jsonObject);
	        String trangthai = jsonObject.getString("trangthai");
	        int idYeuCau = Integer.parseInt(jsonObject.getString("idYC"));
	        System.out.println(idYeuCau);
	        int idCtsv = jsonObject.getInt("idctsv");
	        String noidungphanhoi = jsonObject.getString("noidungph");
	        LocalDateTime thoidiemphanhoi = LocalDateTime.now();
	        XuLyYeuCauDao.themPhanHoi(noidungphanhoi, trangthai, thoidiemphanhoi, idCtsv, idYeuCau);
			}
			    catch (SQLException e) {
				// TODO Auto-generated catch block 
				e.printStackTrace();  
			}
		}
}
