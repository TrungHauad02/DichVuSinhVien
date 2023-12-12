package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.HoatDong;
import Util.HandleExeption;
import Util.JDBCUtil;

public class HoatDongDAO {

	public HoatDongDAO() {
	}
	
	public List<HoatDong> LayDSHoatDong() throws ClassNotFoundException {
		List<HoatDong> dsHD = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");
		
		try (Connection connection = JDBCUtil.getConnection();
	        	PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM HOATDONG")) {
	            ResultSet rs = preparedStatement.executeQuery();

	            while (rs.next()) {
	            	HoatDong hd = new HoatDong();
	                hd.setID_HoatDong(rs.getInt("ID_HoatDong"));
	            	hd.setTenHoatDong(rs.getString("TenHoatDong"));
	            	hd.setDiemRL(rs.getInt("DiemRL"));
	            	hd.setDiemCTXH(rs.getInt("DiemCTXH"));
	            	hd.setNgayThamGia(rs.getDate("NgayThamGia"));
	            	hd.setID_DichVu(rs.getInt("ID_DichVu"));
	            	hd.setTrangThai(rs.getInt("TrangThai"));
	            	hd.setNoiDung(rs.getString("NoiDung"));
	            	           
	            	dsHD.add(hd);
	               }
	            } catch (SQLException e) {
	                HandleExeption.printSQLException(e);
	            }
		
		return dsHD;
	}
}
