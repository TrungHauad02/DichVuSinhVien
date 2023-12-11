package DAO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Models.YeuCau;
import Util.HandleExeption;
import Util.JDBCUtil;

public class YeuCauDAO {

	public YeuCauDAO() {
	}
	
	public List<YeuCau> getDSYeuCau(String mssv) throws ClassNotFoundException {
	    List<YeuCau> dsYeuCau = new ArrayList<>();

	    try (Connection connection = JDBCUtil.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM yeucau WHERE ID_SinhVien = ?")) {

	        preparedStatement.setString(1, mssv);
	        System.out.println(preparedStatement);

	        try (ResultSet rs = preparedStatement.executeQuery()) {
	            while (rs.next()) {
	                YeuCau yeuCau = new YeuCau();
	                yeuCau.setID_YeuCau(rs.getInt("ID_YeuCau"));
	                yeuCau.setTrangThai(rs.getString("TrangThai"));
	                yeuCau.setThoiGianGui(rs.getDate("ThoiGianGui"));
	                yeuCau.setID_SinhVien(rs.getString("ID_SinhVien"));
	                yeuCau.setID_DichVu(rs.getInt("ID_DichVu"));

	                dsYeuCau.add(yeuCau);
	            }
	        }
	    } catch (SQLException e) {
	        HandleExeption.printSQLException(e);
	    }

	    return dsYeuCau;
	}


	
}
