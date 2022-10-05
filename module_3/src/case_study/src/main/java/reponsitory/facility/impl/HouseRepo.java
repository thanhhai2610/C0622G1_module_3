package reponsitory.facility.impl;

import model.facility.House;
import reponsitory.facility.IHouseRepo;

import java.util.List;

public class HouseRepo implements IHouseRepo {


    @Override
    public void insertHouse(House house) {

    }

    @Override
    public List<model.facility.House> selectAllHouse() {
        return null;
    }

    @Override
    public boolean deleteHouse(int id) {
        return false;
    }

    @Override
    public boolean updateHouse(House house) {
        return false;
    }
}
