package com.example.ob_app.utils;

import java.text.DecimalFormat;

public class PublicUtils {

    public static String toVND(String amount, String suffix) {
        if (BasicMessageUtil.moneySymbol.equals("₫")) {
            return MathUtils.prettyDouble(MathUtils.divide(Double.parseDouble(amount), 1000.00)) + suffix;
        }
        return fmtMicrometer(amount);
    }

    public static String getSymbol() {
        if (BasicMessageUtil.moneySymbol.equals("₫")) {
            return "K";
        }
        return "";
    }

    public static int getCount(String str, String key) {
        if (str == null || key == null || "".equals(str.trim()) || "".equals(key.trim())) {
            return 0;
        }
        int count = 0;
        int index = 0;
        while ((index = str.indexOf(key, index)) != -1) {
            index = index + key.length();
            count++;
        }
        return count;
    }

    /**
     * 后面会弃用
     */
    public static String saveTwoPoint(String s) {
        String[] split = s.split("\\.");
        if (split.length == 2) {
            String xiaoshu = split[1];
            int xiaoshuLength = xiaoshu.length();
            if (xiaoshuLength > 2) {
                xiaoshu = xiaoshu.substring(0, 2);
            }
            return split[0] + "." + xiaoshu;
        }

        return s;

    }

    /**
     * 保留两位小数
     */
    public static String formatTwoPoint(double value) {
        DecimalFormat df = new DecimalFormat("0.0000");
        String result = df.format(value);
        int inde = firstIndexOf(result, ".");
        String substring = result.substring(0, inde + 3);
        return substring;
    }

    /**
     * 添加逗号 只有在输入的时候保留两位小数
     */
    public static String fmtMicrometer(String text) {
        text = text.replace(",", "");
        DecimalFormat df = null;
        if (text.indexOf(".") > 0) {
            if (text.length() - text.indexOf(".") - 1 == 0) {
                df = new DecimalFormat("###,##0.");
            } else if (text.length() - text.indexOf(".") - 1 == 1) {
                df = new DecimalFormat("###,##0.0");
            } else {
                df = new DecimalFormat("###,##0.00");
            }
        } else {
            df = new DecimalFormat("###,##0");
        }
        double v = 0.00;
        try {
            int i = text.indexOf(".");
            if (i != -1) {
                int length = text.length() - i - 1;
                if (length > 2) {
                    text = text.substring(0, i + 3);
                }
            }
            v = Double.parseDouble(text);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }


        return df.format(v);
    }


    public static String removeComma(String toString) {
        if (toString == null) {
            return "";
        }
        return toString.replace(",", "");

    }

    public static double parseDoubleRemoveComma(String toString) {
        if (toString == null) {
            return 0.00;
        }
        String replace = toString.replace(",", "");
        double v = Double.parseDouble(replace);
        return v;

    }

    public static int firstIndexOf(String str, String pattern) {
        for (int i = 0; i < (str.length() - pattern.length()); i++) {
            int j = 0;
            while (j < pattern.length()) {
                if (str.charAt(i + j) != pattern.charAt(j))
                    break;
                j++;
            }
            if (j == pattern.length())
                return i;
        }
        return -1;
    }


}


