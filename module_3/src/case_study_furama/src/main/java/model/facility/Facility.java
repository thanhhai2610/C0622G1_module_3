package model.facility;

public class Facility {
   protected int id ;
   protected String name ;
   protected int are ;
   protected double cost  ;
   protected int maxPeople  ;
   protected int rentTypeId  ;
   protected int facilityTypeID  ;
   protected String standardRoom  ;
   protected String descriptionOtherConvenience  ;
   protected double poolArea  ;
   protected int numberOfFloors  ;
   protected String facilityFree  ;

    public Facility() {
    }

    public Facility(int id, String name, int are, double cost, int maxPeople, int rentTypeId, int facilityTypeID, String standardRoom, String descriptionOtherConvenience, double poolArea, int numberOfFloors, String facilityFree) {
        this.id = id;
        this.name = name;
        this.are = are;
        this.cost = cost;
        this.maxPeople = maxPeople;
        this.rentTypeId = rentTypeId;
        this.facilityTypeID = facilityTypeID;
        this.standardRoom = standardRoom;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.poolArea = poolArea;
        this.numberOfFloors = numberOfFloors;
        this.facilityFree = facilityFree;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAre() {
        return are;
    }

    public void setAre(int are) {
        this.are = are;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public int getMaxPeople() {
        return maxPeople;
    }

    public void setMaxPeople(int maxPeople) {
        this.maxPeople = maxPeople;
    }

    public int getRentTypeId() {
        return rentTypeId;
    }

    public void setRentTypeId(int rentTypeId) {
        this.rentTypeId = rentTypeId;
    }

    public int getFacilityTypeID() {
        return facilityTypeID;
    }

    public void setFacilityTypeID(int facilityTypeID) {
        this.facilityTypeID = facilityTypeID;
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public String getDescriptionOtherConvenience() {
        return descriptionOtherConvenience;
    }

    public void setDescriptionOtherConvenience(String descriptionOtherConvenience) {
        this.descriptionOtherConvenience = descriptionOtherConvenience;
    }

    public double getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(double poolArea) {
        this.poolArea = poolArea;
    }

    public int getNumberOfFloors() {
        return numberOfFloors;
    }

    public void setNumberOfFloors(int numberOfFloors) {
        this.numberOfFloors = numberOfFloors;
    }

    public String getFacilityFree() {
        return facilityFree;
    }

    public void setFacilityFree(String facilityFree) {
        this.facilityFree = facilityFree;
    }
}
