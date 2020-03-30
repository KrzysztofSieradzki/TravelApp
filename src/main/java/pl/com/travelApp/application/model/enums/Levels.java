package pl.com.travelApp.application.model.enums;

public enum Levels {
    PADAWAN(0),
    JUNIOR_TOURIST(1),
    TOURIST(3),
    SENIOR_TOURIST(6),
    JUNIOR_VOYAGER(12),
    VOYAGER(20),
    SENIOR_VOYAGER(30),
    ADVENTURER(42),
    GLOBETROTTER(60),
    JAMES_COOK(84),
    INDIANA_JONES(100);

    private Integer level;

    Levels(Integer level) {
        this.level = level;
    }

    public Integer getLevel() {
        return level;
    }
}
