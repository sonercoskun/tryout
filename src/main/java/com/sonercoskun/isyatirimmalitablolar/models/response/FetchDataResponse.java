package com.sonercoskun.isyatirimmalitablolar.models.response;

import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.io.Serializable;

@Data
@RequiredArgsConstructor
public class FetchDataResponse implements Serializable {
    private String status;
}
