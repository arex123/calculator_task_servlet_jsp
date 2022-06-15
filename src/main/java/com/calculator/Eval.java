package com.calculator;

public class Eval {
    public static String evalExp(String exp){
        String ans="";

        StringBuilder sb = new StringBuilder(exp);


        //evaluting reminder
        for(int i=0;i<sb.length();i++){

            if(sb.charAt(i)=='%'){
                float a =  (float)sb.charAt(i-1)-'0';
                float b = (float)sb.charAt(i+1)-'0';

                sb.delete(i-1,i+1);
                float res = a%b;
                sb.insert(i-1,res+"");

            }

        }

        //evaluting division
        for(int i=0;i<sb.length();i++){

            if(sb.charAt(i)=='/'){
                float a =  (float)sb.charAt(i-1)-'0';
                float b = (float)sb.charAt(i+1)-'0';

                sb.delete(i-1,i+1);
                float res = a/b;
                sb.insert(i-1,res+"");

            }


        }



        //evaluting multiplication
        for(int i=0;i<sb.length();i++){

            if(sb.charAt(i)=='*'){
                float a =  (float)sb.charAt(i-1)-'0';
                float b = (float)sb.charAt(i+1)-'0';

                sb.delete(i-1,i+1);
                float res = a*b;
                sb.insert(i-1,res+"");

            }

        }


        //evaluting plus
        for(int i=0;i<sb.length();i++){

            if(sb.charAt(i)=='+'){
                float a =  (float)sb.charAt(i-1)-'0';
                float b = (float)sb.charAt(i+1)-'0';

                sb.delete(i-1,i+1);
                float res = a+b;
                sb.insert(i-1,res+"");

            }

        }


        //evaluting minus
        for(int i=0;i<sb.length();i++){

            if(sb.charAt(i)=='-'){
                float a =  (float)sb.charAt(i-1)-'0';
                float b = (float)sb.charAt(i+1)-'0';

                sb.delete(i-1,i+1);
                float res = a-b;
                sb.insert(i-1,res+"");

            }

        }






        return ans;
    }
}
