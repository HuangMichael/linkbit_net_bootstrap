package com.linkbit.net.back.utils;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by HUANGBIN on 2016/2/18 0018.
 * 获取当前的session
 */
public class SessionUtil {
    /**
    * 获取当前上下文路径
    * */
    public static String  getContextPath(HttpServletRequest request){
        HttpSession session = request.getSession();
        ServletContext application = session.getServletContext();
        String serverRealPath = application.getRealPath("/") ;
        return  serverRealPath;
    }



    public static String  getAbsolutePath(HttpServletRequest request){
        HttpSession session = request.getSession();
        ServletContext application = session.getServletContext();
        String serverRealPath = application.getRealPath("/") ;
        return  serverRealPath;
    }
}
