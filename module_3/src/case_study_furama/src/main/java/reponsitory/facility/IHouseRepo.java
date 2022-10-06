package reponsitory.facility;

import model.facility.Facility;
import model.facility.House;

import java.util.List;

public interface IHouseRepo {
    public void insertHouse(House house);

    public List<House> selectAllHouse();

    public boolean deleteHouse(int id);

    public boolean updateHouse(House house);

}
