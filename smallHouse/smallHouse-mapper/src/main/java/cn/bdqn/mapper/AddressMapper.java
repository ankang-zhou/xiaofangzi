package cn.bdqn.mapper;

import cn.bdqn.domain.Address;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AddressMapper {
    int deleteByPrimaryKey(Integer addressId);

    int insert(Address record);

    int insertSelective(Address record);

    Address selectByPrimaryKey(Integer addressId);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);

    //查询全部一级地址
    public List<Address> selectAllStair();

    //根据上级地址查询下级地址
    public List<Address> selectStairByAddressId(@Param("Id") int Id);

    //根据当前id查询父级信息
    public Address selectParentLevelById(int id);

}