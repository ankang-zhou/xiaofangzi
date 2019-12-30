package cn.bdqn.service.impl;

import cn.bdqn.domain.Type;
import cn.bdqn.mapper.TypeMapper;
import cn.bdqn.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("typeService")
public class TypeServiceImpl implements TypeService {

    //自动注入TypeMapper
    @Autowired
    private TypeMapper typeMapper;


    @Override
    public List<Type> selectTypeList() {
        return typeMapper.selectTypeList();
    }
}
