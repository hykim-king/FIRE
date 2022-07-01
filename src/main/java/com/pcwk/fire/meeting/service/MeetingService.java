package com.pcwk.fire.meeting.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.fire.cmn.DTO;
import com.pcwk.fire.meeting.domain.MeetingVO;



public interface MeetingService {
	/**
	 * 게시글 목록조회
	 * @param dto
	 * @return List<BoardVO>
	 * @throws SQLException
	 */
	List<MeetingVO> doRetrieve(DTO dto) throws SQLException;
	
	/**
	 * 게시글 삭제
	 * @param inVO
	 * @return 1(성공) / 0(실패)
	 * @throws SQLException
	 */
	int doDelete(MeetingVO inVO) throws SQLException;
	
	/**
	 * 게시글 수정 가능
	 * @param inVO
	 * @return 1(성공) / 0(실패)
	 * @throws SQLException
	 */
	int doUpdate(MeetingVO inVO) throws SQLException;


	/**
	 * 게시글 등록
	 * @param inVO
	 * @return 1(성공) / 0(실패)
	 * @throws ClassCastException
	 * @throws SQLException
	 * @throws ClassNotFoundException 
	 */
	int doInsert(MeetingVO inVO) throws SQLException;//수정

	/**
	 * 게시글 단건 return
	 * @param inVO
	 * @return BoardVO
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	MeetingVO doSelectOne(MeetingVO inVO) throws SQLException;
}
