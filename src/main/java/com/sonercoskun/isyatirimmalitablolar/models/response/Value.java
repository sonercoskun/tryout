package com.sonercoskun.isyatirimmalitablolar.models.response;

import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.io.Serializable;

@Data
@RequiredArgsConstructor
public class Value implements Serializable {
    public String itemCode;
    public String itemDescTr;
    public String itemDescEng;
    public String value1;
    public String value2;
    public String value3;
    public String value4;
}
