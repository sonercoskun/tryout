package com.company;

import java.math.BigDecimal;

public class Convert {
    public static void main(String[] args) {
        BigDecimal originalValue = new BigDecimal("123.49"); // Your original BigDecimal value
        BigDecimal modifiedValue = changeLastDigit9To1(originalValue);

        System.out.println("Original Value: " + originalValue);
        System.out.println("Modified Value: " + modifiedValue);
    }

    public static BigDecimal changeLastDigit9To1(BigDecimal originalValue) {
        // Get the integer part and fraction part of the BigDecimal
        BigDecimal integerPart = originalValue.setScale(0, BigDecimal.ROUND_DOWN);
        BigDecimal fractionPart = originalValue.subtract(integerPart);

        String lastDigit = fractionPart.toString();
        if (lastDigit.endsWith("9")) {

            BigDecimal newIntegerPart = integerPart.subtract(BigDecimal.valueOf(9)).add(BigDecimal.ONE);
            BigDecimal modifiedValue = newIntegerPart.add(fractionPart);
            return modifiedValue;
        } else {
            return originalValue;
        }
    }
}
