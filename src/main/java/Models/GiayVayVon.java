package Models;

import java.io.Serializable;
import java.util.Date;

public class GiayVayVon implements Serializable {
    private static final long serialVersionUID = 1L;

    private int ID_GiayVay;
    private String NoiDung;
    private Date NgayNhan;
    private String ID_SinhVien;
    private int ID_DichVu;
    private int SoTien;
    private int TrangThai;

    public GiayVayVon() {
    }

    public int getID_GiayVay() {
        return ID_GiayVay;
    }

    public void setID_GiayVay(int ID_GiayVay) {
        this.ID_GiayVay = ID_GiayVay;
    }

    public String getNoiDung() {
        return NoiDung;
    }

    public void setNoiDung(String NoiDung) {
        this.NoiDung = NoiDung;
    }

    public Date getNgayNhan() {
        return NgayNhan;
    }

    public void setNgayNhan(Date NgayNhan) {
        this.NgayNhan = NgayNhan;
    }

    public String getID_SinhVien() {
        return ID_SinhVien;
    }

    public void setID_SinhVien(String ID_SinhVien) {
        this.ID_SinhVien = ID_SinhVien;
    }

    public int getID_DichVu() {
        return ID_DichVu;
    }

    public void setID_DichVu(int ID_DichVu) {
        this.ID_DichVu = ID_DichVu;
    }

    public int getSoTien() {
        return SoTien;
    }

    public void setSoTien(int SoTien) {
        this.SoTien = SoTien;
    }

    public int getTrangThai() {
        return TrangThai;
    }

    public void setTrangThai(int TrangThai) {
        this.TrangThai = TrangThai;
    }
}
