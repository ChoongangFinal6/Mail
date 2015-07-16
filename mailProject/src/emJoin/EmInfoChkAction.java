package emJoin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EmMember;
import model.PhoneInfo;
import service.CommandProcess;
import dao.EmMemberDao;

/**
 * @author 최성훈
 *	ajax로 이미 가입한 회원인지 확인하는 부분
 */

public class EmInfoChkAction implements CommandProcess{
	
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		EmMemberDao emd = EmMemberDao.getInstance();
		
		List<PhoneInfo> infoList = emd.infoList();
		
		int result = 0;
		
		String name = request.getParameter("name");
		String birthdate = request.getParameter("birthdate");
		int gender = Integer.parseInt(request.getParameter("gender"));
		String phone = request.getParameter("phone");
		
		EmMember emMember = new EmMember();
		
		emMember.setEmName(name);
		emMember.setEmBirthdate(birthdate);
		emMember.setEmGender(gender);
		emMember.setEmPhone(phone);
		
		int phoneChk = emd.joinChk(emMember);
		
		if(phoneChk == 1){
			result = 2;
		}else{
			for (int i = 0; i < infoList.size(); i++) {
				if(infoList.get(i).getName().equals(name)){
					if((infoList.get(i).getBirthdate()).substring(0, 10).equals(birthdate)){
						if(infoList.get(i).getGender() == gender){
							if(infoList.get(i).getPhone().equals(phone)){
								result = 1;
							}
						}
					}
				}
			}
		}
		
		request.setAttribute("result", result);
		
		return "emJoin/emInfoChk.jsp";
	}

}
