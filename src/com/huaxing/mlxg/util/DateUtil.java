package com.huaxing.mlxg.util;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * @ClassName DateUtil
 * @Description: String日期转换为SQL日期
 * @Author Baseen
 * @Date 2019/9/22
 * @Version V1.0
 **/
public class DateUtil {

    /**
     * 获取字符串类型的当前系统时间（不含时分秒）
     *
     * @return String
     */
    public static String getCurrentDateNoHour() {
        java.util.Date date = new java.util.Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }

    /**
     * 获取字符串类型的当前系统时间（含时分秒）
     *
     * @return String
     */
    public static String getCurrentDate() {
        java.util.Date date = new java.util.Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }

    /**
     * 获取当前时间的String类型date并转化成Util类型date
     *
     * @return java.util.Date
     */
    public static java.util.Date getCurrentDateToUtilDate() throws ParseException {
        String stringDate = DateUtil.getCurrentDateNoHour();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.parse(stringDate);

    }

    /**
     * 将String类型date转化成Util类型date
     *
     * @return java.util.Date
     */
    public static java.util.Date getStringDateToUtilDate(String date) throws ParseException {
        //yyyy-MM-dd格式一定要与stringDate的格式一致
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.parse(date);
    }

    /**
     * 将sql类型Date转换成util类型Date
     *
     * @param sqlDate
     * @return java.util.Date
     */
    public static java.util.Date changeToUtilDate(Date sqlDate) {
        return new Date(sqlDate.getTime());
    }

    /**
     * 获取当前时间并转换成sql类型date
     *
     * @return java.sql.Date
     */
    public static Date getCurrentDateToSqlDate() {
        return new Date(System.currentTimeMillis());
    }

    /**
     * 将字符串类型date转成sql类型date
     * @param date
     * @return java.sql.Date
     * @throws ParseException
     */
    public static Date changeToSqlDate(String date) throws ParseException {
        //String -> Date SimpleDateFormat to_date
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utildate = sdf.parse(date);
        //java.util.Date -> java.sql.Date  1970-> 1990-01-01
        long time = utildate.getTime();
        //1970 1 1 -> 1990-01-01
        return new Date(time);
    }

    /**
     * 比较两个util下的date的大小
     * @param curDate 当前时间
     * @param date 要比较的时间
     * @return curDate>date 返回1
     *         curDate<date 返回-1
     */
    public static int compareToDate(java.util.Date curDate, java.util.Date date) {
        return curDate.compareTo(date);
    }

}
