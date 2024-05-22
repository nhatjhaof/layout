package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverters;
import com.javaweb.converter.BuildingSearchBuilderConverters;
import com.javaweb.converter.RentAreaConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import com.javaweb.builder.BuildingSearchBuilder;
import java.util.ArrayList;
import java.util.List;
@Service
public class BuildingService implements IBuildingService {
    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private BuildingConverters buildingConverter;

    @Autowired
    private RentAreaConverter rentAreaConverter;
    @Autowired
    private BuildingSearchBuilderConverters buildingSearchBuilderCoverter;

    @Autowired
    private RentAreaRepository rentAreaRepository;
    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest request) {
        BuildingSearchBuilder builder = buildingSearchBuilderCoverter.toBuildingSearchBuilder(request);
        List<BuildingEntity> buildingEntities = buildingRepository.findAll(builder);
        List<BuildingSearchResponse> results = new ArrayList<>();
        for(BuildingEntity item : buildingEntities){
            BuildingSearchResponse building = buildingConverter.toResponse(item);
            results.add(building);
        }
        return results;
    }
    
    @Override
    public List<BuildingSearchResponse> findAllByAttribute(BuildingSearchRequest request, Pageable pageable) {
        List<BuildingSearchResponse> results = new ArrayList<>();
        List<BuildingEntity> buildingEntities = buildingRepository.findAllByAttributes(request.getName(), pageable);
        for(BuildingEntity item : buildingEntities){
            BuildingSearchResponse building = buildingConverter.toResponse(item);
            results.add(building);
        }
        return results;
    }
}
