package addrBook;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CommandProcess;
import dao.EmMemberDao;

public class EmDelBookChkAction implements CommandProcess {

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		EmMemberDao emd = EmMemberDao.getInstance();
		
		int result = 0;
		HttpSession session = null;
		session = request.getSession();
		
		String id = session.getAttribute("id").toString();
		
		String delData = request.getParameter("delData");
		
		String[] del = delData.split(",");
		
		if(delData != null || !(delData.equals(""))){
			for (int i = 0; i < del.length; i++) {
				result = emd.addDelBook(id, del[i]);
			}
		}

		request.setAttribute("result", result);
		
		return "emAddrBook/emDelBookChk.jsp";
	}

}
