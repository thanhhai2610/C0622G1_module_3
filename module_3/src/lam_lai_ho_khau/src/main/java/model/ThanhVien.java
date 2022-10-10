package model;

public class ThanhVien {
    private int cmnd;
    private String hoVaTen;
    private String ngaySinh;
    private int maHoKhau;

    public ThanhVien(int cmnd, String hoVaTen, String ngaySinh) {
        this.cmnd = cmnd;
        this.hoVaTen = hoVaTen;
        this.ngaySinh = ngaySinh;
    }

    public ThanhVien() {
    }

    public int getMaHoKhau() {
        return maHoKhau;
    }

    public void setMaHoKhau(int maHoKhau) {
        this.maHoKhau = maHoKhau;
    }

    public ThanhVien(int cmnd, String hoVaTen, String ngaySinh, int maHoKhau) {
        this.cmnd = cmnd;
        this.hoVaTen = hoVaTen;
        this.ngaySinh = ngaySinh;
        this.maHoKhau = maHoKhau;
    }

    public int getCmnd() {
        return cmnd;
    }

    public void setCmnd(int cmnd) {
        this.cmnd = cmnd;
    }

    public String getHoVaTen() {
        return hoVaTen;
    }

    public void setHoVaTen(String hoVaTen) {
        this.hoVaTen = hoVaTen;
    }

    public String getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(String ngaySinh) {
        this.ngaySinh = ngaySinh;
    }
}
