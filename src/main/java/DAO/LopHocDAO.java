package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.LopHoc;
import Models.ThamGiaLopHoc;
import Util.HandleExeption;
import Util.JDBCUtil;

public class LopHocDAO {

	public LopHocDAO() {
	}

	public List<LopHoc> getDSLopHoc(List<ThamGiaLopHoc> bangDiem) throws ClassNotFoundException 
	{
		List<LopHoc> dslophoc = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");
		for (ThamGiaLopHoc tglh : bangDiem) {
	        try (Connection connection = JDBCUtil.getConnection();
	                PreparedStatement preparedStatement = connection
	                .prepareStatement("select * from LopHoc where ID_LopHoc = ? and TrangThai = 1")) {
	                preparedStatement.setInt(1, tglh.getIdLopHoc());

	                System.out.println(preparedStatement);
	                ResultSet rs = preparedStatement.executeQuery();
	                rs.next();
	                LopHoc lophoc = new LopHoc();
	                lophoc.setID_LopHoc(rs.getInt("ID_LopHoc"));
	                lophoc.setMonHoc(rs.getString("MonHoc"));
	                lophoc.setTinChi(rs.getInt("TinChi"));
	                lophoc.setTenLopHoc(rs.getString("TenLopHoc"));
	                dslophoc.add(lophoc);
	            } catch (SQLException e) {
	                HandleExeption.printSQLException(e);
	            }
        }
		
		return dslophoc;
	}
}
