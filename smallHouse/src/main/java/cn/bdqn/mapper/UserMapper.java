package cn.bdqn.mapper;

import cn.bdqn.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    public User selectUserByNickNameAndEmailAndPassword(@Param("Email") String Email, @Param("userPassword") String userPassword);

    public int selectNumByEmail(@Param("email") String Email);

    public List<User> selectUsersInfoByIds(String[] Ids);

}