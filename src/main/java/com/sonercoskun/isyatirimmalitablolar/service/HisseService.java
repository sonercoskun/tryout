package com.sonercoskun.isyatirimmalitablolar.service;

import com.sonercoskun.isyatirimmalitablolar.entity.Hisse;
import com.sonercoskun.isyatirimmalitablolar.entity.HisseOptions;
import com.sonercoskun.isyatirimmalitablolar.repository.HisseOptionsRepository;
import com.sonercoskun.isyatirimmalitablolar.repository.HisseRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HisseService {
    HisseRepository hisseRepository;
    HisseOptionsRepository hisseOptionsRepository;
    public HisseService(HisseRepository hisseRepository, HisseOptionsRepository hisseOptionsRepository){
        this.hisseRepository = hisseRepository;
        this.hisseOptionsRepository = hisseOptionsRepository;
    }
    public List<Hisse> fetchAllShares(){
        return hisseRepository.findAll();
    }

    public List<HisseOptions> getHisseOptionsList(){
        return hisseOptionsRepository.findAll();
    }
}
