package com.huaxing.mlxg.util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * @ClassName: BaseServlet
 * @Description: TODO
 * @Author: Baseen
 * @Date: 2019/10/16 18:27
 * @Version: v1.0
 **/
public class BaseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        InputStream inputStream = BaseServlet.class.getClassLoader().getResourceAsStream("/ServletMapping.properties");
        Properties prop = new Properties();
        prop.load(inputStream);

        String uri = request.getRequestURI();
        uri = uri.substring(uri.lastIndexOf("/") + 1);

        Map<String, String> servletMap = new HashMap<>(50);
        servletMap.put(uri, prop.getProperty(uri));

        String methodName = request.getParameter("method");
        try {
            Class<?> aclass = Class.forName(servletMap.get(uri));
            Method method = aclass.getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            Object obj = method.invoke(aclass.newInstance(), request, response);
            if (obj == null) {
                //System.out.println("BaseServlet：返回的url为空");
                return;
            }
            request.getRequestDispatcher((String) obj).forward(request, response);
        } catch (ClassNotFoundException | NoSuchMethodException | IllegalAccessException | InvocationTargetException | InstantiationException e) {
            e.printStackTrace();
        }


    }
}
