package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.regex.Pattern;

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
			HttpServletResponse response) throws ServletException, IOException,
			ClassNotFoundException {

		String nome = request.getParameter("nome");
		String sobrenome = request.getParameter("sobrenome");
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		String confirmacao = request.getParameter("confirmacao");
		String sexo = request.getParameter("sexo");
		String matricula = request.getParameter("matricula");

		boolean cadastrar = true;
		String erro = "<font color='red'>";

		HttpSession sessao = request.getSession();

		if (!senha.equals(confirmacao)) {
			cadastrar = false;
			erro += "Senha e Confirmação de senha não conferem<br/>";
		}

		if (!Pattern.matches("[0-9]{4}[12][0-9]{7}", matricula)) {
			cadastrar = false;
			erro += "Matrícula inválida: " + matricula + "<br/>";
		}

		try {
			int total = UsuarioDAO.buscarMatricula(matricula);

			if (total > 0) {
				cadastrar = false;
				erro += "Matrícula já cadastrada no sistema: " + matricula
						+ "<br/>";
			}
		} catch (SQLException e1) {

			e1.printStackTrace();
		}

		if (cadastrar) {

			Usuario usuario = new Usuario(email, matricula, nome, senha, sexo,
					sobrenome);

			try {
				UsuarioDAO.cadastrarUsuario(usuario);
			} catch (SQLException e) {
				cadastrar = false;
				erro += "Não foi possível completar esta ação. Tente novamente mais tarde.<br/>";
				e.printStackTrace();
			}

		}

		RequestDispatcher rd;

		if (cadastrar) {
			sessao.setAttribute("mensagem", "Cadastro realizado com sucesso");
			rd = request.getRequestDispatcher("index.html");
		} else {
			sessao.setAttribute("erros", erro+"</font><hr>");
			request.setAttribute("nome", nome);
			request.setAttribute("sobrenome", sobrenome);
			request.setAttribute("email", email);
			request.setAttribute("matricula", matricula);
			
			rd = request.getRequestDispatcher("cadastro.jsp");
		}

		rd.forward(request, response);
		return;

	}

}
