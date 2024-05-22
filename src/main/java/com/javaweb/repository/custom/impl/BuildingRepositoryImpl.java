package com.javaweb.repository.custom.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {
    private final RoleRepositoryImpl roleRepositoryImpl;
    @PersistenceContext
    private EntityManager entityManager;

    public BuildingRepositoryImpl(RoleRepositoryImpl roleRepositoryImpl) {
        this.roleRepositoryImpl = roleRepositoryImpl;
    }

    public void queryJoin(BuildingSearchBuilder builder , StringBuilder sql) {
//		String rentAreaFrom = (String) params.get("areaFrom");
//		String rentAreaEnd = (String) params.get("areaEnd");
//
//		if(StringUtils.checkString(rentAreaFrom) || StringUtils.checkString(rentAreaEnd)) {
//			sql.append(" JOIN rentarea r ON r.buildingid = b.id ");
//		}
        Long staffId = builder.getStaffId();
        if(staffId != null) {
            sql.append(" JOIN assignmentbuilding asm ON asm.buildingid = b.id ");
        }
        List<String> TypeCode = builder.getTypeCode();
        if(TypeCode != null && !TypeCode.isEmpty()) {
            sql.append(" JOIN buildingrenttype bdr ON bdr.buildingid = b.id");
            sql.append(" JOIN renttype rt ON rt.id = bdr.renttypeid");
        }
    }
    public void queryWhereNormal(BuildingSearchBuilder Builder , StringBuilder where) {
//		for(Map.Entry<String, Object> item : params.entrySet()) {
//			if(!item.getKey().equals("staffId") && !item.getKey().equals("TypeCode") && !item.getKey().startsWith("area")
//					&& !item.getKey().startsWith("rentPrice")) {
//				String data = item.getValue().toString();
//				if (StringUtils.checkString(data)) {
//					if (NumberUtils.checkNumber(data)) {
//						where.append(" AND b." + item.getKey().toLowerCase() + " = " + data);
//					} else {
//						where.append(" AND b." + item.getKey().toLowerCase() + " LIKE '%" + data + "%'");
//					}
//				}
//
//			}
//		}
        try {
            Field[] fields = BuildingSearchBuilder.class.getDeclaredFields();
            for(Field item : fields) {
                item.setAccessible(true);
                String fieldName = item.getName();
                if(!fieldName.equals("staffId") && !fieldName.equals("TypeCode") && !fieldName.startsWith("area")
                        && !fieldName.startsWith("rentPrice")) {
                    Object value = item.get(Builder);
                    if(value != null) {
                        if(item.getType().getName().equals("java.lang.Long")) {
                            where.append(" AND b." + fieldName.toLowerCase() + " = " + value);
                        }
                        else if(item.getType().getName().equals("java.lang.String")) {
                            where.append(" AND b." + fieldName.toLowerCase() + " LIKE '%" + value + "%'");
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void queryWhereSpecial(BuildingSearchBuilder builder, StringBuilder where) {
        Long staffId = builder.getStaffId();
        if(staffId != null) {
            where.append(" AND asm.staffid = " +staffId);
        }
        Long rentAreaFrom = builder.getAreaFrom();
        Long rentAreaEnd = builder.getAreaTo();
        if (rentAreaFrom != null || rentAreaEnd != null)
        {
            where.append("AND EXISTS (SELECT * FROM rentarea r WHERE r.buildingid = b.id ");

            if (rentAreaEnd != null)
                where.append("AND r.value <= ").append(rentAreaEnd).append('\n');

            if (rentAreaFrom != null)//true then go if
                where.append("AND r.value >= ").append(rentAreaFrom).append(")\n");
            else//false then go else
                where.append(")\n");
        }
        Long rentPriceFrom = builder.getRentPriceFrom();
        Long rentPriceEnd = builder.getRentPriceTo();

        if(rentPriceFrom != null) {
            where.append(" AND b.rentprice >= "+ rentPriceFrom);
        }
        if(rentPriceEnd != null) {
            where.append(" AND b.rentprice <= "+ rentPriceEnd);
        }
//		if (TypeCode != null && !TypeCode.isEmpty()) {
//			where.append(" AND rt.code IN (");
//			for (int i = 0; i < TypeCode.size(); i++) {
//				where.append("'" + TypeCode.get(i) + "'");
//				if (i < TypeCode.size() - 1) {
//					where.append(" , ");
//				}
//			}
//			where.append(") ");
//
//		}
        List<String> TypeCode = builder.getTypeCode();
        if (TypeCode != null && !TypeCode.isEmpty()) {
            where.append(" AND (");
            String sqlJoin = TypeCode.stream().map(item -> " rt.code Like '%" + item + "%'").collect(Collectors.joining("OR"));
            where.append(sqlJoin + ") ");
        }
    }

    @Override
    public List<BuildingEntity> findAll(BuildingSearchBuilder builder) {
        StringBuilder sql = new StringBuilder("SELECT b.* FROM building b ");
        queryJoin(builder, sql);
        StringBuilder where = new StringBuilder(" WHERE 1=1 ");
        queryWhereNormal(builder , where);
        queryWhereSpecial(builder, where);
        sql.append(where);
        sql.append(" GROUP BY b.id ");
        //typcode
        Query query = entityManager.createNativeQuery(sql.toString(),BuildingEntity.class);
        return query.getResultList();
    }
}
