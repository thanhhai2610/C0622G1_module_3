package service.facility.impl;

import model.facility.Room;
import reponsitory.facility.IRoomRepo;
import reponsitory.facility.impl.RoomRepo;
import service.facility.IRoomService;

import java.util.List;

public class RoomService implements IRoomService {
    IRoomRepo roomRepo = new RoomRepo();
    @Override
    public void insertRoom(Room room) {
        roomRepo.insertRoom(room);
    }

    @Override
    public List<Room> selectAllRoom() {
        return roomRepo.selectAllRoom();
    }

    @Override
    public boolean deleteRoom(int id) {
        return roomRepo.deleteRoom(id);
    }

    @Override
    public boolean updateRoom(Room room) {
        return roomRepo.updateRoom(room);
    }
}
