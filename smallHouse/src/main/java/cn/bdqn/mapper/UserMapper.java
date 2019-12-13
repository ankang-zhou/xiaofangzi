package cn.bdqn.mapper;

import cn.bdqn.domain.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    int deleteByPrimaryKey(Integer userId);

    public int insert(User record);

    public int insertSelective(User record);

    public User selectByPrimaryKey(Integer userId);

    public int updateByPrimaryKeySelective(User record);

    public int updateByPrimaryKey(User record);

    public User selectUserByEmailAndPassword(@Param("Email") String Email,@Param("userPassword") String userPassword);
}