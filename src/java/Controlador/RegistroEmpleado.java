/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Models.ClienteEmpresaDTO;
import Models.ClienteEmpresaDAO;
import Models.EmpleadoDAO;
import Models.EmpleadoDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LAB-USR-CAQP-C0206
 */
@WebServlet(name = "RegistroEmpleado", urlPatterns = {"/RegistroEmpleado"})
public class RegistroEmpleado extends HttpServlet {

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
            EmpleadoDTO empleado = new EmpleadoDTO();
            empleado.setNombresEmpleado(request.getParameter("nombresEmpleado"));
            empleado.setApellidosEmpleado(request.getParameter("apellidosEmpleado"));
            empleado.setUsuarioEmpleado(request.getParameter("usuarioEmpleado"));
            empleado.setPasswordEmpleado(request.getParameter("passwordEmpleado"));
            empleado.setCargo_idCargo(Integer.parseInt(request.getParameter("Cargo_idCargo")));
            empleado.setIdAlmacen(Integer.parseInt(request.getParameter("idAlmacen")));
            empleado.setUrlEmpleado(request.getParameter("urlEmpleado"));

  
            int registrovalid =EmpleadoDAO.Register(empleado);
            
            if(registrovalid==1) // ok
            {
                response.setContentType("text/plain");
                response.getWriter().write("ok");
                //HttpSession session = request.getSession(true);
                //session.setAttribute("cliente", cliente);
                //response.sendRedirect("Cliente.jsp");
            }
            else if (registrovalid==2) // error de dni
            {
                response.setContentType("text/plain");
                response.getWriter().write("error dni");
            }
            else if (registrovalid==3) // error de alias
            {
                response.setContentType("text/plain");
                response.getWriter().write("error alias");
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
