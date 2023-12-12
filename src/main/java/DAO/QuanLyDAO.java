
package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import Models.CTSV;
import Models.Khoa;
import Models.LopHoc;
import Models.QuanLy;
import Models.SinhVien;
import Util.HandleExeption;
import Util.JDBCUtil;

public class QuanLyDAO {
	// admin
	private static final String UPDATE_ADMIN_SQL = "UPDATE QUANLY SET HoTen=?,  NgaySinh=?, GioiTinh=?,CCCD=?,SDT=?, Email=? WHERE ID_QuanLY = ? and TrangThai = 1";
	private static final String SELECT_ADMIN_BY_ID = "select * from QUANLY where ID_QuanLy =? and TrangThai = 1";

	// sv
	private static final String SELECT_SV_BY_ID = "select * from SINHVIEN where ID_SinhVien =? and TrangThai = 1";
	private static final String SELECT_ALL_SV = "select ID_SinhVien, HoTen, CCCD, GioiTinh, NgaySinh, SDT, Email, NamHoc, Khoa, ID_TaiKhoan, DiemRL, DiemCTXH, TrangThai from SINHVIEN where TrangThai = 1";
	private static final String UPDATE_SV_SQL = "update SINHVIEN set HoTen=?,  NgaySinh=?, GioiTinh=?,CCCD=?, NamHoc = ?, Khoa = ? where ID_SinhVien = ?";
	private static final String DELETE_SV_SQL = "UPDATE SINHVIEN SET TrangThai = 0 WHERE ID_SinhVien = ?";

	// ctsv
	private static final String SELECT_CTSV_BY_ID = "select * from CTSV where ID_CTSV =? and TrangThai = 1";
	private static final String SELECT_ALL_CTSV = "select ID_CTSV, HoTen, NgaySinh, GioiTinh, CCCD, SDT, Email from CTSV where TrangThai = 1";
	private static final String UPDATE_CTSV_SQL = "UPDATE CTSV SET HoTen=?, CCCD=?, GioiTinh=?, NgaySinh=?, SDT=?, Email=? WHERE ID_CTSV = ?";
	private static final String DELETE_CTSV_SQL = "UPDATE CTSV SET TrangThai = 0 WHERE ID_CTSV = ?";

	// khoa
	private static final String SELECT_ALL_KHOA = "select ID_Khoa, TenKhoa from KHOA where TrangThai = 1";
	private static final String INSERT_KHOA_SQL = "INSERT INTO KHOA" + "  (ID_Khoa, TenKhoa) VALUES " + " (?, ?);";
	private static final String DELETE_KHOA_SQL = "UPDATE KHOA SET TrangThai = 0 WHERE ID_Khoa = ?";

	// lophoc
	private static final String SELECT_ALL_LOPHOC = "select ID_LopHoc, MonHoc, TinChi from LOPHOC where TrangThai = 1";
	private static final String DELETE_LOPHOC_SQL = "UPDATE LOPHOC SET TrangThai = 0 WHERE ID_LopHoc = ?";

	// Admin
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

	// SV
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

	public void insertSV(SinhVien sinhVien) {
		try (Connection conn = JDBCUtil.getConnection()) {
			String storedProcedure = "{CALL ThemSinhVien(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
			try (CallableStatement cs = conn.prepareCall(storedProcedure)) {
				cs.setString(1, sinhVien.getHoTen());
				cs.setString(2, sinhVien.getCCCD());
				cs.setInt(3, sinhVien.getGioiTinh());
				cs.setDate(4, new java.sql.Date(sinhVien.getNgaySinh().getTime()));
				cs.setString(5, sinhVien.getSDT());
				cs.setString(6, sinhVien.getEmail());
				cs.setString(7, sinhVien.getNamHoc());
				cs.setInt(8, sinhVien.getKhoa());
				cs.setInt(9, sinhVien.getID_TaiKhoan());

				cs.executeUpdate();
			}
		} catch (SQLException e) {
			HandleExeption.printSQLException(e);
		}
	}

	public boolean updateSV(SinhVien sinhvien) {
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

	public boolean deleteSV(String id) {
		boolean rowDeleted = false;
		try {
			Connection conn = JDBCUtil.getConnection();
			PreparedStatement statement = conn.prepareStatement(DELETE_SV_SQL);
			statement.setString(1, id);
			statement.executeUpdate();
			rowDeleted = statement.executeUpdate() > 0;
		} catch (SQLException e) {
			HandleExeption.printSQLException(e);
		}
		return rowDeleted;
	}

	// CTSV
	public CTSV selectCTSV(int idctsv) {
		CTSV ctsv = null;
		// Step 1: Establishing a Connection
		try {
			Connection conn = JDBCUtil.getConnection();
			PreparedStatement preparedStatement = conn.prepareStatement(SELECT_CTSV_BY_ID);
			preparedStatement.setInt(1, idctsv);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("ID_CTSV");
				String hoten = rs.getString("HoTen");
				String cccd = rs.getString("CCCD");
				String gioitinh = rs.getString("GioiTinh");
				Date ngaysinh = rs.getDate("NgaySinh");
				String sdt = rs.getString("SDT");
				String email = rs.getString("Email");
				int id_TaiKhoan = rs.getInt("ID_TaiKhoan");
				int trangthai = rs.getInt("TrangThai");
				ctsv = new CTSV(id, hoten, cccd, gioitinh, ngaysinh, sdt, email, id_TaiKhoan, trangthai);
			}
		} catch (SQLException e) {
			HandleExeption.printSQLException(e);
		}
		return ctsv;
	}

	public List<CTSV> selectAllCTSV() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<CTSV> ctsvs = new ArrayList<>();
		// Step 1: Establishing a Connection
		try {
			Connection conn = JDBCUtil.getConnection();
			// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = conn.prepareStatement(SELECT_ALL_CTSV);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int iD_SinhVien = rs.getInt("ID_CTSV");
				String hoTen = rs.getString("HoTen");
				String cCCD = rs.getString("CCCD");
				String gioiTinh = rs.getString("GioiTinh");
				Date ngaySinh = rs.getDate("NgaySinh");
				String sdt = rs.getString("SDT");
				String email = rs.getString("Email");
				ctsvs.add(new CTSV(iD_SinhVien, hoTen, cCCD, gioiTinh, ngaySinh, sdt, email));
			}
		} catch (SQLException e) {
			HandleExeption.printSQLException(e);
		}
		return ctsvs;
	}

	public boolean updateCTSV(CTSV ctsv) {
		boolean rowUpdated = false;
		try {
			Connection conn = JDBCUtil.getConnection();
			PreparedStatement statement = conn.prepareStatement(UPDATE_CTSV_SQL);
			statement.setString(1, ctsv.getHoTen());
			statement.setString(2, ctsv.getCCCD());
			statement.setString(3, ctsv.getGioiTinh());
			statement.setDate(4, new java.sql.Date(ctsv.getNgaySinh().getTime()));
			statement.setString(5, ctsv.getSDT());
			statement.setString(6, ctsv.getEmail());
			statement.setInt(7, ctsv.getID_CTSV());
			rowUpdated = statement.executeUpdate() > 0;
		} catch (SQLException e) {
			HandleExeption.printSQLException(e);
		}
		return rowUpdated;
	}

	public boolean deleteCTSV(int id) {
		boolean rowDeleted = false;
		try {
			Connection conn = JDBCUtil.getConnection();
			PreparedStatement statement = conn.prepareStatement(DELETE_CTSV_SQL);
			statement.setInt(1, id);
			statement.executeUpdate();
			rowDeleted = statement.executeUpdate() > 0;
		} catch (SQLException e) {
			HandleExeption.printSQLException(e);
		}
		return rowDeleted;
	}

	// Khoa
	public void inserKhoa(Khoa khoa) throws SQLException {
		// try-with-resource statement will auto close the connection.
		try {
			Connection conn = JDBCUtil.getConnection();
			PreparedStatement preparedStatement = conn.prepareStatement(INSERT_KHOA_SQL);
			preparedStatement.setInt(1, khoa.getID_Khoa());
			preparedStatement.setString(2, khoa.getTenKhoa());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			HandleExeption.printSQLException(e);
		}
	}

	public List<Khoa> selectAllKhoa() {

		List<Khoa> khoas = new ArrayList<>();

		try {
			Connection conn = JDBCUtil.getConnection();
			PreparedStatement preparedStatement = conn.prepareStatement(SELECT_ALL_KHOA);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int iDKhoa = rs.getInt(1);
				String tenKhoa = rs.getString(2);
				khoas.add(new Khoa(iDKhoa, tenKhoa));
			}
		} catch (SQLException e) {
			HandleExeption.printSQLException(e);
		}
		return khoas;
	}

	public boolean deleteKhoa(int id) {
		boolean rowDeleted = false;
		try {
			Connection conn = JDBCUtil.getConnection();
			PreparedStatement statement = conn.prepareStatement(DELETE_KHOA_SQL);
			statement.setInt(1, id);
			statement.executeUpdate();
			rowDeleted = statement.executeUpdate() > 0;
		} catch (SQLException e) {
			HandleExeption.printSQLException(e);
		}
		return rowDeleted;
	}

	// LopHoc

	public List<LopHoc> selectAllLopHoc() {

		List<LopHoc> lopHocs = new ArrayList<>();

		try {
			Connection conn = JDBCUtil.getConnection();
			PreparedStatement preparedStatement = conn.prepareStatement(SELECT_ALL_LOPHOC);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int iDKhoa = rs.getInt(1);
				String tenKhoa = rs.getString(2);
				int tinChi = rs.getInt(3);
				lopHocs.add(new LopHoc(iDKhoa, tenKhoa, tinChi));
			}
		} catch (SQLException e) {
			HandleExeption.printSQLException(e);
		}
		return lopHocs;
	}

	public boolean deleteLopHoc(int id) {
		boolean rowDeleted = false;
		try {
			Connection conn = JDBCUtil.getConnection();
			PreparedStatement statement = conn.prepareStatement(DELETE_LOPHOC_SQL);
			statement.setInt(1, id);
			statement.executeUpdate();
			rowDeleted = statement.executeUpdate() > 0;
		} catch (SQLException e) {
			HandleExeption.printSQLException(e);
		}
		return rowDeleted;
	}
}
