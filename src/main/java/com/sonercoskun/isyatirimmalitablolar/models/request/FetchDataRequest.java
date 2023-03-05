package com.sonercoskun.isyatirimmalitablolar.models.request;

import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.io.Serializable;

@Data
@RequiredArgsConstructor
public class FetchDataRequest implements Serializable {
    private String companyCode;
    private String exchange;
    private String financialGroup;
    private String year;
}
