package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.ThamGiaHD;
import Models.ToChuc;
import Util.HandleExeption;
import Util.JDBCUtil;

public class ThamGiaHoatDongDAO {

	public ThamGiaHoatDongDAO() {
	}
	public List<ThamGiaHD> LayDSThamGiaHD(String mssv) throws ClassNotFoundException {
		List<ThamGiaHD> dsThamGiaHD = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");
		
		try (Connection connection = JDBCUtil.getConnection();
	        	PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM thamgiahd where ID_SinhVien = ?")) {
	            ResultSet rs = preparedStatement.executeQuery();

	            while (rs.next()) {
	            	ThamGiaHD tghd = new ThamGiaHD();
	            	tghd.setID_SinhVien(rs.getString("ID_SinhVien"));
	            	tghd.setID_HoatDong(rs.getInt("ID_HoatDong"));
	            	tghd.setTrangThai(rs.getInt("TrangThai"));
	            	tghd.setID_YeuCau(rs.getInt("ID_YeuCau"));
	            	dsThamGiaHD.add(tghd);
	               }
	            } catch (SQLException e) {
	                HandleExeption.printSQLException(e);
	            }
		
		return dsThamGiaHD;
	}
}
