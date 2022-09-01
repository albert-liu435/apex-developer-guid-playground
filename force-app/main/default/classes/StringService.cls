/**
 * https://developer.salesforce.com/docs/atlas.en-us.238.0.apexref.meta/apexref/apex_methods_system_string.htm#apex_System_String_abbreviate
 */
public with sharing class StringService {
    public StringService() {

    }

    
    public static String abbreviate(String str,Integer maxWidth){
            //返回指定长度的字符串的缩写版本，如果当前字符串长于指定长度，则附加省略号；否则，返回不带省略号的原始字符串。
            //maxWidth必须大于4，否则会抛出异常
           String s2= str.abbreviate(maxWidth);
           return s2;

    }


    public static String abbreviate(String str,Integer maxWidth,Integer offset){
            //返回指定长度的字符串的缩写版本，如果当前字符串长于指定长度，则附加省略号；否则，返回不带省略号的原始字符串。
            //maxWidth必须大于4，否则会抛出异常
           String s2= str.abbreviate(maxWidth);
           return s2;

    }

    public static String capitalize(String str) {
        //返回字符串的首字母大写

        return str.capitalize();
    }
    
}