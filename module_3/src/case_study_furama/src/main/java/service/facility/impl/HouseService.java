package service.facility.impl;

import model.facility.House;
import reponsitory.facility.IHouseRepo;
import reponsitory.facility.impl.HouseRepo;
import service.facility.IHouseService;

import java.util.List;

public class HouseService implements IHouseService {
    IHouseRepo houseRepo = new HouseRepo();
    @Override
    public void insertHouse(House house) {
        houseRepo.insertHouse(house);
    }

    @Override
    public List<House> selectAllHouse() {
        return houseRepo.selectAllHouse();
    }

    @Override
    public boolean deleteHouse(int id) {
        return houseRepo.deleteHouse(id);
    }

    @Override
    public boolean updateHouse(House house) {
        return houseRepo.updateHouse(house);
    }
}
