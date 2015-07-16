package emJoin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CommandProcess;

/**
 * @author 최성훈
 *	ajax로 인증번호 입력해서 session에 저장된 인증번호와 확인하는 부분.
 */
public class EmPhoneCheckAction implements CommandProcess{

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int phConfirm = Integer.parseInt(request.getParameter("phConfirm"));
		
		int checkNum = 0;
		int result = 0;
		
		HttpSession session = null;
		session = request.getSession();
		
		if(session.getAttribute("checkNum") != null){
			checkNum = Integer.parseInt(session.getAttribute("checkNum").toString());
		}
		
		if(checkNum == phConfirm){
			result = 1;
		}else if(checkNum != 0){
			result = 2;
		}	
		
		/*request.setAttribute("checkNum", checkNum);
		request.setAttribute("phConfirm", phConfirm);*/
		
		request.setAttribute("result", result);
		
		return "emJoin/emPhoneCheck.jsp";
	}

}
