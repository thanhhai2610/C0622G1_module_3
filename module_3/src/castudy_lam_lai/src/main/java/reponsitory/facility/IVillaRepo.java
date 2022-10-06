package reponsitory.facility;

import model.facility.House;
import model.facility.Villa;

import java.util.List;

public interface IVillaRepo {
    public void insertVilla(Villa villa);

    public List<Villa> selectAllVilla();

    public boolean deleteVilla(int id);

    public boolean updateVilla(Villa villa);
}
