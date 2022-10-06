package service.facility;

import model.facility.Room;

import java.util.List;

public interface IRoomService {
    public void insertRoom (Room room);

    public List<Room> selectAllRoom();

    public boolean deleteRoom (int id);

    public boolean updateRoom (Room room);

}
