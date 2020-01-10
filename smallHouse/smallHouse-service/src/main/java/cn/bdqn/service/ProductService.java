package cn.bdqn.service;

import cn.bdqn.domain.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductService {

    //查询所有商品信息
    public List<Product> selectAllProducts();

    //根据商品Id查询商品信息
    public Product selectProductById(Integer productId);
}
