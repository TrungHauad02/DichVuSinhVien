import java.util.List;

import DAO.QuanLyDAO;
import DAO.SinhVienDAO;
import Models.QuanLy;
import Models.SinhVien;
import DAO.TaiKhoanDao;

public class test {
	public static void main(String args[]) {
		SinhVienDAO dao = new SinhVienDAO();
		List<SinhVien> list = dao.selectAllSV();
		for (SinhVien o : list) 
		{
			System.out.println(o);
		}

	}
}
