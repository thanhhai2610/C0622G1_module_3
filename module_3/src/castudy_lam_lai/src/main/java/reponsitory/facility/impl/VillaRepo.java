package reponsitory.facility.impl;

import model.facility.Villa;
import reponsitory.facility.IVillaRepo;

import java.util.List;

public class VillaRepo implements IVillaRepo {
    @Override
    public void insertVilla(Villa villa) {

    }

    @Override
    public List<model.facility.Villa> selectAllVilla() {
        return null;
    }

    @Override
    public boolean deleteVilla(int id) {
        return false;
    }

    @Override
    public boolean updateVilla(Villa villa) {
        return false;
    }
}
