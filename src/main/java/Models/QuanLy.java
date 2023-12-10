package Models;

import java.io.Serializable;
import java.util.Date;

public class QuanLy implements Serializable {
    private static final long serialVersionUID = 1L;

    private int ID_QuanLy;
    private String HoTen;
    private String CCCD;
    private String GioiTinh;
    private Date NgaySinh;
    private String SDT;
    private String Email;
    private int ID_TaiKhoan;
    private int TrangThai;

    public QuanLy() {
    }
    
    

    public QuanLy(int iD_QuanLy, String hoTen, String cCCD, String gioiTinh, Date ngaySinh, String sDT, String email) {
		super();
		ID_QuanLy = iD_QuanLy;
		HoTen = hoTen;
		CCCD = cCCD;
		GioiTinh = gioiTinh;
		NgaySinh = ngaySinh;
		SDT = sDT;
		Email = email;
	}



	public int getID_QuanLy() {
        return ID_QuanLy;
    }

    public void setID_QuanLy(int ID_QuanLy) {
        this.ID_QuanLy = ID_QuanLy;
    }

    public String getHoTen() {
        return HoTen;
    }

    public void setHoTen(String HoTen) {
        this.HoTen = HoTen;
    }

    public String getCCCD() {
        return CCCD;
    }

    public void setCCCD(String CCCD) {
        this.CCCD = CCCD;
    }

    public String getGioiTinh() {
        return GioiTinh;
    }

    public void setGioiTinh(String GioiTinh) {
        this.GioiTinh = GioiTinh;
    }

    public Date getNgaySinh() {
        return NgaySinh;
    }

    public void setNgaySinh(Date NgaySinh) {
        this.NgaySinh = NgaySinh;
    }

    public String getSDT() {
        return SDT;
    }

    public void setSDT(String SDT) {
        this.SDT = SDT;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public int getID_TaiKhoan() {
        return ID_TaiKhoan;
    }

    public void setID_TaiKhoan(int ID_TaiKhoan) {
        this.ID_TaiKhoan = ID_TaiKhoan;
    }

    public int getTrangThai() {
        return TrangThai;
    }

    public void setTrangThai(int TrangThai) {
        this.TrangThai = TrangThai;
    }
}
