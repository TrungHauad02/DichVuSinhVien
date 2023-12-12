package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.Khoa;
import Util.HandleExeption;
import Util.JDBCUtil;

public class KhoaDAO {

	public KhoaDAO() {
	}
	public List<Khoa> LayDSKhoa() throws ClassNotFoundException {
		List<Khoa> dsKhoa = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");
		
		try (Connection connection = JDBCUtil.getConnection();
	        	PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM KHOA Where TrangThai = 1")) {
	            ResultSet rs = preparedStatement.executeQuery();

	            while (rs.next()) {
	            	Khoa khoa = new Khoa();
	                khoa.setID_Khoa(rs.getInt("ID_Khoa"));
	                khoa.setTenKhoa(rs.getString("TenKhoa"));
	                khoa.setTrangThai(rs.getInt("TrangThai"));
	            	dsKhoa.add(khoa);
	               }
	            } catch (SQLException e) {
	                HandleExeption.printSQLException(e);
	            }
		
		return dsKhoa;
	}
}
