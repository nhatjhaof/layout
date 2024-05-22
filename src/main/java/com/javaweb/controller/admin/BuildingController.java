package com.javaweb.controller.admin;



import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@RestController(value="buildingControllerOfAdmin")
public class BuildingController {

    @Autowired
    private IUserService userService;
    @Autowired
    private IBuildingService buildingService;
    @GetMapping(value="/admin/building-list")
    public ModelAndView buildingList(@ModelAttribute("modelSearch")BuildingSearchRequest buildingSearchRequest){
        ModelAndView mav = new ModelAndView("admin/building/list");
        List<BuildingSearchResponse> buildings = buildingService.findAll(buildingSearchRequest);
        mav.addObject("buildings", buildings);
        mav.addObject("staffs", userService.getStaff());
        mav.addObject("districtCode" , districtCode.district());
        mav.addObject("typeCodes", buildingType.getTypeCode());
        return mav;
    }
    @GetMapping(value="/admin/building-edit")
    public ModelAndView addbuilding(@ModelAttribute("BuildingEdit")BuildingDTO buildingDTO){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("districtCode" , districtCode.district());
        mav.addObject("typeCodes", buildingType.getTypeCode());
        return mav;
    }
    @GetMapping(value="/admin/building-edit-{id}")
    public ModelAndView addbuilding(@PathVariable Long id){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        //findbybuildingid
        return mav;
    }
}
