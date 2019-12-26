import cn.bdqn.domain.User;
import cn.bdqn.service.UserService;
import cn.bdqn.utils.StringSplitUtils;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class test {

    @Test
    public void test()throws Exception{

        ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");

        UserService userService = (UserService) ac.getBean("userServiceImpl");

        User user1 = userService.selectInfoByUserId(1);

        String[] strings = StringSplitUtils.splitString(user1.getUserFans(), ",");

        List<User> list = userService.selectUsersInfoByIds(strings);

        System.out.println(list.toString());

        for (User user:list
             ) {
            System.out.println(user.getUserHead());
        }

    }

}
