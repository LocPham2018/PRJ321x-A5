/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package form;

import connector.MyMail;
import entity.MailMessage;
import entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author AMIN
 */
@WebServlet(name = "sendProcess", urlPatterns = {"/sendProcess"})
public class sendProcess extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession webSession = request.getSession();
            String from = request.getParameter("emailFrom");
            String password = request.getParameter("password");
            String to = request.getParameter("emailTo");
            String cc = request.getParameter("emailCc");
            String subject = request.getParameter("subject");
            String message = request.getParameter("contents");
            if (from.isEmpty() || password.isEmpty() || to.isEmpty() || message.isEmpty()) {
                if (from.isEmpty()) webSession.setAttribute("mailfromMessage", "Sender mail must be non-empty.");
                if (password.isEmpty()) webSession.setAttribute("passwordMessage", "Password mail must be non-empty.");
                if (to.isEmpty()) webSession.setAttribute("mailtoMessage", "Recipient mail must be non-empty.");
                if (message.isEmpty()) webSession.setAttribute("contentsMessage", "Contents must be non-empty.");
                response.sendRedirect("/PRJ321x-A5/compose.jsp");
            } else {
                MailMessage mm = new MailMessage(from, to, cc, subject, message);
                MyMail m = new MyMail();
                Session mailSession = m.getSession(from, password);
                boolean b = m.sendMail(mm, mailSession);
                if (b) webSession.setAttribute("mailNotify", "Mail sent.");
                else webSession.setAttribute("mailNotify", "Sending failed.");
                response.sendRedirect("/PRJ321x-A5/home.jsp");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
