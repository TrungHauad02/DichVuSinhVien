package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.TaiKhoan;
import Util.HandleExeption;
import Util.JDBCUtil;

import Models.ThamGiaLopHoc;

public class ThamGiaLopHocDAO {

	public ThamGiaLopHocDAO() {
	}

	public List<ThamGiaLopHoc> getBangDiem(String mssv) throws ClassNotFoundException {
		List<ThamGiaLopHoc> bangDiem = new ArrayList<>();
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection connection = JDBCUtil.getConnection();
                PreparedStatement preparedStatement = connection
                .prepareStatement("select * from thamgialophoc where ID_SinhVien = ? and TrangThai = 1 ")) {
                preparedStatement.setString(1, mssv);

                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement.executeQuery();
                while(rs.next())
                {
                	ThamGiaLopHoc tglh = new ThamGiaLopHoc();
                	tglh.setIdLopHoc(rs.getInt("ID_LopHoc"));
                	tglh.setDiemQuaTrinh(rs.getFloat("DiemQuaTrinh"));
                	tglh.setDiemCuoiKy(rs.getFloat("DiemCuoiKy"));
                	bangDiem.add(tglh);
                }

            } catch (SQLException e) {
                HandleExeption.printSQLException(e);
            }
        
        return bangDiem;
	}
}
