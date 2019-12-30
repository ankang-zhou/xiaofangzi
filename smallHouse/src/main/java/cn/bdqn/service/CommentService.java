package cn.bdqn.service;

import cn.bdqn.domain.Comment;

import java.util.List;

public interface CommentService {

    int insertSelective(Comment record);

    int updateByPrimaryKeySelective(Comment record);

    //根据文章id查询评论
    public List<Comment> selectCommentById(int ID);

    //根据评论id查询回复评论
    public List<Comment> selectReplyCommentByCommentId(Comment comment);

}
