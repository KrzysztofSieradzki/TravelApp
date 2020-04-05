package pl.com.travelApp.application.model.enums;

public enum Other {
    BELT_PACK("Belt pack"),
    FIRST_AID_KIT("First aid kit"),
    CARRY_ON_BAGGAGE("Carry-on baggage"),
    RAIN_COVER("Rain cover"),
    TENT("Tent"),
    SLEEPING_BAG("Sleeping bag"),
    ROPE("Rope"),
    HAMMOCK("Hammock"),
    FIELD_KITCHEN("Filed kitchen"),
    MEDICINES("Medicines"),
    KNIFE("Knife"),
    AXE("Axe"),
    CLIMBING_EQUIPMENT("Climbing equipment"),
    DIVING_EQUIPMENT("Diving equipment"),
    TOILET_PAPER("Toilet paper"),
    GARBAGE_BAGS("Garbage bags"),
    NOUS("Nous");

    private String other;

    Other(String other) {
        this.other = other;
    }

    public String getOther() {
        return other;
    }
}
