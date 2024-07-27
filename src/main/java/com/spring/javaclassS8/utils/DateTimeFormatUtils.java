package com.spring.javaclassS8.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTimeFormatUtils {

    public static String formatDate(String dateString) {
        try {
            SimpleDateFormat inputSdf = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat outputSdf = new SimpleDateFormat("yyyy.MM.dd(E)");
            Date date = inputSdf.parse(dateString);
            return outputSdf.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
            return dateString;
        }
    }

    public static String formatTime(String timeString) {
        try {
            SimpleDateFormat inputSdf = new SimpleDateFormat("HH:mm:ss");
            SimpleDateFormat outputSdf = new SimpleDateFormat("HH:mm");
            Date time = inputSdf.parse(timeString);
            return outputSdf.format(time);
        } catch (ParseException e) {
            e.printStackTrace();
            return timeString;
        }
    }
}