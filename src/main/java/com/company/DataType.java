package com.company;

public enum DataType {

    TWO_G("2G"),
    FOUR_G("4G"),
    LATE_NIGHT("LATE_NIGHT"),
    OFF_PEAK("OFF_PEAK");


    private final String value;

    DataType(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public static DataType fromString(String str) {
        for (DataType dataType : values()) {
            if (dataType.getValue().equalsIgnoreCase(str)) {
                return dataType;
            }
        }
        return null;
    }
}
