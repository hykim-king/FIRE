package com.pcwk.fire.meeting.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pcwk.fire.cmn.DTO;
import com.pcwk.fire.meeting.dao.MeetingDao;
import com.pcwk.fire.meeting.domain.MeetingVO;

@Service("meetingService")
public class MeetingServiceImpl implements MeetingService {

	final Logger LOG = LogManager.getLogger(this.getClass());
	
	@Autowired
	private MeetingDao meetingDao;
	
	public MeetingServiceImpl() {
		
	}

	@Override
	public List<MeetingVO> doRetrieve(DTO dto) throws SQLException {
		return meetingDao.doRetrieve(dto);
	}

	@Override
	public int doDelete(MeetingVO inVO) throws SQLException {
		return meetingDao.doDelete(inVO);
	}

	@Override
	public int doUpdate(MeetingVO inVO) throws SQLException {
		return meetingDao.doUpdate(inVO);
	}

	@Override
	public int doInsert(MeetingVO inVO) throws SQLException {
		return meetingDao.doInsert(inVO);
	}

	@Override
	public MeetingVO doSelectOne(MeetingVO inVO) throws SQLException {
		// 단건 조회
		// 조회 카운트 증가
		MeetingVO outVO = meetingDao.doSelectOne(inVO);
		// 2.1. 본인이 등록한 글은 조회 count가 증가 되지 않게 처리
		
//				if(outVO != null && !outVO.getRegId().equals(inVO.getModId())) {
		if(outVO != null) {
			meetingDao.updateReadCnt(inVO);
		}
		return outVO;
	}

}
