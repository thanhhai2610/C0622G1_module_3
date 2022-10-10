package repository.impl;

import model.HoKhau;
import repository.IHoKhauRepo;

import java.util.List;

public class HoKhauRepo implements IHoKhauRepo {



    @Override
    public void insertHoKhau(HoKhau hoKhau) {

    }

    @Override
    public List<model.HoKhau> selectAllHoKhau() {
        return null;
    }

    @Override
    public List<model.HoKhau> selectHoKhauName(String name) {
        return null;
    }

    @Override
    public model.HoKhau selectHoKhauId(int id) {
        return null;
    }

    @Override
    public boolean deleteHoKhau(int id) {
        return false;
    }

    @Override
    public boolean updateHoKhau(model.HoKhau hoKhau) {
        return false;
    }
}
