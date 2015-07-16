package emLogin;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CommandProcess;

public class EmLoginSucessAction implements CommandProcess{

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id") + "@choongang.com";
		
		HttpSession session = null;
		session = request.getSession();
		session.setAttribute("id", id);		
		return "emLogin/emLoginSucess.jsp";
	}

}
