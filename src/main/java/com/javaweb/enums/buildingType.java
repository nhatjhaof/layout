package com.javaweb.enums;

import java.util.HashMap;
import java.util.Map;

public enum buildingType {
    TANG_TRET("Tầng Trệt"),
    NGUYEN_CAN("Nguyên Căn"),
    NOI_THAT("Nội Thất");

    private final String typeCodeName;

    buildingType(String typeCodeName){
        this.typeCodeName = typeCodeName;
    }
    public String getTypeCodeName(){
        return typeCodeName;
    }
    public static Map<String,String> getTypeCode(){
        Map<String,String> listTypeCode = new HashMap<>();
        for(buildingType item : buildingType.values()){
            listTypeCode.put(item.toString() , item.getTypeCodeName());
        }
        return listTypeCode;
    }
}
