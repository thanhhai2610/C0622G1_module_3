package service;

import model.HoKhau;

import java.util.List;

public interface IHoKhauService {
    public void insertHoKhau(HoKhau hoKhau);

    public List<HoKhau> selectAllHoKhau();

    public List<HoKhau> selectHoKhauName(String name);

    public HoKhau selectHoKhauId(int id);

    public boolean deleteHoKhau(int id);

    public boolean updateHoKhau(HoKhau hoKhau);
}
