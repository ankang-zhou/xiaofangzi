package cn.bdqn.mapper;

import cn.bdqn.domain.Article;
import com.sun.org.glassfish.gmbal.ParameterNames;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleMapper {
    int deleteByPrimaryKey(Integer articleId);

    int insert(Article record);

    //添加博客
    public Integer insertSelective(Article record);

    Article selectByPrimaryKey(Integer articleId);

    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKeyWithBLOBs(Article record);

    int updateByPrimaryKey(Article record);

    //获得最大的文章编号
    public Integer getMaxArticleId();

    //根据文章Id查询文章内容(标题，作者，时间，浏览人数，简介，内容，点赞个数)
    public Article selectArticleById(@Param("articleId")Integer articleId);

    //根据标题模糊查询博客头内容(只显示标题，(文章图片)简介,作者，时间，浏览人数，点赞个数)
    public List<Article> selectArticlesByTitle(@Param("articleTitle") String articleTitle);

    //根据用户id查询文章内容
    public List<Article> selectArticleByUserId(@Param("Id") int Id);

}