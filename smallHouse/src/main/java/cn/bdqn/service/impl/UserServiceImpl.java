package cn.bdqn.service.impl;

import cn.bdqn.domain.User;
import cn.bdqn.mapper.UserMapper;
import cn.bdqn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public void insertUserInfo(User user) {

        userMapper.insertSelective(user);

    }

    @Override
    public User selectUserByUserInfo(String email,String pwd) {
        return userMapper.selectUserByEmailAndPassword(email,pwd);
    }

}
