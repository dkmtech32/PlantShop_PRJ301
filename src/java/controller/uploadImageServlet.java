/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import dao.PlantDAO;

/**
 *
 * @author Legion
 */
@WebServlet(name = "uploadImageServlet", urlPatterns = {"/uploadImageServlet"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class uploadImageServlet extends HttpServlet {

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
        try {
            Part filePart = request.getPart("file");
       
            int newImageID=dao.PlantDAO.getImgMaxID()+1;
            String imgPath= "images/terra"+String.valueOf(newImageID)+".webp";
               

            String fileName= "images\\terra"+String.valueOf(newImageID)+".webp";
            for (Part part : request.getParts()) {
                part.write("D:\\Courses\\sem4\\PRJ301\\projects\\Plant_Shop\\web\\" + fileName);
            }
            response.getWriter().print("The file uploaded to database sucessfully.");
            if (PlantDAO.checkImgPath(imgPath)) {
                request.setAttribute("warning", "This image path already exist");
            } else {
                if (imgPath.trim().equals("")) {
                    request.setAttribute("warning", "Please input name for new category");
                } else if (PlantDAO.addNewImage(imgPath)) {
                    request.setAttribute("noti", "New category is added");
                } else {
                    request.setAttribute("warning", "Add new category failed");
                }
            }
            request.getRequestDispatcher("addPlant.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(uploadImageServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.getWriter().print("The file uploaded fail.");
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
