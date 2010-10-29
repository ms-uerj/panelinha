package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Item;
import model.Usuario;

import dao.ItemDAO;
import dao.UsuarioDAO;

/**
 * Servlet implementation class Usuario
 */
public class PaginaUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PaginaUsuario() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// Recebendo o parâmetro codigo que vem por GET na url
		String codigo = request.getParameter("cod");

		if (codigo != null) {

			Usuario usuario = null;

			try {
				// Buscando no banco de dados o usuário que possui o codigo
				// (id_usuario) passado por parâmetro
				usuario = UsuarioDAO.buscarUsuario(codigo);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// Verificando se o usuário foi encontrado
			if (usuario == null) {
				request.setAttribute("erro",
						"Usuário não encontrado no sistema");

			} else {

				ArrayList<Item> itens = null;

				try {

					itens = ItemDAO.buscarItens(codigo);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				request.setAttribute("itens", itens);
				request.setAttribute("usuario", usuario);
				
				
			}
		} else {
			request.setAttribute("erro", "Código Inválido");
		}

		RequestDispatcher rd = request.getRequestDispatcher("usuario.jsp");
		rd.forward(request, response);
		return;

	}

}
