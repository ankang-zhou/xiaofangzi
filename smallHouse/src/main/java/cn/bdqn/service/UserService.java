package cn.bdqn.service;

import cn.bdqn.domain.User;

public interface UserService {

    //注册用户
    public void insertUserInfo(User user);

    //用户登录
    public User selectUserByUserInfo(String email,String pwd);

}
