package cn.bdqn.service.impl;

import cn.bdqn.domain.User;
import cn.bdqn.mapper.UserMapper;
import cn.bdqn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public void insertUserInfo(User user) {

        userMapper.insertSelective(user);
    }

    //根据账号和密码查询用户信息
    @Override
    public User selectUserByUserInfo(String email, String pwd) {
        return userMapper.selectUserByNickNameAndEmailAndPassword(email,pwd);
    }

    @Override
    public int selectNumByEmail(String Email) {
        return userMapper.selectNumByEmail(Email);
    }

    @Override
    public User selectInfoByUserId(int id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateUserInfo(User user) {
        return userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public List<User> selectUsersInfoByIds(List<String > Ids) {
        return userMapper.selectUsersInfoByIds(Ids);
    }

    @Override
    public void cancelAttention(User user) {
        userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public void Attention(User user) {
        userMapper.updateByPrimaryKeySelective(user);
    }

}
