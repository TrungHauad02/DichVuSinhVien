package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import Models.LopHoc;
import Util.HandleExeption;
import Util.JDBCUtil;

public class LopHocDao {
	public LopHocDao()
	{
		
	}
	private static final String SELECT_LOPHOC = "SELECT ID_LopHoc, MonHoc, TinChi FROM LopHoc;";
	 public static List<LopHoc> selectLopHoc() throws SQLException {
	        List<LopHoc> dtLopHoc = new ArrayList<>();

	        try (Connection connection = JDBCUtil.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LOPHOC);
	             ResultSet rs = preparedStatement.executeQuery()) {

	            while (rs.next()) {
	            	LopHoc lopHoc = new LopHoc();
	            	lopHoc.setID_LopHoc(rs.getInt("ID_LopHoc"));
	                lopHoc.setMonHoc(rs.getString("MonHoc"));
	                lopHoc.setTinChi(rs.getInt("TinChi"));
	                dtLopHoc.add(lopHoc);
	            }
	        }
	        catch (SQLException exception) {
	            HandleExeption.printSQLException(exception);
	        }
	        return dtLopHoc;
	    }
}
