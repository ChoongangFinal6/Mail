package emLogin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmMemberDao;
import service.CommandProcess;

public class EmLoginChkAction implements CommandProcess{

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id")+"@choongang.com";
		String password = request.getParameter("password");
		
		EmMemberDao emd = EmMemberDao.getInstance();
		int result = emd.emMemChk(id, password);
		
		request.setAttribute("result", result);
		return "emLogin/emLoginChk.jsp";
	}
	
}
