/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Models.ProveedorDAO;
import Models.ProveedorDTO;
import Models.RequerimientoDAO;
import Models.RequerimientoDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DetalleRequerimiento", urlPatterns = {"/DetalleRequerimiento"})
public class DetalleRequerimiento extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            RequerimientoDTO requerimiento = new RequerimientoDTO();
            
            String idRequerimiento = request.getParameter("id");
            String nombre = request.getParameter("nombre");
            String fecha = request.getParameter("fecha");
                       
            
            RequerimientoDTO datoscompletos = RequerimientoDAO.getdatosRequerimientoDetalle(idRequerimiento);
            datoscompletos.setNombreAlmacen(nombre);
                    
            System.out.println(datoscompletos.getNombreAlmacen());
            System.out.println(datoscompletos.getProductos().size());
            System.out.println("-------");
            
            if(datoscompletos != null)
            {
                HttpSession session = request.getSession(true);

                session.setAttribute("listaRequerimientoDetalle", datoscompletos);
                response.sendRedirect("ListaRequerimientosDetalle.jsp");
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
