package cn.bdqn.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Article {

    private Integer articleId;

    private String articleTitle;

    private Integer typeId;

    private Integer userId;

    private Integer adminId;

    private Date articleTime;

    private Integer articlePageview;

    private Integer articleLike;

    private Integer articleState;

    private String articlePhoto;

    private Integer musicId;

    private Integer themeId;

    private String articleContent;

    private String articleSummary;

    private String userNickName;

    private String typeName;

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle == null ? null : articleTitle.trim();
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public Date getArticleTime() {
        return articleTime;
    }

    public void setArticleTime(Date articleTime) {
        this.articleTime = articleTime;
    }

    public Integer getArticlePageview() {
        return articlePageview;
    }

    public void setArticlePageview(Integer articlePageview) {
        this.articlePageview = articlePageview;
    }

    public Integer getArticleLike() {
        return articleLike;
    }

    public void setArticleLike(Integer articleLike) {
        this.articleLike = articleLike;
    }

    public Integer getArticleState() {
        return articleState;
    }

    public void setArticleState(Integer articleState) {
        this.articleState = articleState;
    }

    public String getArticlePhoto() {
        return articlePhoto;
    }

    public void setArticlePhoto(String articlePhoto) {
        this.articlePhoto = articlePhoto == null ? null : articlePhoto.trim();
    }

    public Integer getMusicId() {
        return musicId;
    }

    public void setMusicId(Integer musicId) {
        this.musicId = musicId;
    }

    public Integer getThemeId() {
        return themeId;
    }

    public void setThemeId(Integer themeId) {
        this.themeId = themeId;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public String getArticleSummary() {
        return articleSummary;
    }

    public void setArticleSummary(String articleSummary) {
        this.articleSummary = articleSummary;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent == null ? null : articleContent.trim();
    }

    public String getUserNickName() {
        return userNickName;
    }

    public void setUserNickName(String userNickName) {
        this.userNickName = userNickName;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    @Override
    public String toString() {
        return "Article{" +
                "articleId=" + articleId +
                ", articleTitle='" + articleTitle + '\'' +
                ", typeId=" + typeId +
                ", userId=" + userId +
                ", adminId=" + adminId +
                ", articleTime=" + articleTime +
                ", articlePageview=" + articlePageview +
                ", articleLike=" + articleLike +
                ", articleState=" + articleState +
                ", articlePhoto='" + articlePhoto + '\'' +
                ", musicId=" + musicId +
                ", themeId=" + themeId +
                ", articleContent='" + articleContent + '\'' +
                ", articleSummary='" + articleSummary + '\'' +
                '}';
    }
}