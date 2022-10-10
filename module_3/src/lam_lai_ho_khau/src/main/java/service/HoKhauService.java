package service;

import model.HoKhau;
import model.ThanhVien;
import repository.HoKhauRepo;
import repository.IHoKhau;
import repository.IThanhVien;
import repository.ThanhVienRepo;

import java.util.List;

public class HoKhauService implements IHoKhauService {
    IHoKhau hoKhauRepo = new HoKhauRepo();

    @Override
    public void insertHoKhau(HoKhau hoKhau) {
        hoKhauRepo.insertHoKhau(hoKhau);
    }

    @Override
    public List<HoKhau> selectAllHoKhau() {
        return hoKhauRepo.selectAllHoKhau();
    }

    @Override
    public List<HoKhau> selectHoKhauName(String name) {
        return null;
    }

    @Override
    public HoKhau selectHoKhauId(int id) {
        return null;
    }

    @Override
    public List<ThanhVien> selectThanhVienID(int id) {
        return hoKhauRepo.selectThanhVienID(id);
    }

    @Override
    public boolean deleteHoKhau(int id) {
        return false;
    }

    @Override
    public boolean updateHoKhau(HoKhau hoKhau) {
        return hoKhauRepo.updateHoKhau(hoKhau);
    }
}
