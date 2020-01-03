package cn.bdqn.domain;

public class Great {

    private Integer greatId;    //点赞id
    private Integer articleId;  //文章id
    private Integer userId;     //用户id

    public Integer getGreatId() {
        return greatId;
    }

    public void setGreatId(Integer greatId) {
        this.greatId = greatId;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Great{" +
                "greatId=" + greatId +
                ", articleId=" + articleId +
                ", userId=" + userId +
                '}';
    }
}
