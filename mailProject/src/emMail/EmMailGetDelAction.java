package emMail;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EmMemberDao;
import service.CommandProcess;

public class EmMailGetDelAction implements CommandProcess{

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = null;
		session = request.getSession();
		
		String id = session.getAttribute("id").toString();
		
		EmMemberDao emd = EmMemberDao.getInstance();
		
		int result = 0;
		
		String delData = request.getParameter("delData");
		
		String[] del = delData.split(",");
		
		if(delData != null || !(delData.equals(""))){
			for (int i = 0; i < del.length; i++) {
				result = emd.getMailDel(id, del[i]);
			}
		}

		request.setAttribute("result", result);
		
		return "emGetDel.jsp";
	}
}
