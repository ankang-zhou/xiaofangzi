package cn.bdqn.service;

import cn.bdqn.domain.Great;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

public interface GreatService {

    //根据文章id和用户id查找点赞记录
    public List<Great> findByArticleIdAndUserId(Integer articleId,Integer userId);

    //根据点赞Id删除点赞记录
    public void delByGreatId(Integer greatId);

    //添加点赞记录
    public void insertGreat(Great great);
}
