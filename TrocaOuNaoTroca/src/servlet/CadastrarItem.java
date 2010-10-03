package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ItemDAO;

import model.Item;
import model.Usuario;

/**
 * Servlet implementation class CadastrarItem
 */
public class CadastrarItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CadastrarItem() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		
		String titulo = request.getParameter("titulo");
		String imagem = request.getParameter("imagem");
		String descricao = request.getParameter("descricao");
		String categoria = request.getParameter("categoria");
		
		Item item = new Item();
		
		item.setTitulo(titulo);
		item.setImagem_item(imagem);
		item.setDescricao_item(descricao);
		item.setCategoria(categoria);
		
		String erro = null;
		
		try {
			ItemDAO.cadastrarItem(item);
		} catch (ClassNotFoundException e) {
			erro = "Não foi possível completar esta ação. Tente novamente mais tarde.<br/>";
			e.printStackTrace();
		} catch (SQLException e) {
			erro = "Não foi possível completar esta ação. Tente novamente mais tarde.<br/>";
			e.printStackTrace();
		}
		
		String destino = "cadastrarItem.jsp";
		
		if(erro == null){
			HttpSession session = request.getSession();
			Usuario usuario = (Usuario) session.getAttribute("usuario");
			destino = "PaginaUsuario?cod="+usuario.getId();
		}
		
		request.setAttribute("erro", erro);
		
		RequestDispatcher rd = request.getRequestDispatcher(destino);
		rd.forward(request, response);
		return;
		
	}

}
