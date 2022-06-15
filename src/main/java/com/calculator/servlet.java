package com.calculator;

import net.objecthunter.exp4j.Expression;
import net.objecthunter.exp4j.ExpressionBuilder;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;


public class servlet extends HttpServlet {
    static ArrayList<String> historyStack = new ArrayList<>();

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {


        String expression = req.getParameter("txt");
//        System.out.println(expression);

//        ScriptEngineManager mgr = new ScriptEngineManager();
//        ScriptEngine engine = mgr.getEngineByName("JavaScript");
        Object ans =0;
//        try {
//            ans = engine.eval(expression);
//        } catch (ScriptException e) {
////            throw new RuntimeException(e);
//            System.out.println("error in evaluting expression");
//            req.setAttribute("answer","wrong expression");
//            req.getRequestDispatcher("index.jsp").include(req,res);
//
//        }






            //calculation section


        try {
            Expression exp = new ExpressionBuilder(expression).build();
            double result =  exp.evaluate();
//            String r=Eval.evalExp(expression);

//            double result = Double.parseDouble(r);


            int resInt = (int) result;

            if(resInt==result){
                ans = (Object) resInt;
            }else{
                ans = (Object) result;
            }


            historyStack.add(0,expression+" = "+ans);



        }catch (Exception e){

            ans = "invalid expresion";

        }



//        System.out.println(ans);
//        RequestDispatcher rd = req.getRequestDispatcher("showresult");
//        rd.forward(req,res);


        System.out.println(historyStack.size());


        req.setAttribute("history",historyStack);


        req.setAttribute("answer",ans);




        req.getRequestDispatcher("index.jsp").forward(req,res);


        System.out.println("redirecting to answer page");


//        rd.include(req,res);
//        res.sendRedirect("index.jsp");
    }


}
