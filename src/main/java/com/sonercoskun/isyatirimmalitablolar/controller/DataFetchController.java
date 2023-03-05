package com.sonercoskun.isyatirimmalitablolar.controller;

import com.sonercoskun.isyatirimmalitablolar.entity.Hisse;
import com.sonercoskun.isyatirimmalitablolar.entity.MaliTablo;
import com.sonercoskun.isyatirimmalitablolar.models.request.FetchDataRequest;
import com.sonercoskun.isyatirimmalitablolar.models.response.FetchDataResponse;
import com.sonercoskun.isyatirimmalitablolar.models.response.MaliTabloResponse;
import com.sonercoskun.isyatirimmalitablolar.models.response.Value;
import com.sonercoskun.isyatirimmalitablolar.repository.MaliTabloRepository;
import com.sonercoskun.isyatirimmalitablolar.service.HisseService;
import com.sonercoskun.isyatirimmalitablolar.service.MaliTabloService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

@RestController()
@RequestMapping("api")
public class DataFetchController {
    RestTemplate restTemplate;
    MaliTabloService maliTabloService;
    HisseService hisseService;
    public DataFetchController(MaliTabloService maliTabloService, HisseService hisseService){
        this.maliTabloService = maliTabloService;
        this.hisseService = hisseService;
        this.restTemplate = new RestTemplate();
    }
    @GetMapping()
    private ResponseEntity<FetchDataResponse> fetchData(@RequestBody FetchDataRequest fetchDataRequest) {
        List<Hisse> hisses = hisseService.fetchAllShares();
        try {
            for (Hisse hisse : hisses) {
                ResponseEntity<MaliTabloResponse> maliTabloResponseResponseEntity = restTemplate.getForEntity("https://www.isyatirim.com.tr/_layouts/15/IsYatirim.Website/Common/Data.aspx/MaliTablo?companyCode=" + hisse.getHisse() + "&exchange=TRY&financialGroup=XI_29&year1=" + fetchDataRequest.getYear() + "&period1=12&year2=" + fetchDataRequest.getYear() + "&period2=9&year3=" + fetchDataRequest.getYear() + "&period3=6&year4=" + fetchDataRequest.getYear() + "&period4=3&_=1674127365345", MaliTabloResponse.class);
                if (!maliTabloResponseResponseEntity.getStatusCode().is2xxSuccessful() || (maliTabloResponseResponseEntity.getBody().getValue().size() == 0)) {
                    continue;
                }
                MaliTabloResponse maliTabloResponse = maliTabloResponseResponseEntity.getBody();
                List<MaliTablo> maliTablos = new ArrayList<>();
                for (Value value : maliTabloResponse.getValue()) {
                    for(int i = 1; i < 5; i++){
                        MaliTablo maliTablo = new MaliTablo();
                        maliTablo.setShare(hisse.getHisse());
                        switch (i) {
                            case 1 -> {
                                maliTablo.setValue(value.getValue1() != null ? Long.parseLong(value.value1) : -99);
                                maliTablo.setPeriod(12);
                            }
                            case 2 -> {
                                maliTablo.setValue(value.getValue2() != null ? Long.parseLong(value.value2) : -99);
                                maliTablo.setPeriod(9);
                            }
                            case 3 -> {
                                maliTablo.setValue(value.getValue3() != null ? Long.parseLong(value.value3) : -99);
                                maliTablo.setPeriod(6);
                            }
                            case 4 -> {
                                maliTablo.setValue(value.getValue4() != null ? Long.parseLong(value.value4) : -99);
                                maliTablo.setPeriod(3);
                            }
                        }
                        maliTablo.setYear(fetchDataRequest.getYear());
                        maliTablo.setItemCode(value.itemCode != null ? value.itemCode : "itemCode");
                        maliTablo.setItemDescTr(value.itemDescTr != null ? value.itemDescTr : "trDesc");
                        maliTablo.setItemDescEng(value.itemDescEng != null ? value.itemDescEng : "engDesc" );
                        maliTablos.add(maliTablo);
                    }
                }
                maliTabloService.saveMaliTabloRecords(maliTablos);
            }
        }catch (Exception exception) {
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok().build();
    }
}
