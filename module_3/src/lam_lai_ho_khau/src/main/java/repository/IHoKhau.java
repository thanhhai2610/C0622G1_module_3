package repository;

import model.HoKhau;
import model.ThanhVien;

import java.util.List;

public interface IHoKhau  {

    void insertHoKhau(HoKhau hoKhau);

    List<HoKhau> selectAllHoKhau();

    List<HoKhau> selectHoKhauName(String name);

    HoKhau selectHoKhauId(int id);

    List<ThanhVien> selectThanhVienID(int id);
    boolean deleteHoKhau(int id);

    boolean updateHoKhau(HoKhau hoKhau);

}
