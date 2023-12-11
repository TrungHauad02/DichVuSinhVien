package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.CTSV;
import Models.QuanLy;
import Util.HandleExeption;
import Util.JDBCUtil;

public class QuanLyDAO {

	private static final String SELECT_QUANLY_BY_ID = "select * from quanly where ID_QuanLy = ?";
	private static final String UPDATE_QUANLYS_SQL = "update quanly set HoTen = ?,CCCD= ?, GioiTinh =?, NgaySinh =?, SDT =?, Email =? where ID_QuanLy = ?;";

	public boolean updateQuanly(QuanLy quanly) throws SQLException {
		boolean rowUpdated = false;
		try {
			Connection conn = JDBCUtil.getConnection();
			PreparedStatement statement = conn.prepareStatement(UPDATE_QUANLYS_SQL);
			statement.setString(1, quanly.getHoTen());
			statement.setString(2, quanly.getCCCD());
			statement.setString(3, quanly.getGioiTinh());
			statement.setDate(4, (Date) quanly.getNgaySinh());
			statement.setString(5, quanly.getSDT());
			statement.setString(6, quanly.getEmail());

			statement.setInt(7, quanly.getID_QuanLy());

			rowUpdated = statement.executeUpdate() > 0;
		} catch (SQLException e) {
			HandleExeption.printSQLException(e);
		}
		return rowUpdated;
	}

	public QuanLy getQuanLy(int idquanly) {
	    QuanLy quanLy = new QuanLy();
	    
	    try (Connection connection = JDBCUtil.getConnection();
	            PreparedStatement preparedStatement = connection
	            .prepareStatement("select * from QUANLY where ID_QuanLy = ?")) {
	            preparedStatement.setInt(1, idquanly);

	            System.out.println(preparedStatement);
	            ResultSet rs = preparedStatement.executeQuery();
	            if (rs.next()) {
	                quanLy.setID_QuanLy(rs.getInt("ID_QuanLy"));
	                quanLy.setHoTen(rs.getString("HoTen"));
	                quanLy.setCCCD(rs.getString("CCCD"));
	                quanLy.setGioiTinh(rs.getString("GioiTinh"));
	                quanLy.setNgaySinh(rs.getDate("NgaySinh"));
	                quanLy.setSDT(rs.getString("SDT"));
	                quanLy.setEmail(rs.getString("Email"));
	                quanLy.setID_TaiKhoan(rs.getInt("ID_TaiKhoan"));
	                quanLy.setTrangThai(rs.getInt("TrangThai"));
	            }
	        } catch (SQLException e) {
	            HandleExeption.printSQLException(e);
	        }
	        return quanLy;
	}	
}
