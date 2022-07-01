package com.pcwk.fire.meeting.domain;

import com.pcwk.fire.cmn.DTO;

public class MeetingVO extends DTO {
	private int mSeq;     
	private int mLoc;     
	private String mTitle;   
	private int mNum;     
	private String mKind;    
	private String mStatus;  
	private String mDate;    
	private String mContents;
	private int mReadcnt;
	private String regDt;
	private String regId;
	private String modDt;
	private String modId;

	public MeetingVO() {
		
	}

	public MeetingVO(int mSeq, int mLoc, String mTitle, int mNum, String mKind, String mStatus, String mDate,
			String mContents, int mReadcnt, String regDt, String regId, String modDt, String modId) {
		super();
		this.mSeq = mSeq;
		this.mLoc = mLoc;
		this.mTitle = mTitle;
		this.mNum = mNum;
		this.mKind = mKind;
		this.mStatus = mStatus;
		this.mDate = mDate;
		this.mContents = mContents;
		this.mReadcnt = mReadcnt;
		this.regDt = regDt;
		this.regId = regId;
		this.modDt = modDt;
		this.modId = modId;
	}

	public int getmSeq() {
		return mSeq;
	}

	public void setmSeq(int mSeq) {
		this.mSeq = mSeq;
	}

	public int getmLoc() {
		return mLoc;
	}

	public void setmLoc(int mLoc) {
		this.mLoc = mLoc;
	}

	public String getmTitle() {
		return mTitle;
	}

	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}

	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}

	public String getmKind() {
		return mKind;
	}

	public void setmKind(String mKind) {
		this.mKind = mKind;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public String getmDate() {
		return mDate;
	}

	public void setmDate(String mDate) {
		this.mDate = mDate;
	}

	public String getmContents() {
		return mContents;
	}

	public void setmContents(String mContents) {
		this.mContents = mContents;
	}

	public int getmReadcnt() {
		return mReadcnt;
	}

	public void setmReadcnt(int mReadcnt) {
		this.mReadcnt = mReadcnt;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getModDt() {
		return modDt;
	}

	public void setModDt(String modDt) {
		this.modDt = modDt;
	}

	public String getModId() {
		return modId;
	}

	public void setModId(String modId) {
		this.modId = modId;
	}

	@Override
	public String toString() {
		return "MeetingVO [mSeq=" + mSeq + ", mLoc=" + mLoc + ", mTitle=" + mTitle + ", mNum=" + mNum + ", mKind="
				+ mKind + ", mStatus=" + mStatus + ", mDate=" + mDate + ", mContents=" + mContents + ", mReadcnt="
				+ mReadcnt + ", regDt=" + regDt + ", regId=" + regId + ", modDt=" + modDt + ", modId=" + modId
				+ ", toString()=" + super.toString() + "]";
	}

	
}
