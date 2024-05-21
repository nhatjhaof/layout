package com.javaweb.api.admin;

import com.javaweb.model.dto.BuildingDTO;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/buildings")
public class BuildingAPI {
    @PostMapping
    public String addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO) {
        //xuong db them data
        return new String ("Add Building Success");
    }
    @DeleteMapping
    public String deleteBuilding(@RequestBody List<Long> ids) {
        //Xuong DB xóa data
        return new String ("Add or Update Building Success!");
    }
}
