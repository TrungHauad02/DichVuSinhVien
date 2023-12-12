package Models;

import java.io.Serializable;

public class LopHoc implements Serializable {
    private static final long serialVersionUID = 1L;

    private int ID_LopHoc;
    private String MonHoc;
    private String TenLopHoc;
    private int TinChi;
    private int TrangThai;

    public LopHoc() {
    }

    public LopHoc(int iDKhoa, String tenKhoa, int tinChi2) {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "LopHoc [ID_LopHoc=" + ID_LopHoc + ", MonHoc=" + MonHoc + ", TenLopHoc=" + TenLopHoc + ", TinChi="
				+ TinChi + ", TrangThai=" + TrangThai + "]";
	}

	public int getID_LopHoc() {
        return ID_LopHoc;
    }

    public void setID_LopHoc(int ID_LopHoc) {
        this.ID_LopHoc = ID_LopHoc;
    }

    public String getMonHoc() {
        return MonHoc;
    }

    public void setMonHoc(String MonHoc) {
        this.MonHoc = MonHoc;
    }

    public int getTinChi() {
        return TinChi;
    }

    public void setTinChi(int TinChi) {
        this.TinChi = TinChi;
    }

    public int getTrangThai() {
        return TrangThai;
    }

    public void setTrangThai(int TrangThai) {
        this.TrangThai = TrangThai;
    }

	public String getTenLopHoc() {
		return TenLopHoc;
	}

	public void setTenLopHoc(String tenLopHoc) {
		TenLopHoc = tenLopHoc;
	}
}
