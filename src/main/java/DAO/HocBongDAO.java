package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import Models.HocBong;
import Util.HandleExeption;
import Util.JDBCUtil;

public class HocBongDAO {

	public HocBongDAO() {
	}
	public List<HocBong> LayDSHocBong(String mssv) throws ClassNotFoundException {
		List<HocBong> dshb = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");
		
		try (Connection connection = JDBCUtil.getConnection();
	        	PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM HOCBONG where SoLuong > 0")) {
	        System.out.println(preparedStatement);    
			ResultSet rs = preparedStatement.executeQuery();

	            while (rs.next()) {
	            	HocBong hb = new HocBong();
	                hb.setID_HocBong(rs.getInt("ID_HocBong"));
	            	hb.setTenHocBong(rs.getString("TenHocBong"));
	            	hb.setDieuKien(rs.getFloat("DieuKien"));
	                hb.setSoLuong(rs.getInt("SoLuong"));
	                hb.setTienThuong(rs.getInt("TienThuong"));
	                hb.setID_DichVu(rs.getInt("ID_DichVu"));
	                hb.setNoiDung(rs.getString("NoiDung"));
	                hb.setDaNhan(mssv);
	            	dshb.add(hb);
	               }
	            } catch (SQLException e) {
	                HandleExeption.printSQLException(e);
	            }
		
		return dshb;
	}
}
