package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.GiayVayVon;
import Util.HandleExeption;
import Util.JDBCUtil;

public class GiayVayVonDAO {

	public GiayVayVonDAO() {
	}
		public List<GiayVayVon> getDSGiayVay(String mssv) throws ClassNotFoundException 
		{
			List<GiayVayVon> dsGiayVay = new ArrayList<>();
			Class.forName("com.mysql.jdbc.Driver");
			
			Class.forName("com.mysql.jdbc.Driver");
	        try (Connection connection = JDBCUtil.getConnection();
	        	PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM GIAYVAYVON WHERE ID_SinhVien = ?")) {

	            preparedStatement.setString(1, mssv);
	            ResultSet rs = preparedStatement.executeQuery();

	            while (rs.next()) {
	                GiayVayVon giayVayVon = new GiayVayVon();
	                giayVayVon.setID_GiayVay(rs.getInt("ID_GiayVay"));
	                giayVayVon.setNoiDung(rs.getString("NoiDung"));
	                giayVayVon.setNgayNhan(rs.getDate("NgayNhan"));
	                giayVayVon.setID_SinhVien(rs.getString("ID_SinhVien"));
	                giayVayVon.setID_DichVu(rs.getInt("ID_DichVu"));
	                giayVayVon.setSoTien(rs.getInt("SoTien"));
	                giayVayVon.setTrangThai(rs.getInt("TrangThai"));
	                giayVayVon.setID_YeuCau(rs.getInt("ID_YeuCau"));

	                dsGiayVay.add(giayVayVon);
	               }
	            } catch (SQLException e) {
	                HandleExeption.printSQLException(e);
	            }
			
			return dsGiayVay;
		}
}
