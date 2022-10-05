package model.facility;

public class House extends Facility {
    protected String standardRoom;
    protected String descriptionOtherConvenience;
    protected double poolArea;

    public House(String standardRoom, String descriptionOtherConvenience, double poolArea) {
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.poolArea = poolArea;
    }

    public House(int id, String name, int are, double cost, int maxPeople, int rentTypeId, int facilityTypeID, String standardRoom, String descriptionOtherConvenience, double poolArea, int numberOfFloors, String facilityFree, String standardRoom1, String descriptionOtherConvenience1, double poolArea1) {
        super(id, name, are, cost, maxPeople, rentTypeId, facilityTypeID, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);
        this.standardRoom = standardRoom1;
        this.descriptionOtherConvenience = descriptionOtherConvenience1;
        this.poolArea = poolArea1;
    }

    @Override
    public String getStandardRoom() {
        return standardRoom;
    }

    @Override
    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    @Override
    public String getDescriptionOtherConvenience() {
        return descriptionOtherConvenience;
    }

    @Override
    public void setDescriptionOtherConvenience(String descriptionOtherConvenience) {
        this.descriptionOtherConvenience = descriptionOtherConvenience;
    }

    @Override
    public double getPoolArea() {
        return poolArea;
    }

    @Override
    public void setPoolArea(double poolArea) {
        this.poolArea = poolArea;
    }

}
