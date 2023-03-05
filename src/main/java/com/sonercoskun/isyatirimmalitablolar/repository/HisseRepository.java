package com.sonercoskun.isyatirimmalitablolar.repository;

import com.sonercoskun.isyatirimmalitablolar.entity.Hisse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HisseRepository extends JpaRepository<Hisse,String> {
}
