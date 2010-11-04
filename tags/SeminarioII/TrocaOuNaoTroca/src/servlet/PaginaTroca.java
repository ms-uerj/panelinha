package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Troca;

import dao.TrocaDAO;

/**
 * Servlet implementation class PaginaTroca
 */
public class PaginaTroca extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaginaTroca() {
        super();
        // TODO Auto-generated constructor stub
    }

	
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
		
		int codigo = Integer.parseInt(request.getParameter("cod"));
		
		Troca troca = TrocaDAO.buscarTroca(codigo);
		
		request.setAttribute("troca", troca);
		
		RequestDispatcher rd= request.getRequestDispatcher("troca.jsp");
		rd.forward(request, response);
		return;
		
		
	}

}
