package com.javaweb.api.admin;

import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.UserRepository;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/buildings")
public class BuildingAPI {
    private final UserRepository userRepository;

    public BuildingAPI(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

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
    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaff(@PathVariable("id") Long id) {
        //lay tat ca nhan vien (co giao va chua dc giao)
        //List<UserEntity> userEntities = userRepository.findByStatusAndRoles_Code(1,"STAFF");
        //lay tat ca nhan vien quan ly toa nha co id gui ve
        List<StaffResponseDTO> staffAssignment = new ArrayList<StaffResponseDTO>();
        StaffResponseDTO staff1 = new StaffResponseDTO();
        staff1.setStaffId(1L);
        staff1.setFullName("Nguyen Van A");
        staff1.setChecked("checked");
        StaffResponseDTO staff2 = new StaffResponseDTO();
        staff2.setStaffId(2L);
        staff2.setFullName("Nguyen Van B");
        staff2.setChecked("");
        StaffResponseDTO staff3 = new StaffResponseDTO();
        staff3.setStaffId(4L);
        staff3.setFullName("Nguyen Van C");
        staff3.setChecked("checked");
        staffAssignment.add(staff1);
        staffAssignment.add(staff2);
        staffAssignment.add(staff3);
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setData(staffAssignment);
        responseDTO.setMessage("thanh cong00");
        return responseDTO;
    }
    @PutMapping
    public void UpdateAssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO) {
        //Xuong service xu ly
    }
}
