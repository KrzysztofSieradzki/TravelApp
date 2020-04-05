package pl.com.travelApp.application.model.enums;

public enum Clothes {
    SUNGLASSES("Sunglasses"),
    FLIP_FLOPS("Flip flops"),
    SANDALS("Sandals"),
    SWIMMING_SHOES("Swimming shoes"),
    SWIM_SUIT("Swim suit"),
    PAREO("Pareo"),
    HAT("Hat"),
    MOUNTAIN_BOOTS("Mountain boots"),
    RAIN_JACKET("Rain jacket"),
    RAINCOAT("Raincoat"),
    CLIMBING_GLOVES("Climbing gloves"),
    TREKKING_SHOES("Trekking shoes"),
    OTHER("Other");

    private String clothes;

    Clothes(String clothes) {
        this.clothes = clothes;
    }

    public String getClothes() {
        return clothes;
    }
}
