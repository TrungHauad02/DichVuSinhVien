package Controllers;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import DAO.CTSVDao;
import Models.CTSV;

/**
 * Servlet implementation class CTSVControllers
 */
@WebServlet("/ThongTin_CTSV/*")
public class LoadThongTinCTSVController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoadThongTinCTSVController() {
        super();
    }
    private CTSVDao ctsvDao;

    public void init() {
		ctsvDao = new CTSVDao();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ctsvId = Integer.parseInt(request.getPathInfo().substring(1));
        CTSV ctsv = CTSVDao.selectctsv(ctsvId);
        request.setAttribute("ctsv", ctsv); 
        RequestDispatcher dispatcher = request.getRequestDispatcher("/CTSV/ThongTin_CTSV.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int ctsvId = Integer.parseInt(request.getPathInfo().substring(1));
		BufferedReader reader = request.getReader();
        StringBuilder jsonData = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            jsonData.append(line);
        }
        JSONObject jsonObject = new JSONObject(jsonData.toString());
        String sdt = jsonObject.getString("sdt");
        String email = jsonObject.getString("email");
        

        CTSVDao.updateThongTinCTSV(sdt, email, ctsvId);

	}

}
