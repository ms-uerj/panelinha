package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MensagemDAO;

import model.Mensagem;
import model.Usuario;

/**
 * Servlet implementation class NovaMensagem
 */
public class NovaMensagem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NovaMensagem() {
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
		
		String idTroca = request.getParameter("idTroca");
		String texto = request.getParameter("texto");
		String u1 = request.getParameter("usuario1");
		String u2 = request.getParameter("usuario2");
		
		Mensagem msg = new Mensagem();
		msg.setTexto(texto);
		msg.setTroca(Integer.parseInt(idTroca));
		
		Usuario usuario1 = new Usuario();
		Usuario usuario2 = new Usuario();
		usuario1.setId(Integer.parseInt(u1));
		usuario2.setId(Integer.parseInt(u2));
		msg.setRemetente(usuario1);
		msg.setDestinatario(usuario2);
		
		try {
			MensagemDAO.inserirMensagem(msg);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("PaginaTroca?cod="+idTroca);
		rd.forward(request, response);
		return;
		
	}

}
