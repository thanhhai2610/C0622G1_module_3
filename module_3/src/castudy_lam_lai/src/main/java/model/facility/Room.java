package model.facility;

public class Room extends Facility {
    protected String facility_free;

    public Room(String facility_free) {
        this.facility_free = facility_free;
    }

    public Room(int id, String name, int are, double cost, int maxPeople, int rentTypeId, int facilityTypeID, String standardRoom, String descriptionOtherConvenience, double poolArea, int numberOfFloors, String facilityFree, String facility_free) {
        super(id, name, are, cost, maxPeople, rentTypeId, facilityTypeID, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);
        this.facility_free = facility_free;
    }

    public String getFacility_free() {
        return facility_free;
    }

    public void setFacility_free(String facility_free) {
        this.facility_free = facility_free;
    }
}
