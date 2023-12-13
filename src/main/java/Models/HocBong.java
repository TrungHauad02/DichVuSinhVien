package Models;

import java.io.Serializable;

import DAO.NhanHocBongDAO;

public class HocBong implements Serializable {
    private static final long serialVersionUID = 1L;

    private int ID_HocBong;
    private String TenHocBong;
    private float DieuKien;
    private int SoLuong;
    private int TienThuong;
    private int ID_DichVu;
    private String NoiDung;
    private boolean isDaNhan;

    public HocBong() {
    }

    public int getID_HocBong() {
        return ID_HocBong;
    }

    public void setID_HocBong(int ID_HocBong) {
        this.ID_HocBong = ID_HocBong;
    }

    public String getTenHocBong() {
        return TenHocBong;
    }

    public void setTenHocBong(String TenHocBong) {
        this.TenHocBong = TenHocBong;
    }

    public float getDieuKien() {
        return DieuKien;
    }

    public void setDieuKien(float DieuKien) {
        this.DieuKien = DieuKien;
    }

    public int getSoLuong() {
        return SoLuong;
    }

    public void setSoLuong(int SoLuong) {
        this.SoLuong = SoLuong;
    }

    public int getTienThuong() {
        return TienThuong;
    }

    public void setTienThuong(int TienThuong) {
        this.TienThuong = TienThuong;
    }

    public int getID_DichVu() {
        return ID_DichVu;
    }

    public void setID_DichVu(int ID_DichVu) {
        this.ID_DichVu = ID_DichVu;
    }

	public String getNoiDung() {
		return NoiDung;
	}

	public void setNoiDung(String noiDung) {
		NoiDung = noiDung;
	}
	
	public boolean isDaNhan(String mssv) {
		boolean status = false;
		NhanHocBongDAO nhanhbDAO = new NhanHocBongDAO();
		try {
			status = nhanhbDAO.isDaNhanHocBong(mssv, ID_HocBong);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return status;
	}

	public boolean getisDaNhan() {
		return isDaNhan;
	}

	public void setDaNhan(String mssv) {
		this.isDaNhan = isDaNhan(mssv);
	}
}
