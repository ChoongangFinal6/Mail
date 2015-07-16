package model;

import java.sql.Date;
import java.util.List;

public class EmEmail {
	private int emNo;
	private String emSendAddr;
	private String emGetAddr;
	private Date emSendDate;
	private String emTitle;
	private String emContent;
	private int emReadChk;	
	private int emSendDelChk;
	private int emGetDelChk;
	// 조회용
	private String pageNum;
	private int start;
	private int end;
	public String getEmGetAddr() {
		return emGetAddr;
	}
	public void setEmGetAddr(String string) {
		this.emGetAddr = string;
	}
	public int getEmNo() {
		return emNo;
	}
	public void setEmNo(int emNo) {
		this.emNo = emNo;
	}
	public String getEmSendAddr() {
		return emSendAddr;
	}
	public void setEmSendAddr(String emSendAddr) {
		this.emSendAddr = emSendAddr;
	}
	public Date getEmSendDate() {
		return emSendDate;
	}
	public void setEmSendDate(Date emSendDate) {
		this.emSendDate = emSendDate;
	}
	public String getEmTitle() {
		return emTitle;
	}
	public void setEmTitle(String emTitle) {
		this.emTitle = emTitle;
	}
	public String getEmContent() {
		return emContent;
	}
	public void setEmContent(String emContent) {
		this.emContent = emContent;
	}
	public int getEmReadChk() {
		return emReadChk;
	}
	public void setEmReadChk(int emReadChk) {
		this.emReadChk = emReadChk;
	}
	public int getEmSendDelChk() {
		return emSendDelChk;
	}
	public void setEmSendDelChk(int emSendDelChk) {
		this.emSendDelChk = emSendDelChk;
	}
	public int getEmGetDelChk() {
		return emGetDelChk;
	}
	public void setEmGetDelChk(int emGetDelChk) {
		this.emGetDelChk = emGetDelChk;
	}
	
	// 조회용
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
}
