package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import Models.QuanLy;

import Util.HandleExeption;
import Util.JDBCUtil;

public class QuanLyDAO {
	private static final String UPDATE_ADMIN_SQL = "UPDATE QUANLY SET HoTen=?,  NgaySinh=?, GioiTinh=?,CCCD=?,SDT=?, Email=? WHERE ID_QuanLY = ?";
	private static final String SELECT_ADMIN_BY_ID = "select * from QUANLY where ID_QuanLy =?";
	public QuanLy selectAdmin(int idquanly) {
		QuanLy quanly = null;
		// Step 1: Establishing a Connection
		try {
			Connection conn = JDBCUtil.getConnection();
			PreparedStatement preparedStatement = conn.prepareStatement(SELECT_ADMIN_BY_ID);
			preparedStatement.setInt(1, idquanly);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("ID_QuanLy");
                String hoten = rs.getString("HoTen");
                String cccd = rs.getString("CCCD");
                String gioitinh = rs.getString("GioiTinh");
                Date ngaysinh = rs.getDate("NgaySinh");
                String sdt = rs.getString("SDT");
                String email = rs.getString("Email");
                int id_TaiKhoan = rs.getInt("ID_TaiKhoan");
                int trangthai = rs.getInt("TrangThai");
				quanly = new QuanLy(id, hoten, cccd, gioitinh, ngaysinh, sdt, email, id_TaiKhoan, trangthai);
			}
		} catch (SQLException e) {
			HandleExeption.printSQLException(e);
		}
		return quanly;
	}
	public boolean updateAdmin(QuanLy quanly)  {
		boolean rowUpdated = false;
		try {
			Connection conn = JDBCUtil.getConnection();
			PreparedStatement statement = conn.prepareStatement(UPDATE_ADMIN_SQL);
			statement.setString(1, quanly.getHoTen());
			statement.setDate(2, new java.sql.Date(quanly.getNgaySinh().getTime()));
			statement.setString(3, quanly.getGioiTinh());
			statement.setString(4, quanly.getCCCD());
			statement.setString(5, quanly.getSDT());
			statement.setString(6, quanly.getEmail()); 
			statement.setInt(7, quanly.getID_QuanLy());
			rowUpdated = statement.executeUpdate() > 0;
		} catch (SQLException e) {
			HandleExeption.printSQLException(e);
		}
		return rowUpdated;
	}
}
