package pl.com.travelApp.application.model.enums;

public enum Transports {
    PLANE("Plane"),
    CAR("Car"),
    BUS("Bus"),
    TRAIN("Train"),
    SCOOTER("Scooter"),
    BIKE("Bike"),
    FERRY("Ferry"),
    TAXI("Taxi");

    private String transport;

    Transports(String transport) {
        this.transport = transport;
    }

    public String getTransport() {
        return transport;
    }
}
