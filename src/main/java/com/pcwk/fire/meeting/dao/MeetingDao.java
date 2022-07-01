package com.pcwk.fire.meeting.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.fire.cmn.DTO;
import com.pcwk.fire.meeting.domain.MeetingVO;

public interface MeetingDao {
	
	/**
	 * 조회 건수 증가
	 * @param inVO
	 * @return 1(성공) / 0(실패)
	 * @throws SQLException
	 */
	int updateReadCnt(MeetingVO inVO) throws SQLException;
	/**
	 * 목록조회 
	 * @param dto
	 * @return List<UserVO>
	 * @throws SQLException
	 */
	List<MeetingVO> doRetrieve(DTO dto) throws SQLException;
	
	/**
	 * 미팅 삭제 
	 * @param inVO
	 * @return 1(성공)/0(실패)
	 * @throws SQLException
	 */
	int doDelete(MeetingVO inVO) throws SQLException;

	/**
	 * 미팅 수정 기능
	 * @param inVO
	 * @return 1(성공)/0(실패)
	 * @throws SQLException
	 */
	int doUpdate(MeetingVO inVO) throws SQLException;
	
	int getCount(MeetingVO inVO) throws SQLException;

	/**
	 * 미팅 등록
	 * 
	 * @param inVO
	 * @return 1(성공)/0(실패)
	 * @throws ClassCastException
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	int doInsert(MeetingVO inVO) throws SQLException;//수정


	/**
	 * 회원단건 retruen
	 * 
	 * @param inVO
	 * @return UserVO
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	MeetingVO doSelectOne(MeetingVO inVO) throws SQLException;
}
