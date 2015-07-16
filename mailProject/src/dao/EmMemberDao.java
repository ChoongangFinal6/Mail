package dao;

import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.EmAddrBook;
import model.EmEmail;
import model.EmMember;
import model.PhoneInfo;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import emMail.Paging;

public class EmMemberDao {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	SqlSession session;

	private static EmMemberDao instance;

	private EmMemberDao() {
	}

	public static EmMemberDao getInstance() {
		if (instance == null) {
			instance = new EmMemberDao();
		}
		return instance;
	}

	private SqlSession getSession() {
		SqlSession session = null;
		Reader r = null;
		try {
			r = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(r);
			session = sf.openSession(true);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return session;
	}

	private Connection getConnection() {
		try {
			Context initial = new InitialContext();
			DataSource ds = (DataSource) initial
					.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}

	public List<PhoneInfo> infoList() {
		List<PhoneInfo> infoList = null;
		session = getSession();

		infoList = session.selectList("infoList");

		return infoList;
	}

	public List<EmMember> emAll() {
		List<EmMember> emAllList = null;

		session = getSession();

		emAllList = session.selectList("emAll");

		return emAllList;
	}

	public int emAllSarch(String id) {
		int result = 0;
		session = getSession();
		List<EmMember> list = new ArrayList<EmMember>();

		list = session.selectList("emAllSarch", id);

		if (list.size() > 0) {
			result = 1;
		}

		return result;
	}

	public EmMember emAll(String id) {
		session = getSession();
		EmMember emMember = new EmMember();

		emMember = (EmMember) session.selectOne("emAllSarch", id);

		return emMember;
	}

	public List<EmAddrBook> addrBookList(String id) {
		List<EmAddrBook> emBookAllList = null;

		session = getSession();

		emBookAllList = session.selectList("addrBookList", id);

		return emBookAllList;
	}

	public int addAddrBook(String id, String addId, String name) {
		int result = 0;

		session = getSession();

		EmAddrBook emAddrBook = new EmAddrBook();

		emAddrBook.setEmId(id);
		emAddrBook.setEmAddrBook(addId);
		emAddrBook.setEmAddrName(name);

		result = session.insert("addAddrBook", emAddrBook);

		return result;
	}

	public int sendEmail(String id, String sendTitle, List<String> Addr,
			String sendText) {
		int result = 0;

		session = getSession();

		EmEmail emEmail = new EmEmail();

		for (int i = 0; i < Addr.size(); i++) {
			int emno = (int) session.selectOne("EmailNo");

			emEmail.setEmNo(emno + 1);
			emEmail.setEmSendAddr(id);
			emEmail.setEmGetAddr(Addr.get(i));
			emEmail.setEmTitle(sendTitle);
			emEmail.setEmContent(sendText);
			emEmail.setEmReadChk(0);

			result = session.insert("EmEmail", emEmail);
		}
		return result;
	}

	public int addDelBook(String id, String delId) {
		int result = 0;

		session = getSession();

		EmAddrBook emAddrBook = new EmAddrBook();

		emAddrBook.setEmId(id);
		emAddrBook.setEmAddrBook(delId);

		result = session.delete("addDelBook", emAddrBook);

		return result;
	}

	public int addEmMem(EmMember em) {
		int result = 0;

		session = getSession();

		result = session.insert("addEmMem", em);

		return result;
	}

	public int joinChk(EmMember emMember) {
		int result = 0;

		session = getSession();

		List<EmMember> list = null;

		list = session.selectList("joinChk", emMember);

		if (list.size() > 0) {
			result = 1;
		}

		return result;
	}

	public int emMemChk(String id, String password) {
		int result = 0;

		session = getSession();

		List<EmMember> list = null;

		list = session.selectList("emMemChk", id);

		if (list.size() > 0) {
			result = 1;
			if (list.get(0).getEmPassword().equals(password)) {
				result = 2;
			}
		}

		return result;
	}

	public List<EmEmail> getEmailList(String id, String currentPage) {

		List<EmEmail> list = null;

		session = getSession();

		EmEmail emEmail = new EmEmail();

		emEmail.setEmGetAddr(id);

		int total = (int) session.selectOne("getTotalCnt", id);

		Paging pg = new Paging(total, currentPage);

		emEmail.setStart(pg.getStart());
		emEmail.setEnd(pg.getEnd());

		list = session.selectList("getEmailList", emEmail);

		session.close();

		return list;
	}

	public int getTotal(String id) {

		session = getSession();

		int total = (int) session.selectOne("getTotalCnt", id);

		session.close();

		return total;
	}

	public EmEmail getEmailDetail(int emId) {
		EmEmail emEmail = null;

		session = getSession();

		emEmail = (EmEmail) session.selectOne("getEmailDetail", emId);

		return emEmail;
	}

	public void readUpdate(int emId) {
		session = getSession();

		session.update("readUpdate", emId);

		session.close();
	}

	public int getMailDel(String id, String emNo) {
		int result = 0;
		session = getSession();

		EmEmail emEmail = new EmEmail();

		emEmail.setEmGetAddr(id);
		emEmail.setEmNo(Integer.parseInt(emNo));

		result = session.update("getMailDel", emEmail);

		session.close();

		return result;
	}

	public int sendMailDel(String id, String emNo) {
		int result = 0;
		session = getSession();

		EmEmail emEmail = new EmEmail();

		emEmail.setEmSendAddr(id);
		emEmail.setEmNo(Integer.parseInt(emNo));

		result = session.update("sendMailDel", emEmail);

		session.close();

		return result;
	}

	public List<EmEmail> getMySendlList(String id, String currentPage) {

		List<EmEmail> list = null;

		session = getSession();

		EmEmail emEmail = new EmEmail();

		emEmail.setEmSendAddr(id);

		int total = (int) session.selectOne("sendTotalCnt", id);

		Paging pg = new Paging(total, currentPage);

		emEmail.setStart(pg.getStart());
		emEmail.setEnd(pg.getEnd());

		list = session.selectList("getMySendlList", emEmail);

		session.close();

		return list;
	}

	public int sendTotal(String id) {

		session = getSession();

		int total = (int) session.selectOne("sendTotalCnt", id);

		session.close();

		return total;
	}

	public List<EmEmail> getNotReadlList(String id, String currentPage) {

		List<EmEmail> list = null;

		session = getSession();

		EmEmail emEmail = new EmEmail();

		emEmail.setEmGetAddr(id);

		int total = (int) session.selectOne("notReadTotalCnt", id);

		Paging pg = new Paging(total, currentPage);

		emEmail.setStart(pg.getStart());
		emEmail.setEnd(pg.getEnd());

		list = session.selectList("getNotReadlList", emEmail);

		session.close();

		return list;
	}

	public int notReadTotalCnt(String id) {

		session = getSession();

		int total = (int) session.selectOne("notReadTotalCnt", id);

		session.close();

		return total;
	}
}