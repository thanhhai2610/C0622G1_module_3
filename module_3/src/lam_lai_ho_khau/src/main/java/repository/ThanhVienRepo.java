package repository;

import java.util.List;

public class ThanhVienRepo implements IThanhVien {


    @Override
    public void insertThanhVien(model.ThanhVien thanhVien) {

    }

    @Override
    public List<model.ThanhVien> selectAllThanhVien() {
        return null;
    }

    @Override
    public List<model.ThanhVien> selectThanhVienName(String name) {
        return null;
    }

    @Override
    public model.ThanhVien selectThanhVienId(int id) {
        return null;
    }

    @Override
    public boolean deleteThanhVien(int id) {
        return false;
    }

    @Override
    public boolean updateThanhVien(model.ThanhVien thanhVien) {
        return false;
    }
}
