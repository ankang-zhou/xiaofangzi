package cn.bdqn.service;

import cn.bdqn.domain.Address;
import cn.bdqn.mapper.AddressMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface AddressService {

    //查询全部一级地址
    public List<Address> selectAllStair();

    //根据上级地址查询下级地址
    public List<Address> selectStairByAddressId(int Id);

}
