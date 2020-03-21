package pl.com.travelApp.application.model.enums;

public enum Status {
    VISITED("already done"), TO_DO("I woulde like to see");

    private String status;

    Status(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }
}
