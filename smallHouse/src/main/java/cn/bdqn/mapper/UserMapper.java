package cn.bdqn.mapper;

import cn.bdqn.domain.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    public User selectUserByEmailAndPassword(@Param("Email") String Email, @Param("userPassword") String userPassword);
}