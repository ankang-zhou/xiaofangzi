import cn.bdqn.domain.User;
import cn.bdqn.service.UserService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class test {

    @Test
    public void test()throws Exception{

        ApplicationContext ac = new ClassPathXmlApplicationContext("beans.xml");

        UserService userService = (UserService) ac.getBean("userServiceImpl");

        int num = userService.selectNumByEmail("1405957431@qq.com");

        System.out.println(num);

    }

}
