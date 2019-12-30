package cn.bdqn.mapper;

import cn.bdqn.domain.Head;

public interface HeadMapper {
    int deleteByPrimaryKey(Integer headId);

    int insert(Head record);

    int insertSelective(Head record);

    Head selectByPrimaryKey(Integer headId);

    int updateByPrimaryKeySelective(Head record);

    int updateByPrimaryKey(Head record);
}