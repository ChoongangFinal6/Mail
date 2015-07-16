package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.EmAddrBook;
import dao.EmMemberDao;

public class EmAddrBookAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = null;
		session = request.getSession();
		
		String id = session.getAttribute("id").toString();
		
		EmMemberDao emd = EmMemberDao.getInstance();
		List<EmAddrBook> getMailAddrList = emd.addrBookList(id);
		
		// List값을 mailAdress.jsp페이지로 넘긴다. 
		request.setAttribute("getMailAddrList", getMailAddrList);
		
		return "emAddrBook/emAddrBook.jsp";
	}

}
