package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.TableYeuCau;
import Util.JDBCUtil;

public class XuLyYeuCauDao {
	private static final String SELECTYEUCAU = "SELECT YEUCAU.ID_YeuCau, YEUCAU.ID_SinhVien, DICHVU.TenDichVu, YEUCAU.ThoiGianGui, YEUCAU.TrangThai FROM YEUCAU INNER JOIN DICHVU ON YEUCAU.ID_DichVu = DICHVU.ID_DichVu;";
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
}
