package Models;

import java.io.Serializable;

public class ThamGiaLopHoc implements Serializable {
    private static final long serialVersionUID = 1L;

    private String ID_SinhVien;
    private int ID_LopHoc;
    private int ID_BangDiem;
    private int TrangThai;

    public ThamGiaLopHoc() {
    }

    public String getID_SinhVien() {
        return ID_SinhVien;
    }

    public void setID_SinhVien(String ID_SinhVien) {
        this.ID_SinhVien = ID_SinhVien;
    }

    public int getID_LopHoc() {
        return ID_LopHoc;
    }

    public void setID_LopHoc(int ID_LopHoc) {
        this.ID_LopHoc = ID_LopHoc;
    }

    public int getID_BangDiem() {
        return ID_BangDiem;
    }

    public void setID_BangDiem(int ID_BangDiem) {
        this.ID_BangDiem = ID_BangDiem;
    }

    public int getTrangThai() {
        return TrangThai;
    }

    public void setTrangThai(int TrangThai) {
        this.TrangThai = TrangThai;
    }
}
