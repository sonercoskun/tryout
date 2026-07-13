package com.company;

import com.company.interfaces.EmptyInterface;
import lombok.Value;

public class EmptyMain {
    public static final EmptyClass emptyInterface = new EmptyClass();
    public static void main(String[] args) {
        DTO dto = new DTO();
        emptyInterface.first();
    }
}
