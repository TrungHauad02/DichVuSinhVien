package Controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import Util.JDBCUtil;

@WebServlet("/UploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet {
	/*   
	 * protected void doPost(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { Part filePart =
	 * request.getPart("excelFile"); // "excelFile" is the name attribute of the
	 * file input in the form InputStream fileContent = filePart.getInputStream();
	 * Connection conn = JDBCUtil.getConnection();
	 * 
	 * try (Workbook workbook = new XSSFWorkbook()) { Sheet sheet =
	 * workbook.getSheetAt(0); System.out.println(workbook);
	 * 
	 * for (Row row : sheet) { System.out.println(row.getRowNum()); for (Cell cell :
	 * row) { String col1 = cell.getStringCellValue(); String col2 =
	 * cell.getStringCellValue(); String col3 = cell.getStringCellValue(); String
	 * col4 = cell.getStringCellValue(); // Insert into the database String sql =
	 * "INSERT INTO ThamGiaLopHoc (ID_LopHoc, ID_SinhVien, DiemQuaTrinh, DiemCuoiKy, TrangThai) VALUES (?, ?, ?, ?, 1)"
	 * ; try (PreparedStatement statement = conn.prepareStatement(sql)) {
	 * statement.setString(1, col1); statement.setString(2, col2);
	 * statement.setString(3, col3); statement.setString(4, col4);
	 * statement.executeUpdate(); } }
	 *    
	 * 
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } }
	 */ 
	  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Retrieves <input type="file" name="file">
	        Part filePart = request.getPart("excelFile");

	        // Retrieves the filename
	        String fileName = getSubmittedFileName(filePart);

	        // Get the InputStream to store the file somewhere
	        InputStream fileContent = filePart.getInputStream();

	        // Process the file content as needed

	        // You can save the file to a specific location or perform other actions

	        // Example: Save the file to the server's root directory
	        File file= new File(fileName);
	        try (FileOutputStream out = new FileOutputStream(file)) {
	            int read;
	            final byte[] bytes = new byte[1024];
	            while ((read = fileContent.read(bytes)) != -1) {
	                out.write(bytes, 0, read);
	            } 
	        }
	        FileInputStream fileInputStream = new FileInputStream(file.getAbsolutePath());
	        List <String> ArrayD = new ArrayList<>();
	        if (fileInputStream != null) {
	        	HSSFWorkbook wb = new HSSFWorkbook(new POIFSFileSystem(fileInputStream));
	            System.out.println("1AFFFFFFFFFF23");
	            // Assuming the data is in the first sheet
	            Sheet sheet = wb.getSheetAt(0);
	            Connection conn = JDBCUtil.getConnection(); 	
	            
	            // Iterate through rows
	            for (Row row : sheet) {
	                // Iterate through cells 
	                for (Cell cell : row) {
	                    ArrayD.add(cell.toString());
	                }
		                String sql = "INSERT INTO ThamGiaLopHoc (ID_LopHoc, ID_SinhVien, DiemQuaTrinh, DiemCuoiKy, TrangThai) VALUES (?, ?, ?, ?, 1)";
		                try (PreparedStatement statement = conn.prepareStatement(sql)) {
		                    statement.setInt(1, Integer.parseInt(ArrayD.get(0)));
		                    statement.setString(2, ArrayD.get(1));
		                    statement.setFloat(3, Float.parseFloat(ArrayD.get(2)));
		                    statement.setFloat(4, Float.parseFloat(ArrayD.get(3)));
		                    statement.executeUpdate();
		                }
		            
		                	catch (SQLException e) {
		                		e.printStackTrace();
		                    
		                }
		               ArrayD.clear();
	            }  
	            
		        
		        wb.close();  } 
	        int ctsvId = 0;
	        if(request.getParameter("ctsvId") != null) {
	        	ctsvId = Integer.parseInt(request.getParameter("ctsvId"));			
	        }
	        request.setAttribute("ctsvId", ctsvId);
	        response.sendRedirect("/DichVuSinhVien/ThemDiem?ctsvId=" + ctsvId);
	      //  response.getWriter().println("File " + file.getAbsolutePath() + " has been uploaded successfully!");
	    }

	    // Utility method to get the submitted file name 
	    private String getSubmittedFileName(Part part) {
	        for (String content : part.getHeader("content-disposition").split(";")) {
	            if (content.trim().startsWith("filename")) {
	                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
	            }
	        }
	        return null;
	    }
}