package cn.bdqn.service.impl;

import cn.bdqn.domain.Great;
import cn.bdqn.mapper.GreatMapper;
import cn.bdqn.service.GreatService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class GreatServiceImpl implements GreatService {

    @Autowired
    private GreatMapper greatMapper;

    @Override
    public List<Great> findByArticleIdAndUserId(Integer articleId, Integer userId) {
        return greatMapper.findByArticleIdAndUserId(articleId,userId);
    }
}
