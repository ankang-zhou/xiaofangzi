import cn.bdqn.service.UserService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class UserTest {

    @Test
    // 测试：用户注册
    public void testUserService(){

        ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");
        UserService service =  (UserService) ac.getBean("userServiceImpl");
        System.out.println(service);

    }

}
