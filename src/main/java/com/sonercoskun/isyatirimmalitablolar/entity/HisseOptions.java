package com.sonercoskun.isyatirimmalitablolar.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "hisse_options")
@Getter
@RequiredArgsConstructor
@IdClass(HisseOptionsId.class)
public class HisseOptions {
    @Id
    @Column(name = "hisse")
    private String hisse;
    @Id
    @Column(name = "options")
    private String options;

}
