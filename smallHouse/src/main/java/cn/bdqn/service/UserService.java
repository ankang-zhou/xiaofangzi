package cn.bdqn.service;

import cn.bdqn.domain.User;
import org.apache.ibatis.annotations.Param;

public interface UserService {

    //注册用户
    public void insertUserInfo(User user);

    //用户登录
    public User selectUserByUserInfo(String email, String pwd);

    //验证邮箱
    public int selectNumByEmail(String Email);

    //根据id查询用户信息
    public User selectInfoByUserId(int id);

}
