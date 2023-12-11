package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.QuanLy;
import Util.HandleExeption;
import Util.JDBCUtil;

public class QuanLyDAO {

	private static final String SELECT_QUANLY_BY_ID = "select * from quanly where ID_QuanLy = ?";
	private static final String SELECT_ALL_QUANLYS = "select * from quanly";
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

	public QuanLy selectQuanly(int idQuanLy) {
		QuanLy quanly = null;
		// Step 1: Establishing a Connection
		try {
			Connection conn = JDBCUtil.getConnection();
			PreparedStatement preparedStatement = conn.prepareStatement(SELECT_QUANLY_BY_ID);
			preparedStatement.setInt(1, idQuanLy);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String hoTen = rs.getString("HoTen");
				String cccd = rs.getString("CCCD");
				String gioiTinh = rs.getString("GioiTinh");
				Date ngaySinh = rs.getDate("NgaySinh");
				String sdt = rs.getString("SDT");
				String email = rs.getString("Email");
				int idTaiKhoan = rs.getInt("ID_TaiKhoan");
				int trangThai = rs.getInt("TrangThai");
				quanly = new QuanLy(idQuanLy, hoTen, cccd, gioiTinh, ngaySinh, sdt, email, idTaiKhoan,
						trangThai);
			}
		} catch (SQLException e) {
			HandleExeption.printSQLException(e);
		}
		return quanly;
	}

	public QuanLy selectAllQuanLy() {

		QuanLy quanLy = new QuanLy();

		try (Connection conn = JDBCUtil.getConnection();
				PreparedStatement preparedStatement = conn.prepareStatement(SELECT_ALL_QUANLYS);
				ResultSet rs = preparedStatement.executeQuery()) {

			while (rs.next()) {
				int idQuanLy = rs.getInt("ID_QuanLy");
				String hoTen = rs.getString("HoTen");
				String cccd = rs.getString("CCCD");
				String gioiTinh = rs.getString("GioiTinh");
				Date ngaySinh = rs.getDate("NgaySinh");
				String sdt = rs.getString("SDT");
				String email = rs.getString("Email");
				int idTaiKhoan = rs.getInt("ID_TaiKhoan");
				int trangThai = rs.getInt("TrangThai");

				quanLy = new QuanLy(idQuanLy, hoTen, cccd, gioiTinh, ngaySinh, sdt, email, idTaiKhoan,
						trangThai);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return quanLy;
	}
}
