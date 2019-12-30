package cn.bdqn.controller;

import cn.bdqn.domain.Address;
import cn.bdqn.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/address")
public class AddressController {

    @Autowired
    private AddressService addressService;

    /**
     * 根据传来的父级id得到子级信息
     * @param id
     * @return
     */
    @RequestMapping("/queryInfoById")
    @ResponseBody
    public Map<String,Object> QueryInfoById(int id){

        List<Address> list = addressService.selectStairByAddressId(id);

        Map<String,Object> map = new HashMap<String,Object>();

        map.put("data",list);

        return map;
    }


}
