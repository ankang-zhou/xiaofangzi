package cn.bdqn.service.impl;

import cn.bdqn.domain.Great;
import cn.bdqn.mapper.GreatMapper;
import cn.bdqn.service.GreatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("greatService")
public class GreatServiceImpl implements GreatService {

    @Autowired
    private GreatMapper greatMapper;

    @Override
    public List<Great> findByArticleIdAndUserId(Integer articleId, Integer userId) {
        return greatMapper.findByArticleIdAndUserId(articleId,userId);
    }

    @Override
    public void delByGreatId(Integer greatId) {
        greatMapper.delByGreatId(greatId);
    }

    @Override
    public void insertGreat(Great great) {
        greatMapper.insertGreat(great);
    }
}
