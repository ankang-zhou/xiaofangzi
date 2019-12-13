package cn.bdqn.mapper;

import cn.bdqn.domain.Theme;

public interface ThemeMapper {
    int deleteByPrimaryKey(Integer themeId);

    int insert(Theme record);

    int insertSelective(Theme record);

    Theme selectByPrimaryKey(Integer themeId);

    int updateByPrimaryKeySelective(Theme record);

    int updateByPrimaryKey(Theme record);
}