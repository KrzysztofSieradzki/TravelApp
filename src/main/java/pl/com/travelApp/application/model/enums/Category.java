package pl.com.travelApp.application.model.enums;

public enum Category {
    DEVICES("Electronic devices"),
    SPECIAL_CLOTHES("Special clothes"),
    DOCUMENTS("Documents"),
    MEDICINES("Medicines"),
    COSMETICS("Cosmetics"),
    OTHER("Other");

    private String category;

    Category(String category) {
        this.category = category;
    }

    public String getCategory() {
        return category;
    }
}
