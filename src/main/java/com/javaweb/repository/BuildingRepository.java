package com.javaweb.repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BuildingRepository extends JpaRepository<BuildingEntity, Long> , BuildingRepositoryCustom{
    //List<BuildingEntity> findByNameContainingAndWardContaining(String name, String ward);//Containing: gan dung, lIKE '%__%'
}
