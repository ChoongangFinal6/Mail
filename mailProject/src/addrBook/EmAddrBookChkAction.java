package addrBook;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.EmAddrBook;
import model.EmMember;
import service.CommandProcess;
import dao.EmMemberDao;

public class EmAddrBookChkAction implements CommandProcess {

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		EmMemberDao emd = EmMemberDao.getInstance();
		
		HttpSession session = null;
		session = request.getSession();
		
		String id = session.getAttribute("id").toString();
		
		String mailAddr = request.getParameter("mailAddr");
		
		List<EmMember> allMailAddrList =  emd.emAll();
		List<EmAddrBook> getMailAddrList = emd.addrBookList(id);
		
		int result = 3;
		
		for (int i = 0; i < getMailAddrList.size(); i++) {
			if(getMailAddrList.get(i).getEmAddrBook().equals(mailAddr)){
				result = 0;
				break;
			}else if(mailAddr.contains("@choongang.com") == false){
				result = 1;
				break;
			}else if(mailAddr == id){
				result = 4;
			}
		}
		
		if(result == 3){
			for (int i = 0; i < allMailAddrList.size(); i++) {
				if(allMailAddrList.get(i).getEmId().equals(mailAddr)){
					EmMember emMember = new EmMember();
					
					emMember = emd.emAll(mailAddr);
					
					String name = emMember.getEmName();
					
					emd.addAddrBook(id, mailAddr, name);
					result = 2;
					break;
				}
			}
		}
		
		request.setAttribute("result", result);
		
		return "emAddrBook/emAddrBookChk.jsp";
	}

}
