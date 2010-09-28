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
 * Servlet implementation class PaginaItem
 */
public class PaginaItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PaginaItem() {
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

			Item item = null;

			try {
				// Buscando no banco de dados o item que possui o codigo
				// (id_item) passado por parâmetro
				item = ItemDAO.buscarItem(codigo);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			// Verificando se o item foi encontrado
			if (item == null) {
				request.setAttribute("erro", "Item não encontrado no sistema");

			} else {

				request.setAttribute("item", item);
			}
		} else {
			request.setAttribute("erro", "Código Inválido");
		}

		RequestDispatcher rd = request.getRequestDispatcher("item.jsp");
		rd.forward(request, response);
		return;

	}

}
