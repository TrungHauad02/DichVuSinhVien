import java.util.List;

import DAO.QuanLyDAO;
import DAO.SinhVienDAO;
import Models.QuanLy;
import Models.SinhVien;
import DAO.TaiKhoanDao;

public class test {
	public static void main(String args[]) {
		QuanLyDAO dao = new QuanLyDAO();
		/* List<SinhVien> list = dao.selectAllSV(); */
		SinhVien a = dao.selectSV("1");
		/*
		 * for (SinhVien o : list) { System.out.println(o); }
		 */
		System.out.println(a);

	}
}
