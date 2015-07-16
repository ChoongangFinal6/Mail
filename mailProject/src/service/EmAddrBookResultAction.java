package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EmAddrBookResultAction implements CommandProcess {
	
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// sendData는 복수값이므로 배열로 받는다 
		String[] sendData = request.getParameterValues("sendData");
		// sendData의 값을 String으로 변환할 변수 선언
		String mailList = "";
		// for문을 사용해 배열을 String형태로 저장 
		for (int i = 0; i < sendData.length; i++) {
				mailList += "<div class='mailList'>"+sendData[i]+"</div>";		
		} 
		// style={'background-color:#BDBDBD; margin:2px 4px 2px 0px; border:5px soild black;'}
		// String형태로 만든 값을 mailAdressResult.jsp로 넘긴다.
		request.setAttribute("mailList", mailList);
		
		return "emAddrBook/emAddrBookResult.jsp";
	}

}
