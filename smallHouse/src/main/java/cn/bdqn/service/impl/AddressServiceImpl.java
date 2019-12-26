package cn.bdqn.service.impl;

import cn.bdqn.domain.Address;
import cn.bdqn.mapper.AddressMapper;
import cn.bdqn.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("addressServiceImpl")
public class AddressServiceImpl implements AddressService {

    @Autowired
    AddressMapper addressMapper;

    @Override
    public List<Address> selectAllStair() {
        return addressMapper.selectAllStair();
    }

    @Override
    public List<Address> selectStairByAddressId(int Id) {
        return addressMapper.selectStairByAddressId(Id);
    }
}
