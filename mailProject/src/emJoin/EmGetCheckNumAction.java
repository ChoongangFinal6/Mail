package emJoin;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CommandProcess;

/**
 * @author 최성훈
 *	ajax로 인증번호를 생성해서 session에 저장하고 확인하는 부분
 */
public class EmGetCheckNumAction implements CommandProcess{

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		
		Random random = new Random();
		int ran = (int) (random.nextDouble() * 100000); 
		System.out.println(ran);
		String emConfirm = String.valueOf(ran);
		HttpSession session = null;
		session = request.getSession();
		session.setAttribute("checkNum", emConfirm);	
		if(session.getAttribute("checkNum") == null){
			result = 0;
		}else{
			result = 1;		
		}
		session.setMaxInactiveInterval(10);
		
		request.setAttribute("result", result);
		
		return "emJoin/emGetCheckNum.jsp";
	}

}
