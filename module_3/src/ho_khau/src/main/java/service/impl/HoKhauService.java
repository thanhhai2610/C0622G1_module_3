package service.impl;

import model.HoKhau;
import repository.IHoKhauRepo;
import repository.IThanhVienRepo;
import repository.impl.HoKhauRepo;
import repository.impl.ThanhVienRepo;
import service.IHoKhauService;

import java.util.List;

public class HoKhauService implements IHoKhauService {
IHoKhauRepo hoKhauRepo = new HoKhauRepo();
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
        return hoKhauRepo.selectHoKhauName(name);
    }

    @Override
    public HoKhau selectHoKhauId(int id) {
        return hoKhauRepo.selectHoKhauId(id);
    }

    @Override
    public boolean deleteHoKhau(int id) {
        return false;
    }

    @Override
    public boolean updateHoKhau(HoKhau hoKhau) {
        return false;
    }
}
