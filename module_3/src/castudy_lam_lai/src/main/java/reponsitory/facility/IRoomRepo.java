package reponsitory.facility;

import model.facility.Facility;
import model.facility.House;
import model.facility.Room;

import java.util.List;

public interface IRoomRepo {
    public void insertRoom (Room room);

    public List<Room> selectAllRoom();

    public boolean deleteRoom (int id);

    public boolean updateRoom (Room room);

}
