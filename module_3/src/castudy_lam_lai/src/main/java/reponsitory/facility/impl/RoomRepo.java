package reponsitory.facility.impl;

import model.facility.House;
import model.facility.Room;
import reponsitory.facility.IHouseRepo;
import reponsitory.facility.IRoomRepo;

import java.util.List;

public class RoomRepo implements IRoomRepo {


    @Override
    public void insertRoom(Room room) {

    }

    @Override
    public List<Room> selectAllRoom() {
        return null;
    }

    @Override
    public boolean deleteRoom(int id) {
        return false;
    }

    @Override
    public boolean updateRoom(Room room) {
        return false;
    }
}
