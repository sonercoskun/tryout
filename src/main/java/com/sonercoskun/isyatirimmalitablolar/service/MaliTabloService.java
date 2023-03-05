package com.sonercoskun.isyatirimmalitablolar.service;

import com.sonercoskun.isyatirimmalitablolar.entity.MaliTablo;
import com.sonercoskun.isyatirimmalitablolar.repository.MaliTabloRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class MaliTabloService {
    MaliTabloRepository maliTabloRepository;
    public MaliTabloService(MaliTabloRepository maliTabloRepository){
        this.maliTabloRepository = maliTabloRepository;
    }
    public boolean saveMaliTabloRecords(List<MaliTablo> maliTablo){
        try {
            maliTabloRepository.saveAll(maliTablo);
        }catch (Exception exception){
            log.error("SAVE ERROR = ",exception);
            return false;
        }
        return true;
    }
}
