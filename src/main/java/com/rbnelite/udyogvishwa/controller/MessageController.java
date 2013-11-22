/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rbnelite.udyogvishwa.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.rbnelite.udyogvishwa.model.MessageDao;


/**
 *
 * @author RBNelite
 */
public class MessageController extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MessageController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MessageController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          HttpSession session = request.getSession(true); 
      if(request.getParameter("send_msg")!=null);
         {
            String senderId=(String)session.getAttribute("User_Name");
            String to_msg=request.getParameter("to_msg");
            String message=request.getParameter("message");
            String msgDate=request.getParameter("mdate");
            String s_flag=request.getParameter("sflag");
            String r_flag=request.getParameter("rflag");
            
              try
              {
                  SessionFactory sf=new Configuration().configure().buildSessionFactory();
                  Session s=sf.openSession();
                  MessageDao mes=new MessageDao();
                  mes.setSender(senderId);
                  mes.setTomsg(to_msg);
                  mes.setMessage(message);
                  mes.setMsgDate(msgDate);
                  mes.setSen_flg(s_flag);
                  mes.setRes_flg(r_flag);
                   s.beginTransaction();
                   s.save(mes);
                   s.getTransaction().commit();
                   s.close();
                   sf.close();
                   response.sendRedirect("Message.jsp");
              }
              catch(Exception e)
              {
                  System.out.println(e);
              }
             
         }
         
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
