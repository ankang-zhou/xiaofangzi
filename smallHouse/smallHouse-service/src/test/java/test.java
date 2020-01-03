import cn.bdqn.domain.Comment;
import cn.bdqn.service.CommentService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class test {

    @Test
    public void test()throws Exception{
        ApplicationContext ac = new ClassPathXmlApplicationContext("beans-service.xml");
        CommentService service =  (CommentService) ac.getBean("commentServiceImpl");
        List<Comment> list = service.selectCommentById(1);
        for (Comment com:list
             ) {
            System.out.println(com.getCommentId()+" "+com.getCommentContent());
        }
    }

}
