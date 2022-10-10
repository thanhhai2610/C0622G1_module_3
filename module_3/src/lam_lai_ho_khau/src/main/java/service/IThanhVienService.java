package service;

import model.ThanhVien;

import java.util.List;

public interface IThanhVienService {
    void insertThanhVien(ThanhVien thanhVien);

    List<ThanhVien> selectAllThanhVien();

    List<ThanhVien> selectThanhVienName(String name);

    ThanhVien selectThanhVienId(int id);

    boolean deleteThanhVien(int id);

    boolean updateThanhVien(ThanhVien thanhVien);
}
