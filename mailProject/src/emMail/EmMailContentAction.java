package emMail;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmMemberDao;
import model.EmEmail;
import service.CommandProcess;

public class EmMailContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		EmMemberDao emd = EmMemberDao.getInstance();
		
		int emNo = Integer.parseInt(request.getParameter("emNo"));
		EmEmail emEmail = emd.getEmailDetail(emNo);
		
		int readChk = emEmail.getEmReadChk();
		
		if(readChk == 0){
			emd.readUpdate(emNo);
		}
		
		request.setAttribute("emEmail", emEmail);
	
		return "emMailContent.jsp";
	}
}
