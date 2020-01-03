package cn.bdqn.mapper;

import cn.bdqn.domain.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentMapper {

    int insertSelective(Comment record);

    int updateByPrimaryKeySelective(Comment record);

    //根据文章id查询评论
    public List<Comment> selectCommentById(@Param("ID") int ID);

    //根据评论id查询回复评论
    public List<Comment> selectReplyCommentByCommentId(Comment comment);

}