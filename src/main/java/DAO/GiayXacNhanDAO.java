package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.GiayXacNhan;
import Util.HandleExeption;
import Util.JDBCUtil;

public class GiayXacNhanDAO {

	public GiayXacNhanDAO() {
	}
	
	public List<GiayXacNhan> getDSGiayXN(String mssv) throws ClassNotFoundException 
	{
		List<GiayXacNhan> dsGiayXN = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");
		
		Class.forName("com.mysql.jdbc.Driver");
        try (Connection connection = JDBCUtil.getConnection();
                // Step 2:Create a statement using connection object
                PreparedStatement preparedStatement = connection
                .prepareStatement("select * from giayxacnhan where ID_SinhVien = ?")) {
        		preparedStatement.setString(1, mssv);
                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    GiayXacNhan giayxn = new GiayXacNhan();
                    giayxn.setID_GiayXN(rs.getInt("ID_GiayXN"));
                    giayxn.setNoiDung(rs.getString("NoiDung"));
                    giayxn.setNgayNhan(rs.getDate("NgayNhan"));
                    giayxn.setID_SinhVien(rs.getString("ID_SinhVien"));
                    giayxn.setID_DichVu(rs.getInt("ID_DichVu"));
                    giayxn.setTrangThai(rs.getInt("TrangThai"));
                    giayxn.setID_YeuCau(rs.getInt("ID_YeuCau"));

                    dsGiayXN.add(giayxn);
                }
            } catch (SQLException e) {
                HandleExeption.printSQLException(e);
            }
		
		return dsGiayXN;
	}
	
}
