package cn.bdqn.service.impl;

import cn.bdqn.domain.Comment;
import cn.bdqn.mapper.CommentMapper;
import cn.bdqn.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("commentServiceImpl")
public class CommentServiceImpl implements CommentService {

    @Autowired
    CommentMapper commentMapper;


    @Override
    public int insertSelective(Comment record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKeySelective(Comment record) {
        return 0;
    }

    @Override
    public List<Comment> selectCommentById(int ID) {
        return commentMapper.selectCommentById(ID);
    }

    @Override
    public List<Comment> selectReplyCommentByCommentId(Comment comment) {
        return commentMapper.selectReplyCommentByCommentId(comment);
    }

    @Override
    public void insertComment(Comment comment) {
        commentMapper.insertSelective(comment);
    }
}
