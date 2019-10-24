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


	public static Date changeToDate(String date) throws ParseException{
		//String -> Date SimpleDateFormat to_date
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utildate = sdf.parse(date);
		//java.util.Date -> java.sql.Date  1970-> 1990-01-01
		long time = utildate.getTime();
		//1970 1 1 -> 1990-01-01
		return new Date(time);
	}
}
