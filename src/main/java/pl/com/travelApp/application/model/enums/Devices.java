package pl.com.travelApp.application.model.enums;


public enum Devices {
    CAMERA("Camera"),
    TRIPOD("Tripod"),
    MEMORY_CARD("Memory card"),
    SMARTPHONE("Smartphone"),
    SMARTWATCH("Smartwatch"),
    CHARGER("Charger"),
    SELFIE_STICK("Selfie stick"),
    FLASHLIGHT("Flashlight"),
    HEADPHONES("Headphones"),
    LAPTOP("Laptop"),
    MP3("Mp3/Mp4"),
    GPS("GPS"),
    E_READER("E-reader"),
    OTHER("Other");

    private String devices;

    public String getDevices() {
        return devices;
    }

    Devices(String devices) {
        this.devices = devices;
    }
}
