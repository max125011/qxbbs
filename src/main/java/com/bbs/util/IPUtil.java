package com.bbs.util;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by max on 2017/3/30.
 */
public class IPUtil {

    /**
     *  查看原始IP
     * @param request
     * @return
     */
    public static String getIp(HttpServletRequest request){

        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
            ip = request.getHeader("Proxy-Client-IP");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
            ip = request.getHeader("WL-Proxy-Client-IP");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
            ip = request.getHeader("HTTP_CLIENT_IP");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
            ip = request.getRemoteAddr();

        return ip;
    }

    /**
     *  当IP有多个反向代理时
     * @param request
     * @return
     */
    public static String getIpAddr(HttpServletRequest request){
        String ip = request.getHeader("X-Real-IP");
        if (ip != null && ip != "" && !"unknown".equalsIgnoreCase(ip)) {
            return ip;
        }
        ip = request.getHeader("X-Forwarded-For");
        if (ip != null && ip != "" && !"unknown".equalsIgnoreCase(ip)) {
            // 多次反向代理后会有多个IP值，第一个为真实IP。
            int index = ip.indexOf(',');
            if (index != -1) {
                return ip.substring(0, index);
            } else {
                return ip;
            }
        } else {
            return request.getRemoteAddr();
        }
    }

    public static int checkIP(HttpServletRequest request){

        int res = 0;
        String ip = getIpAddr(request);
        if (ip.equals("127.0.0.1") || ip.equals("0:0:0:0:0:0:0:1"))
            res = 1;
        else if (ip.startsWith("10.33")){
            String[] data = ip.split(".");
            if (data[2].equals("232") || data[2].equals("227") || data[2].equals("158") || data[2].equals("26") || data[2].equals("27") || data[2].equals("127"))
                res = 1;
        }
        return res;
    }

}
