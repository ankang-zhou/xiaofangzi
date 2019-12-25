package cn.bdqn.mapper;

import cn.bdqn.domain.Article;
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

    //根据id查询用户信息
    public User selectUserByNickNameAndEmailAndPassword(@Param("Email") String Email, @Param("userPassword") String userPassword);

    //修改用户信息
    public int selectNumByEmail(@Param("email") String Email);

    //根据userId查询userInfo【数组】
    public List<User> selectUsersInfoByIds(String[] Ids);

}