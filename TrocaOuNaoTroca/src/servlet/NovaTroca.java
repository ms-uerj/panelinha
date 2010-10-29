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

import dao.ItemDAO;
import dao.TrocaDAO;
import dao.UsuarioDAO;

import model.Item;
import model.Troca;
import model.Usuario;

/**
 * Servlet implementation class NovaTroca
 */
public class NovaTroca extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NovaTroca() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			process(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			process(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
		
		String user2 = request.getParameter("user2");
		String item1 = request.getParameter("item1");
		String item2 = request.getParameter("item2");
		
		HttpSession session = request.getSession();
		Usuario usuario1 = (Usuario) session.getAttribute("usuario");
		Usuario usuario2 = UsuarioDAO.buscarUsuario(user2);
		
		Item i1 = ItemDAO.buscarItem(item1);
		Item i2 = ItemDAO.buscarItem(item2);
		
		Troca troca = new Troca();
		troca.setUsuario1(usuario1);
		troca.setUsuario2(usuario2);
		ArrayList<Item> itens = new ArrayList<Item>();
		itens.add(i1);
		itens.add(i2);
		troca.setItens(itens);
		
		TrocaDAO.inserirTroca(troca);
		
	    RequestDispatcher rd = request.getRequestDispatcher("PaginaTroca?cod="+troca.getId());
	    rd.forward(request, response);
	    return;
		
		
	}

}
