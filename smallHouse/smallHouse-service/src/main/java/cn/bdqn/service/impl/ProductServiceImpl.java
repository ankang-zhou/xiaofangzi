package cn.bdqn.service.impl;

import cn.bdqn.domain.Product;
import cn.bdqn.mapper.ProductMapper;
import cn.bdqn.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("productService")
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Override
    public List<Product> selectAllProducts() {
        return productMapper.selectAllProducts();
    }

    @Override
    public Product selectProductById(Integer productId) {
        return productMapper.selectProductById(productId);
    }
}
