package Models;

import java.io.Serializable;

public class Khoa implements Serializable {
    private static final long serialVersionUID = 1L;

    private int ID_Khoa;
    private String TenKhoa;
    private int TrangThai;

    public Khoa() {
    }

    public int getID_Khoa() {
        return ID_Khoa;
    }

    public void setID_Khoa(int ID_Khoa) {
        this.ID_Khoa = ID_Khoa;
    }

    public String getTenKhoa() {
        return TenKhoa;
    }

    public void setTenKhoa(String TenKhoa) {
        this.TenKhoa = TenKhoa;
    }

    public int getTrangThai() {
        return TrangThai;
    }

    public void setTrangThai(int TrangThai) {
        this.TrangThai = TrangThai;
    }
}
