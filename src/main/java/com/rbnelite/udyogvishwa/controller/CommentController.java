package com.rbnelite.udyogvishwa.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.rbnelite.udyogvishwa.dao.CommentDao;

/**
 *
 * @author RBNelite
 */
public class CommentController extends HttpServlet {

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
            out.println("<title>Servlet Demo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Demo at " + request.getContextPath() + "</h1>");
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
       // processRequest(request, response);
        String comment=request.getParameter("comment");
        String cmt_whom=request.getParameter("whom");
        String status_id=request.getParameter("status_id");
       // java.sql.Timestamp date=(new java.sql.Timestamp(new java.util.Date().getTime()));
        Date date= new Date();
        Date cmt_date=date;   
        Long id=Long.parseLong(status_id);
        try
            {
                SessionFactory sf=new Configuration().configure().buildSessionFactory();
                Session s=sf.openSession();
                CommentDao ce=new CommentDao();
                ce.setCmnt(comment);
                ce.setCmt_whom(cmt_whom);
                ce.setStatus_id(id);
                //ce.setCmt_date(cmt_date);
                s.beginTransaction();
                s.save(ce);
                s.getTransaction().commit();
                s.close();
                sf.close();
             }
            catch(Exception e)
            {
                System.out.println(e);
            }
        RequestDispatcher r = request.getRequestDispatcher("Home.jsp");
        r.forward(request, response);
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
