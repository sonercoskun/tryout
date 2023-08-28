package com.sonercoskun.isyatirimmalitablolar.controller;

import com.sonercoskun.isyatirimmalitablolar.entity.HisseOptions;
import com.sonercoskun.isyatirimmalitablolar.models.dto.HisseOptionsDTO;
import com.sonercoskun.isyatirimmalitablolar.service.HisseService;
import com.sonercoskun.isyatirimmalitablolar.service.MaliTabloService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("userfeed")
public class UserFeedController {
    private HisseService hisseService;
    private MaliTabloService maliTabloService;

    private HisseOptionsDTO hisseOptionsDTO;

    public UserFeedController (HisseService hisseService, MaliTabloService maliTabloService, HisseOptionsDTO hisseOptionsDTO){
        this.maliTabloService = maliTabloService;
        this.hisseService = hisseService;
        this.hisseOptionsDTO = hisseOptionsDTO;
    }

    @GetMapping(name = "/hisseoptions")
    public Map<String, List<HisseOptions>> getHisseOptionsList(){
          return hisseOptionsDTO.convertor(hisseService.getHisseOptionsList());
    }

    //TODO  Grafiklere basılacak data gönderilecek
    // param  Yıl, dönem, dönen varlıklar, kısa vadeli yabancı kaynaklar, özkaynaklar, gelir tablosu(net kar)
    //TODO
    //TODO
    //TODO
    //TODO
}
