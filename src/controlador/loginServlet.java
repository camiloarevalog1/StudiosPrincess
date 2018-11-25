package controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.Usuario;
import util.Controlador;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("memo111");
		HttpSession sesion = request.getSession();
		sesion.invalidate();
        response.sendRedirect("index.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Controlador c = new Controlador();
		String nombre = request.getParameter("username");
		String password = request.getParameter("password");

		System.out.println(nombre);
		boolean exito = c.login(nombre, password);
		
		if (exito==true){
			System.out.println("true");
			HttpSession misession= request.getSession(true);
			Usuario miUsuario= c.buscarUsuario(nombre);
			
			misession.setAttribute("nombre",miUsuario.getNombre());
			misession.setAttribute("contrasena",miUsuario.getClave());
			

			RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");

        	rd.forward(request, response);


		} else{
			System.out.println("false");
			request.setAttribute("entrar", "falso");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		    
		}

	}

}
