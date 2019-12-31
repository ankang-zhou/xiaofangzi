package cn.bdqn.service;

import cn.bdqn.domain.Great;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface GreatService {

    //根据文章id和用户id查找点赞记录
    public List<Great> findByArticleIdAndUserId(Integer articleId,Integer userId);
}
