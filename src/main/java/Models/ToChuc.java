package Models;

import java.io.Serializable;

public class ToChuc implements Serializable {
    private static final long serialVersionUID = 1L;

    private int ID_HoatDong;
    private int ID_Khoa;
    private int TrangThai;

    public ToChuc() {
    }

    public int getID_HoatDong() {
        return ID_HoatDong;
    }

    public void setID_HoatDong(int ID_HoatDong) {
        this.ID_HoatDong = ID_HoatDong;
    }

    public int getID_Khoa() {
        return ID_Khoa;
    }

    public void setID_Khoa(int ID_Khoa) {
        this.ID_Khoa = ID_Khoa;
    }

    public int getTrangThai() {
        return TrangThai;
    }

    public void setTrangThai(int TrangThai) {
        this.TrangThai = TrangThai;
    }
}
