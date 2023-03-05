package com.sonercoskun.isyatirimmalitablolar.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "mali_tablo")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MaliTablo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "share")
    private String share;
    @Column(name = "itemCode")
    public String itemCode;
    @Column(name = "itemDescTr")
    public String itemDescTr;
    @Column(name = "itemDescEng")
    public String itemDescEng;
    @Column(name = "value")
    public Long value;
    @Column(name = "year")
    private String year;
    @Column(name = "period")
    private Integer period;
}
