package pl.com.travelApp.application.model.enums;

public enum Categories {
    DEVICES("Electronic devices"),
    SPECIAL_CLOTHES("Special clothes"),
    DOCUMENTS("Documents"),
    OTHER("Other");

    private String category;

    Categories(String category) {
        this.category = category;
    }

    public String getCategory() {
        return category;
    }
}
