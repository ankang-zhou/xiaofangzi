import cn.bdqn.domain.Comment;
import cn.bdqn.domain.User;
import cn.bdqn.service.CommentService;
import cn.bdqn.service.UserService;
import cn.bdqn.utils.StringSplitUtils;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class test {

    @Test
    public void test()throws Exception{
        ApplicationContext ac = new ClassPathXmlApplicationContext("beans-service.xml","beans-mapper.xml");
        UserService service =  (UserService) ac.getBean("userServiceImpl");
        User user = service.selectInfoByUserId(1);
        List<String > list = new ArrayList<String >();

        String[] strings = StringSplitUtils.splitString(user.getUserAttention(),",");
        list = Arrays.asList(strings);
        list.remove(" ");
        List<User> users = service.selectUsersInfoByIds(list);
        for (User u :users) {
            System.out.println(u.getUserNickname());
        }
    }

}
