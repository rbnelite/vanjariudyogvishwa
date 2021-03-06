/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package COM.RBNELITE.BUSINESSPORTAL.CONTROLLER;

import COM.RBNELITE.ENTITY.PhotoUploadDao;
import COM.RBNELITE.ENTITY.ProfileImageDao;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author RBNelite
 */
public class ProfileImageServlet extends HttpServlet {
   
     private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "images";
    private static final int THRESHOLD_SIZE = 1024 * 1024 * 3; // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int REQUEST_SIZE = 1024 * 1024 * 50; // 50MB


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
            out.println("<title>Servlet ProfileImageServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileImageServlet at " + request.getContextPath() + "</h1>");
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
         HttpSession ses=request.getSession(true);
       
        if (!ServletFileUpload.isMultipartContent(request)) {
            // if not, we stop here
            return;
        }
          
        // configures some settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(THRESHOLD_SIZE);
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
         
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setFileSizeMax(MAX_FILE_SIZE);
        upload.setSizeMax(REQUEST_SIZE);
         
        // constructs the directory path to store upload file
        String uploadPath = getServletContext().getRealPath("")
            + File.separator + UPLOAD_DIRECTORY;
      
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
           
        }
       
        try {
            // parses the request's content to extract file data
            List formItems = upload.parseRequest(request);
            Iterator iter = formItems.iterator();
            
            // iterates over form's fields
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                // processes only fields that are not form fields
                if (!item.isFormField()) {
                    String fileName = new File(item.getName()).getName();
                    String filePath = uploadPath + File.separator + fileName;
                   
                    String dataFile=request.getParameter(filePath);
                    String userName=(String)ses.getAttribute("User_mail");
                    try{
                                SessionFactory sf=new Configuration().configure().buildSessionFactory();
                                Session s=sf.openSession();
                                ProfileImageDao photo=new ProfileImageDao();
                                photo.setPath(filePath);
                                photo.setUser_mail(userName);
                                s.beginTransaction();
                                s.save(photo);
                                s.getTransaction().commit();
                                s.close();
                                sf.close();
                                RequestDispatcher r = request.getRequestDispatcher("Home.jsp");
                                r.forward(request, response);

                            }catch(Exception e)
                            {
                                System.out.println(e);
                            }
                    
                 //  System.out.println(filePath+"vikas");
                    File storeFile = new File(filePath);
                     
                    // saves the file on disk
                    item.write(storeFile);
                }
            }
            request.setAttribute("message", "Upload has been done successfully!");
        } catch (Exception ex) {
            request.setAttribute("message", "There was an error: " + ex.getMessage());
        }
        
        getServletContext().getRequestDispatcher("/Photo.jsp").forward(request, response);
              
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
