package emMail;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.EmEmail;
import service.CommandProcess;
import dao.EmMemberDao;

public class EmMailMainAction implements CommandProcess{

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String SelectList = "all";
		
		
		HttpSession session = null;
		session = request.getSession();
		
		String id = "";	
		if(session.getAttribute("id") == null){			
			return "emLogin.do";
		} else {
			id = session.getAttribute("id").toString();
		}
		
		String currentPage = request.getParameter("currentPage");
		if(currentPage == null || currentPage.equals("")){
			currentPage = "1";
		}
		
		EmMemberDao emd = EmMemberDao.getInstance();
		
		List<EmEmail> mailList = emd.getEmailList(id, currentPage);
		
		int totCnt = emd.getTotal(id);
		
		Paging pg = new Paging(totCnt, currentPage);
		
		int startPage = pg.getStartPage();
		int pageBlock = pg.getPageBlock();
		int endPage = pg.getEndPage();
		int totalPage = pg.getTotalPage();
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		
		request.setAttribute("SelectList", SelectList);
		request.setAttribute("mailList", mailList);
		request.setAttribute("id", id);
		
		return "emMailList.jsp";
	}
}