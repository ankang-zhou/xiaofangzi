package cn.bdqn.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//定义拦截器
public class MyInterceptor implements HandlerInterceptor {

    //前置处理
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //验证登录
        if(null != request.getSession().getAttribute("users")){
            return true;
        }else {
            response.sendRedirect("/smallHouse/article/mainYe");
            return false;
        }
        //在interceptor中只要preHandle返回为true，则最终处理afterCompletion()一定会执行。
    }


}
