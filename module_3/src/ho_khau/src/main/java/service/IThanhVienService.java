package service;

import model.ThanhVien;

import java.util.List;

public interface IThanhVienService {
    public void insertThanhVien(ThanhVien thanhVien);

    public List<ThanhVien> selectAllThanhVien();

    public List<ThanhVien> selectThanhVienName(String name);

    public ThanhVien selectThanhVienId(int id);

    public boolean deleteThanhVien(int id);

    public boolean updateThanhVien(ThanhVien employee);
}
