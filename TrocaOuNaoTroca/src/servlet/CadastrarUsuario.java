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
 * Servlet implementation class CadastrarUsuario
 */
public class CadastrarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public CadastrarUsuario() {
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
		
		String nome = request.getParameter("nome");
		String sobrenome = request.getParameter("sobrenome");
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		String confirmacao = request.getParameter("confirmacao");
		String sexo = request.getParameter("sexo");
		String matricula = request.getParameter("matricula");
		
		String destino = "index";
		
		HttpSession sessao = request.getSession();
		
		if(!senha.equals(confirmacao)){
			destino = "cadastro";
			sessao.setAttribute("erro", "Senha e Confirmação de senha não conferem");
		}
		
		
		
		Usuario usuario = new Usuario(email, matricula, nome, senha, sexo, sobrenome);
		
		try {
			UsuarioDAO.cadastrarUsuario(usuario);
		} catch (SQLException e) {
			System.out.println("Erro de Conexão");
			e.printStackTrace();
		}
		
	    RequestDispatcher rd = request.getRequestDispatcher(destino+".jsp");
	    rd.forward(request, response);
	    return;
		
	}

}
