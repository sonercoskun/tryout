package com.sonercoskun.isyatirimmalitablolar.models.dto;

import com.sonercoskun.isyatirimmalitablolar.entity.Hisse;
import com.sonercoskun.isyatirimmalitablolar.entity.HisseOptions;
import lombok.Data;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static java.util.stream.Collectors.groupingBy;

@Component
@Data
public class HisseOptionsDTO implements Serializable {

    private String hisse;
    private List<String> options;
    public Map<String, List<HisseOptions>> convertor(List<HisseOptions> hisseOptionsList){
        return hisseOptionsList.stream().collect(Collectors.groupingBy(HisseOptions::getHisse));
    }
}
