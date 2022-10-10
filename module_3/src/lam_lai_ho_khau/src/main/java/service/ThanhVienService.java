package service;

import model.ThanhVien;
import repository.IThanhVien;

import java.util.List;

public class ThanhVienService implements IThanhVienService {
    @Override
    public void insertThanhVien(ThanhVien thanhVien) {

    }

    @Override
    public List<ThanhVien> selectAllThanhVien() {
        return null;
    }

    @Override
    public List<ThanhVien> selectThanhVienName(String name) {
        return null;
    }

    @Override
    public ThanhVien selectThanhVienId(int id) {
        return null;
    }

    @Override
    public boolean deleteThanhVien(int id) {
        return false;
    }

    @Override
    public boolean updateThanhVien(ThanhVien thanhVien) {
        return false;
    }
}
