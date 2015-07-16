package model;

import java.sql.Date;

public class EmAddrBook {
	private String emId;
	private String emAddrBook;
	private String emAddrName;
	private int emBolckChk;
	
	public String getEmId() {
		return emId;
	}
	public void setEmId(String emId) {
		this.emId = emId;
	}
	public String getEmAddrBook() {
		return emAddrBook;
	}
	public void setEmAddrBook(String emAddrBook) {
		this.emAddrBook = emAddrBook;
	}
	public String getEmAddrName() {
		return emAddrName;
	}
	public void setEmAddrName(String emAddrName) {
		this.emAddrName = emAddrName;
	}
	public int getEmBolckChk() {
		return emBolckChk;
	}
	public void setEmBolckChk(int emBolckChk) {
		this.emBolckChk = emBolckChk;
	}
}
