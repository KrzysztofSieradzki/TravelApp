package pl.com.travelApp.application.model.enums;

public enum Documents {
    ID_CARD("Id card"),
    PASSPORT("Passport"),
    DRIVING_LICENSE("Driving license"),
    INTERNATIONAL_DRIVING_LICENSE("International driving license"),
    TRAVEL_INSURANCE("Travel insurance"),
    FLIGHT_TICKETS("Flight tickets"),
    VISA("Visa"),
    CAR_RENTAL_DOCUMENTS("Car rental documents"),
    VACCINATION_CARD("Vaccination card"),
    OTHER("Other");

    private String documents;

    public String getDocuments() {
        return documents;
    }

    Documents(String documents) {
        this.documents = documents;
    }
}
