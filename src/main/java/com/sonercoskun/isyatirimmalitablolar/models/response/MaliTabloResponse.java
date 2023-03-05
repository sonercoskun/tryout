package com.sonercoskun.isyatirimmalitablolar.models.response;

import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.io.Serializable;
import java.util.ArrayList;

@Data
@RequiredArgsConstructor
public class MaliTabloResponse implements Serializable {
    public boolean ok;
    public Object errorCode;
    public Object errorDescription;
    public String transactionId;
    public ArrayList<Value> value;
}
