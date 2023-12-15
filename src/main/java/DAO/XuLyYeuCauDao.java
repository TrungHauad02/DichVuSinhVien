package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

import Models.TableYeuCau;
import Util.HandleExeption;
import Util.JDBCUtil;

public class XuLyYeuCauDao {
	private static final String SELECTYEUCAU = "SELECT YEUCAU.ID_YeuCau, YEUCAU.ID_SinhVien, DICHVU.TenDichVu, YEUCAU.ThoiGianGui, YEUCAU.TrangThai FROM YEUCAU INNER JOIN DICHVU ON YEUCAU.ID_DichVu = DICHVU.ID_DichVu WHERE YEUCAU.TrangThai = 'DangXuLy';";
	private static final String XULYYEUCAU = "UPDATE YEUCAU SET TrangThai = ? WHERE ID_YeuCau = ?;";
	private static final String THEMPHANHOI = "INSERT INTO phanhoi(NoiDung, TrangThai, ThoiGianPH, ID_CTSV, ID_YeuCau) VALUES (?, ?, ?, ?, ?);";
//	private static final String SELECTNOIDUNGDICHVU = "SELECT NoiDung, C"
	public static List<TableYeuCau> selectDSYeuCau() throws SQLException {
	    List<TableYeuCau> dtDSYeuCau = new ArrayList<>();

	    try (
	        Connection connection = JDBCUtil.getConnection();
	    	PreparedStatement preparedStatement = connection.prepareStatement(SELECTYEUCAU);){
	        ResultSet rs = preparedStatement.executeQuery();

	        while (rs.next()) {
	        	TableYeuCau yeucau = new TableYeuCau();
	        	yeucau.setID_YeuCau(rs.getInt("ID_YeuCau"));
	        	yeucau.setID_SinhVien(rs.getString("ID_SinhVien"));
	        	yeucau.setTenDichVu(rs.getString("TenDichVu"));
	        	yeucau.setThoiGianGui(rs.getDate("ThoiGianGui"));
	        	yeucau.setTrangThai(rs.getString("TrangThai"));
	            dtDSYeuCau.add(yeucau);
	        }
	    }
	    return dtDSYeuCau;
	}
	public static void xuLyYeuCau(String trangthai, int idYeuCau) throws SQLException {
		try (
		        Connection connection = JDBCUtil.getConnection();
		    	PreparedStatement preparedStatement = connection.prepareStatement(XULYYEUCAU);){
				preparedStatement.setString(1, trangthai);
		        preparedStatement.setInt(2, idYeuCau);
		        preparedStatement.executeUpdate();

		    }
	}
	public static void themPhanHoi(String noidung, String trangthai, LocalDateTime thoigianph, int idctsv, int idYeuCau) throws SQLException {
	    try (
            Connection connection = JDBCUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(THEMPHANHOI)) {
	        preparedStatement.setString(1, noidung);
	        preparedStatement.setString(2, trangthai);
	        preparedStatement.setTimestamp(3, Timestamp.from(thoigianph.atZone(ZoneId.systemDefault()).toInstant()));
	        preparedStatement.setInt(5, idYeuCau);
	        preparedStatement.setInt(4, idctsv);
	        preparedStatement.executeUpdate();
	    } 
	}
}
