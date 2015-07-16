package emJoin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;
import dao.EmMemberDao;

/**
 * @author 최성훈
 *	ajax로 가입할 때 존재하는 id인지 확인하는 부분
 */
public class IdChkAction implements CommandProcess{

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id")+"@choongang.com";
		
		EmMemberDao emd = EmMemberDao.getInstance();
		
		int result = emd.emAllSarch(id);
		request.setAttribute("result", result);
		
		return "emJoin/IdChk.jsp";
	}
}
