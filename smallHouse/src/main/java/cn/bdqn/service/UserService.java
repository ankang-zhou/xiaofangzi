package cn.bdqn.service;

import cn.bdqn.domain.User;
import org.apache.ibatis.annotations.Param;

public interface UserService {

    //注册用户
    public void insertUserInfo(User user);

    //用户登录
    public User selectUserByUserInfo(String nickName,String email, String pwd);

    //验证邮箱
    public int selectNumByEmail(@Param("email")String Email);

}
