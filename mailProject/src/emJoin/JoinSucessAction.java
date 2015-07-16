package emJoin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EmMember;
import service.CommandProcess;
import dao.EmMemberDao;

/**
 * @author 최성훈
 *	회원가입에 성공했을시 회원의 내용을 DB에 저장하는 부분
 */
public class JoinSucessAction implements CommandProcess{

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String birthdate = request.getParameter("birthdate");
		int gender = Integer.parseInt(request.getParameter("gender"));
		String phone = request.getParameter("phone");
		
		EmMember em = new EmMember();
		
		em.setEmId(id+"@choongang.com");
		em.setEmPassword(password);
		em.setEmName(name);
		em.setEmBirthdate(birthdate);
		em.setEmGender(gender);
		em.setEmPhone(phone);
		
		EmMemberDao emd = EmMemberDao.getInstance();
		
		int result = emd.addEmMem(em);
		
		request.setAttribute("result", result);
		
		return "emJoin/joinSucess.jsp";
	}

}
