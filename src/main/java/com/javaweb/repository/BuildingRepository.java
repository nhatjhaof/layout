package com.javaweb.repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface BuildingRepository extends JpaRepository<BuildingEntity, Long>, BuildingRepositoryCustom {
    
    @Query(value = "select * from building b where (:name is null or b.name = :name)", nativeQuery = true)
    List<BuildingEntity> findAllByAttributes(String name, Pageable pageable);
}
