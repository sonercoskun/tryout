package com.sonercoskun.isyatirimmalitablolar.service;

import com.sonercoskun.isyatirimmalitablolar.entity.Hisse;
import com.sonercoskun.isyatirimmalitablolar.repository.HisseRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HisseService {
    HisseRepository hisseRepository;
    public HisseService(HisseRepository hisseRepository){
        this.hisseRepository = hisseRepository;
    }
    public List<Hisse> fetchAllShares(){
        return hisseRepository.findAll();
    }
}
