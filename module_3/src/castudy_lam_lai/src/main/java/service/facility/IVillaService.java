package service.facility;

import model.facility.Villa;

import java.util.List;

public interface IVillaService {
    public void insertVilla(Villa villa);

    public List<Villa> selectAllVilla();

    public boolean deleteVilla(int id);

    public boolean updateVilla(Villa villa);
}
