package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.QuanLy;
import Util.HandleExeption;
import Util.JDBCUtil;

public class QuanLyDAO {
	private static final String INSERT_QUANLYS_SQL = "INSERT INTO quanly"
			+ "  (ID_QuanLy, HoTen, CCCD, GioiTinh, NgaySinh, SDT, Email) VALUES " + " (?, ?, ?, ?, ?, ?, ?);";

	private static final String SELECT_QUANLY_BY_ID = "select * from quanly where ID_QuanLy =?";
	private static final String SELECT_ALL_QUANLYS = "select ID_QuanLy, HoTen, CCCD, GioiTinh, NgaySinh, SDT, Email from quanly";
	private static final String UPDATE_QUANLYS_SQL = "update quanly set HoTen = ?,CCCD= ?, GioiTinh =?, NgaySinh =?, SDT =?, Email =? where ID_QuanLy = ?;";

	public void insertQuanly(QuanLy quanly) throws SQLException {
		// try-with-resource statement will auto close the connection.
		try {
			Connection conn = JDBCUtil.getConnection();
			PreparedStatement preparedStatement = conn.prepareStatement(INSERT_QUANLYS_SQL);
			preparedStatement.setString(1, quanly.getHoTen());
			preparedStatement.setString(2, quanly.getCCCD());
			preparedStatement.setString(3, quanly.getGioiTinh());
			preparedStatement.setDate(4, (Date) quanly.getNgaySinh());
			preparedStatement.setString(5, quanly.getSDT());
			preparedStatement.setString(6, quanly.getEmail());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			HandleExeption.printSQLException(e);
		}
	}

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

	public QuanLy selectQuanly(int id) {
		QuanLy quanly = null;
		// Step 1: Establishing a Connection
		try {
			Connection conn = JDBCUtil.getConnection();
			PreparedStatement preparedStatement = conn.prepareStatement(SELECT_QUANLY_BY_ID);
			preparedStatement.setInt(1, id);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String hoten = rs.getString("HoTen");
				String cccd = rs.getString("CCCD");
				String gioiTinh = rs.getString("GioiTinh");
				Date ngaySinh = rs.getDate("NgaySinh");
				String sdt = rs.getString("SDT");
				String email = rs.getString("Email");
				quanly = new QuanLy(id, hoten, cccd, gioiTinh, ngaySinh, sdt, email);
			}
		} catch (SQLException e) {
			HandleExeption.printSQLException(e);
		}
		return quanly;
	}

	public QuanLy getQuanLyById(int id) throws SQLException {
		// Tạo kết nối với database
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "1234");

		// Truy vấn dữ liệu
		String sql = "SELECT * FROM QUANLY WHERE ID_QuanLy = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, id);
		ResultSet resultSet = statement.executeQuery();

		// Nếu không tìm thấy dòng dữ liệu nào
		if (!resultSet.next()) {
			return null;
		}

		// Tạo đối tượng quanLy
		QuanLy quanLy = new QuanLy();
		quanLy.setID_QuanLy(resultSet.getInt("ID_QuanLy"));
		quanLy.setHoTen(resultSet.getString("HoTen"));
		quanLy.setCCCD(resultSet.getString("CCCD"));
		quanLy.setGioiTinh(resultSet.getString("GioiTinh"));
		quanLy.setNgaySinh(resultSet.getDate("NgaySinh"));
		quanLy.setSDT(resultSet.getString("SDT"));
		quanLy.setEmail(resultSet.getString("Email"));
		quanLy.setID_TaiKhoan(resultSet.getInt("ID_TaiKhoan"));
		quanLy.setTrangThai(resultSet.getInt("TrangThai"));

		// Đóng kết nối
		connection.close();
		return quanLy;
	}

	public List<QuanLy> selectAllQuanLys() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<QuanLy> quanlys = new ArrayList<>();
		// Step 1: Establishing a Connection
		try {
			Connection conn = JDBCUtil.getConnection();
			// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = conn.prepareStatement(SELECT_ALL_QUANLYS);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("ID_QuanLy");
				String hoten = rs.getString("HoTen");
				String cccd = rs.getString("CCCD");
				String gioiTinh = rs.getString("GioiTinh");
				Date ngaySinh = rs.getDate("NgaySinh");
				String sdt = rs.getString("SDT");
				String email = rs.getString("Email");
				quanlys.add(new QuanLy(id, hoten, cccd, gioiTinh, ngaySinh, sdt, email));
			}
		} catch (SQLException e) {
			HandleExeption.printSQLException(e);
		}
		return quanlys;
	}
}
