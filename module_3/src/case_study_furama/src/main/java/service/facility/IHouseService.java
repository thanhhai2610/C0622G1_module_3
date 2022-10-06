package service.facility;

import model.facility.House;

import java.util.List;

public interface IHouseService {
    public void insertHouse(House house);

    public List<House> selectAllHouse();

    public boolean deleteHouse(int id);

    public boolean updateHouse(House house);

}
