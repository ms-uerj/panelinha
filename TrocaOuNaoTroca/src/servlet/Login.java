package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Usuario;

import dao.UsuarioDAO;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			process(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			process(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException {

		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		
		String erros = "";
		HttpSession session = request.getSession();
		
		try {
			Usuario usuario = UsuarioDAO.buscarLogin(login, senha);
			
			if(usuario==null){
				erros = "Login e/ou senha inválidos";
				session.setAttribute("erros", erros);
			}
			else{
				session.setAttribute("usuario", usuario);
				session.setAttribute("msg", "Login realizado com sucesso");
			}	
		} catch (SQLException e) {
			erros = "Não foi possível realizar esta operação. Tente novamente mais tarde";
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
		return;
		
		
	}

}
