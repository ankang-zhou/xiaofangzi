package cn.bdqn.domain;

import java.util.Date;
import java.util.List;

public class Comment {
    private Integer commentId;

    private String commentContent;

    private Date commentTime;

    private Integer articleId;

    private Integer touristId;

    private Integer commentState;

    private Integer commentRevert;

    private Integer commentReply;

    private Integer adminId;

    private Integer userId;

    //回复评论的评论
    private List<Comment> replyComment;

    //用户的信息
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Comment> getReplyComment() {
        return replyComment;
    }

    public void setReplyComment(List<Comment> replyComment) {
        this.replyComment = replyComment;
    }

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent == null ? null : commentContent.trim();
    }

    public Date getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public Integer getTouristId() {
        return touristId;
    }

    public void setTouristId(Integer touristId) {
        this.touristId = touristId;
    }

    public Integer getCommentState() {
        return commentState;
    }

    public void setCommentState(Integer commentState) {
        this.commentState = commentState;
    }

    public Integer getCommentRevert() {
        return commentRevert;
    }

    public void setCommentRevert(Integer commentRevert) {
        this.commentRevert = commentRevert;
    }

    public Integer getCommentReply() {
        return commentReply;
    }

    public void setCommentReply(Integer commentReply) {
        this.commentReply = commentReply;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}