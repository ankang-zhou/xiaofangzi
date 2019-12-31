package cn.bdqn.mapper;

import cn.bdqn.domain.Great;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GreatMapper {

    //根据文章id和用户id查找点赞记录
    public List<Great> findByArticleIdAndUserId(@Param("articleId")Integer articleId,@Param("userId") Integer userId);

}
