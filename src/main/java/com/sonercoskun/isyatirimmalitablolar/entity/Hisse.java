package com.sonercoskun.isyatirimmalitablolar.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

@Entity
@Table(name = "hisse")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Hisse {
    @Id
    @Column(name = "hisse")
    private String hisse;
}
