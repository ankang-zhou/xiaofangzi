package cn.bdqn.mapper;

import cn.bdqn.domain.Tourist;

public interface TouristMapper {
    int deleteByPrimaryKey(Integer touristId);

    int insert(Tourist record);

    int insertSelective(Tourist record);

    Tourist selectByPrimaryKey(Integer touristId);

    int updateByPrimaryKeySelective(Tourist record);

    int updateByPrimaryKey(Tourist record);
}