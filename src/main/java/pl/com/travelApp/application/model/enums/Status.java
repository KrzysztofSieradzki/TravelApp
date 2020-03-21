package pl.com.travelApp.application.model.enums;

public enum Status {
    VISITED("already done"), TO_VISIT("I woulde like to visit");

    private String status;

    Status(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }
}
