package com.sonercoskun.isyatirimmalitablolar.repository;

import com.sonercoskun.isyatirimmalitablolar.entity.MaliTablo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MaliTabloRepository extends JpaRepository<MaliTablo, Long> {
}
