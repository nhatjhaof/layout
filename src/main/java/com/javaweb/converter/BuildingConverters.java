package com.javaweb.converter;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.RentAreaRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class BuildingConverters {
	@Autowired
	private ModelMapper modelMapper;
	@Autowired
	private RentAreaConverter rentAreaConverter;

	@Autowired
	private RentAreaRepository rentAreaRepository;

	public BuildingDTO convertToDto (BuildingEntity buildingEntity){
		BuildingDTO result = modelMapper.map(buildingEntity, BuildingDTO.class);
		return result;
	}

	public BuildingEntity convertToEntity (BuildingDTO buildingDTO){
		BuildingEntity result = modelMapper.map(buildingDTO, BuildingEntity.class);
		List<RentAreaEntity> rentAreaEntities = rentAreaConverter.convertToEntity(buildingDTO,result);
		result.setRentAreas(rentAreaEntities);
		String tyCode = String.join(",", buildingDTO.getTypeCode());
		result.setTypeCode(tyCode);
		return result;
	}

	public BuildingSearchResponse toResponse(BuildingEntity buildingEntity) {
		BuildingSearchResponse buildingSearchResponse = modelMapper.map(buildingEntity, BuildingSearchResponse.class);
		String districtName = districtCode.district().get(buildingEntity.getDistrict());
		buildingSearchResponse.setAddress(buildingEntity.getStreet() + "," + buildingEntity.getWard() + "," + (districtName));
		List<RentAreaEntity> rentAreaEntities = rentAreaRepository.findRentArea(buildingEntity.getId());
		ArrayList<String> arr = new ArrayList<>();
		for (int i = 0; i < rentAreaEntities.size(); i++) {
			arr.add(rentAreaEntities.get(i).getValue() + "");
		}
		String rentArea = String.join(", ", arr);
		buildingSearchResponse.setRentArea(rentArea);
		return buildingSearchResponse;
	}
}
