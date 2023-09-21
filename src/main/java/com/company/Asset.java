package com.company;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Asset {
    public String asset;
    public String free;
    public String locked;
    public String freeze;
    public String withdrawing;
    public String ipoable;
    public String btcValuation;
}
