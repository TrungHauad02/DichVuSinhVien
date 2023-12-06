package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Util.HandleExeption;
import Util.JDBCUtil;
import Models.TaiKhoan;


public class TaiKhoanDao {

	public TaiKhoanDao() {
	}
	
	public boolean DangNhap(TaiKhoan tk) throws ClassNotFoundException {
	        boolean status = false;
	        Class.forName("com.mysql.jdbc.Driver");
	        try (Connection connection = JDBCUtil.getConnection();
	                // Step 2:Create a statement using connection object
	                PreparedStatement preparedStatement = connection
	                .prepareStatement("select * from taikhoan where TaiKhoan = ? and MatKhau = ? ")) {
	                preparedStatement.setString(1, tk.getTaiKhoan());
	                preparedStatement.setString(2, tk.getMatKhau());

	                System.out.println(preparedStatement);
	                ResultSet rs = preparedStatement.executeQuery();
	                status = rs.next();

	            } catch (SQLException e) {
	                HandleExeption.printSQLException(e);
	            }
	            return status;
	}
		
	public String LayPhanQuyen(TaiKhoan tk)throws ClassNotFoundException {
		String phanQuyen = "";
		try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement preparedStatement = connection
                .prepareStatement("select PhanQuyen from taikhoan where TaiKhoan = ?")) {
                preparedStatement.setString(1, tk.getTaiKhoan());

                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement.executeQuery();
                rs.next();
                phanQuyen = rs.getString("PhanQuyen");

            } catch (SQLException e) {
                HandleExeption.printSQLException(e);
            }
		return phanQuyen;
	}
}
