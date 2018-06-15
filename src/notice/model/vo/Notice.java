package notice.model.vo;

import java.sql.Date;

public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContents;
	private String noticeWriter;
	private Date reportingDate;
	private int noticeViews;
	
	public Notice() {
		super();
		
	}
	
	public Notice(int noticeNo, String noticeTitle, String noticeContents, String noticeWriter, Date reportingDate,
			int noticeViews) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContents = noticeContents;
		this.noticeWriter = noticeWriter;
		this.reportingDate = reportingDate;
		this.noticeViews = noticeViews;
	}

	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContents() {
		return noticeContents;
	}
	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}
	public String getNoticeWriter() {
		return noticeWriter;
	}
	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}
	public Date getReportingDate() {
		return reportingDate;
	}
	public void setReportingDate(Date reportingDate) {
		this.reportingDate = reportingDate;
	}
	public int getNoticeViews() {
		return noticeViews;
	}
	public void setNoticeViews(int noticeViews) {
		this.noticeViews = noticeViews;
	}
	
	
	
	

}
