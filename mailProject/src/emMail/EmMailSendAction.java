package emMail;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EmMemberDao;
import service.CommandProcess;

public class EmMailSendAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = null;
		session = request.getSession();
		String id="";
		
		if(request.getParameter("id")!=null) {
			id = request.getParameter("id");
		} else {
			id = session.getAttribute("id").toString();			
		}		
		
		String sendText = request.getParameter("sendText");		
		String sendTitle = request.getParameter("sendTitle");
		String sendAddr = request.getParameter("sendAddr");
		
		String[] addr = null;				

		String Addr = sendAddr.replace(",", "</div>");		
		
		String Addr2 = Addr.replace("<div class=\"mailList\">", "");
		String Addr3 = Addr2.replace(" ", "");

		addr = Addr3.split("</div>");
		
		// 諛쏅뒗 �궗�엺 紐⑸줉(�씠硫붿씪 二쇱냼) 媛믪쓣 ,(肄ㅻ쭏) 瑜� 湲곗��쑝濡� 遺꾪빐		
		
		List<String> list = new ArrayList<String>();

		for(int i=0; i<addr.length; i++) {
			list.add(addr[i]);
		}		
		
		EmMemberDao emd = EmMemberDao.getInstance();
		emd.sendEmail(id, sendTitle, list, sendText);
		
		request.setAttribute("sendText", sendText);
		request.setAttribute("sendTitle", sendTitle);
		request.setAttribute("list", list);	
		
		return "emMailSend.jsp";
	}

}
