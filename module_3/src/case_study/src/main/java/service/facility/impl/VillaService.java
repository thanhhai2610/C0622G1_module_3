package service.facility.impl;

import model.facility.House;
import model.facility.Villa;
import reponsitory.facility.IHouseRepo;
import reponsitory.facility.IVillaRepo;
import reponsitory.facility.impl.HouseRepo;
import reponsitory.facility.impl.VillaRepoRepo;
import service.facility.IHouseService;

import java.util.List;

public class VillaService implements IVillaRepo {
    IVillaRepo villaRepo = new VillaRepoRepo();

    @Override
    public void insertVilla(Villa villa) {
        villaRepo.insertVilla(villa);
    }

    @Override
    public List<Villa> selectAllVilla() {
        return villaRepo.selectAllVilla();
    }

    @Override
    public boolean deleteVilla(int id) {
        return villaRepo.deleteVilla(id);
    }

    @Override
    public boolean updateVilla(Villa villa) {
        return villaRepo.updateVilla(villa);
    }
}
