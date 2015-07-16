package emMail;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.EmEmail;
import dao.EmMemberDao;
import service.CommandProcess;

public class EmMailSendViewAction implements CommandProcess{

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String SelectList = "sendView";
		
		HttpSession session = null;
		session = request.getSession();
		
		String id = session.getAttribute("id").toString();
		if(id == null || id.equals("")){
			response.sendRedirect("emLogin.do");
		}
		
		String currentPage = request.getParameter("currentPage");
		if(currentPage == null || currentPage.equals("")){
			currentPage = "1";
		}
		
		EmMemberDao emd = EmMemberDao.getInstance();
		
		List<EmEmail> mailList = emd.getMySendlList(id, currentPage);
		
		int totCnt = emd.sendTotal(id);
		
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
		
		return "emMailList.jsp";
	}

}
