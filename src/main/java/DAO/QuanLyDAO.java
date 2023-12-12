package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.QuanLy;
import Models.SinhVien;
import Util.HandleExeption;
import Util.JDBCUtil;

public class QuanLyDAO {
	private static final String UPDATE_ADMIN_SQL = "UPDATE QUANLY SET HoTen=?,  NgaySinh=?, GioiTinh=?,CCCD=?,SDT=?, Email=? WHERE ID_QuanLY = ?";
	private static final String SELECT_ADMIN_BY_ID = "select * from QUANLY where ID_QuanLy =?";

	private static final String INSERT_SVS_SQL = "INSERT INTO sinhvien"
			+ "  (ID_SinhVien, HoTen, CCCD, GioiTinh, NgaySinh, SDT, Email, NamHoc, Khoa, DiemRL, DiemCTXH) VALUES "
			+ " (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

	private static final String SELECT_SV_BY_ID = "select * from SINHVIEN where ID_SinhVien =?";
	private static final String SELECT_ALL_SV = "select ID_SinhVien, HoTen, CCCD, GioiTinh, NgaySinh, SDT, Email, NamHoc, Khoa, ID_TaiKhoan, DiemRL, DiemCTXH, TrangThai from SINHVIEN";
	private static final String DELETE_USERS_SQL = "delete from sinhvien where ID_SinhVien = ?;";
	private static final String UPDATE_SV_SQL = "update SINHVIEN set HoTen=?,  NgaySinh=?, GioiTinh=?,CCCD=?, NamHoc = ?, Khoa = ? where ID_SinhVien = ?";
	
	//Admin
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

	public boolean updateAdmin(QuanLy quanly) {
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
	
	//SV
	/*
	 * public void insertSV(SinhVien sinhvien) throws SQLException { try {
	 * Connection conn = JDBCUtil.getConnection(); PreparedStatement
	 * preparedStatement = conn.prepareStatement(INSERT_SVS_SQL);
	 * preparedStatement.setString(1, sinhvien.getID_SinhVien());
	 * preparedStatement.setString(2, sinhvien.getHoTen());
	 * preparedStatement.setString(3, sinhvien.getCCCD());
	 * preparedStatement.setInt(4, sinhvien.getGioiTinh());
	 * preparedStatement.setDate(5, (Date) sinhvien.getNgaySinh());
	 * preparedStatement.setString(6, sinhvien.getSDT());
	 * preparedStatement.setString(7, sinhvien.getEmail());
	 * preparedStatement.setString(8, sinhvien.getNamHoc());
	 * preparedStatement.setInt(9, sinhvien.getKhoa()); preparedStatement.setInt(10,
	 * sinhvien.getDiemRL()); preparedStatement.setInt(11, sinhvien.getDiemCTXH());
	 * preparedStatement.executeUpdate(); } catch (SQLException e) {
	 * HandleExeption.printSQLException(e); } }
	 */
	// Your existing connection code and other methods...

    public void insertSV(String hoTen, String cccd, int gioiTinh, 
                           java.util.Date ngaySinh, String sdt, String email, 
                           String namHoc, int khoa, int idTaiKhoan) {
        try (Connection conn = JDBCUtil.getConnection();
             CallableStatement callableStatement = conn.prepareCall("{call ThemSinhVien(?, ?, ?, ?, ?, ?, ?, ?, ?)}")) {
            
            callableStatement.setString(1, hoTen);
            callableStatement.setString(2, cccd);
            callableStatement.setInt(3, gioiTinh);
            callableStatement.setDate(4, (Date) ngaySinh);
            callableStatement.setString(5, sdt);
            callableStatement.setString(6, email);
            callableStatement.setString(7, namHoc);
            callableStatement.setInt(8, khoa);
            callableStatement.setInt(9, idTaiKhoan);

            callableStatement.execute();
        } catch (SQLException e) {
        	HandleExeption.printSQLException(e);
            // Handle the exception as needed
        }
    }

	public boolean updateSV(SinhVien sinhvien)  {
		boolean rowUpdated = false;
		try {
			Connection conn = JDBCUtil.getConnection();
			PreparedStatement statement = conn.prepareStatement(UPDATE_SV_SQL);
			statement.setString(1, sinhvien.getHoTen());
			statement.setDate(2, new java.sql.Date(sinhvien.getNgaySinh().getTime()));
			statement.setInt(3, sinhvien.getGioiTinh());
			statement.setString(4, sinhvien.getCCCD());
			statement.setString(5, sinhvien.getNamHoc());
			statement.setInt(6, sinhvien.getKhoa());
			statement.setString(7, sinhvien.getID_SinhVien());
			rowUpdated = statement.executeUpdate() > 0;
		} catch (SQLException e) {
			HandleExeption.printSQLException(e);
		}
		return rowUpdated;
	}

	public SinhVien selectSV(String iD_SinhVien) {
		SinhVien sinhvien = null;
		// Step 1: Establishing a Connection
		try {
			Connection conn = JDBCUtil.getConnection();
			PreparedStatement preparedStatement = conn.prepareStatement(SELECT_SV_BY_ID);
			preparedStatement.setString(1, iD_SinhVien);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String hoTen = rs.getString("HoTen");
				String cCCD = rs.getString("CCCD");
				int gioiTinh = rs.getInt("GioiTinh");
				Date ngaySinh = rs.getDate("NgaySinh");
				String sdt = rs.getString("SDT");
				String email = rs.getString("Email");
				String namHoc = rs.getString("NamHoc");
				int khoa = rs.getInt("Khoa");
				int idTK = rs.getInt("ID_TaiKhoan");
				int diemRL = rs.getInt("DiemRL");
				int diemCTXH = rs.getInt("DiemCTXH");
				int trangthai = rs.getInt("TrangThai");
				sinhvien = new SinhVien(iD_SinhVien, hoTen, cCCD, gioiTinh, ngaySinh, sdt, email, namHoc, khoa, idTK,
						diemRL, diemCTXH, trangthai);
			}
		} catch (SQLException e) {
			HandleExeption.printSQLException(e);
		}
		return sinhvien;
	}

	public List<SinhVien> selectAllSV() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<SinhVien> sinhviens = new ArrayList<>();
		// Step 1: Establishing a Connection
		try {
			Connection conn = JDBCUtil.getConnection();
			// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = conn.prepareStatement(SELECT_ALL_SV);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String iD_SinhVien = rs.getString("ID_SinhVien");
				String hoTen = rs.getString("HoTen");
				String cCCD = rs.getString("CCCD");
				int gioiTinh = rs.getInt("GioiTinh");
				Date ngaySinh = rs.getDate("NgaySinh");
				String sdt = rs.getString("SDT");
				String email = rs.getString("Email");
				String namHoc = rs.getString("NamHoc");
				int khoa = rs.getInt("Khoa");
				int idTK = rs.getInt("ID_TaiKhoan");
				int diemRL = rs.getInt("DiemRL");
				int diemCTXH = rs.getInt("DiemCTXH");
				int trangthai = rs.getInt("TrangThai");
				sinhviens.add(new SinhVien(iD_SinhVien, hoTen, cCCD, gioiTinh, ngaySinh, sdt, email, namHoc, khoa, idTK,
						diemRL, diemCTXH, trangthai));
			}
		} catch (SQLException e) {
			HandleExeption.printSQLException(e);
		}
		return sinhviens;
	}

	public boolean deleteSV(int id) throws SQLException {
		boolean rowDeleted = false;
		try {
			Connection conn = JDBCUtil.getConnection();
			PreparedStatement statement = conn.prepareStatement(DELETE_USERS_SQL);
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		} catch (SQLException e) {
			HandleExeption.printSQLException(e);
		}
		return rowDeleted;
	}
}
