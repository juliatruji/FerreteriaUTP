/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Models.AgregarVentaDAO;
import Models.ClienteNaturalDTO;
import Models.ClienteNaturalDAO;
import Models.RequerimientoDAO;
import Models.VerStockProveedoresDAO;
import Models.VerStockProveedoresDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

/**
 *
 * @author LAB-USR-CAQP-C0206
 */
@WebServlet(name = "VerStockProveedores", urlPatterns = {"/VerStockProveedores"})
public class VerStockProveedores extends HttpServlet {

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
        try (
             PrintWriter out = response.getWriter()) {
            String idProducto = request.getParameter("idProducto");
             String tipo = request.getParameter("tipo");
            String ventaCompleta = request.getParameter("ventacompleto");
            
            
            List<VerStockProveedoresDTO> objStockProveedores = VerStockProveedoresDAO.getdatosStockProveedor(Integer.parseInt(idProducto));

            System.out.println(objStockProveedores.size());
            System.out.println("-------------");

            if(objStockProveedores != null)
            {
                HttpSession session = request.getSession(true);

                session.setAttribute("VerStockProveedores", objStockProveedores);
                response.sendRedirect("VerStockProveedores.jsp");
            }
            else
            {
                //response.sendRedirect("JspInvalidLogin.jsp");
                response.setContentType("text/plain");
                response.getWriter().write("error");
            }
            
        }
        catch(Throwable theException)
        {
            System.out.println(theException);
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
