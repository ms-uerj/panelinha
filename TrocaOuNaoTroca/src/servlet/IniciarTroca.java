package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Item;
import model.Usuario;
import dao.ItemDAO;
import dao.UsuarioDAO;

/**
 * Servlet implementation class IniciarTroca
 */
public class IniciarTroca extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IniciarTroca() {
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

		// Recebendo o parâmetro item que indica qual foi o produto escolhido
		String idItem = request.getParameter("item");

		if (idItem != null) {

			Item item = null;

			try {
				// Buscando no banco de dados o item que possui o codigo
				// (id_item) passado por parâmetro
				item = ItemDAO.buscarItem(idItem);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			Usuario usuario = null;

			try {
				// Buscando no banco de dados o dono do item encontrado acima
				usuario = UsuarioDAO.buscarUsuario(String.valueOf(item
						.getDono()));
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			// Iniciando a busca dos itens do usuário logado
			HttpSession session = request.getSession();
			Usuario logado = (Usuario) session.getAttribute("usuario");

			ArrayList<Item> itens = null;

			try {
				itens = ItemDAO.buscarItens(String.valueOf(logado.getId()));
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			request.setAttribute("item", item);
			request.setAttribute("itens", itens);
			request.setAttribute("usuario", usuario);
		}

		RequestDispatcher rd = request.getRequestDispatcher("iniciar_troca.jsp");
		rd.forward(request, response);
		return;

	}

}
