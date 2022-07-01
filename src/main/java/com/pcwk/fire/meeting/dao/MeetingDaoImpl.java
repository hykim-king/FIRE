package com.pcwk.fire.meeting.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.fire.cmn.DTO;
import com.pcwk.fire.cmn.SearchVO;
import com.pcwk.fire.meeting.domain.MeetingVO;

@Repository("meetingDao")
public class MeetingDaoImpl implements MeetingDao {

	final Logger LOG = LogManager.getLogger(this.getClass());

	//mybatis namespace
	final String NAMESPACE ="com.pcwk.fire.meeting";
	
	//mybatis db연결객체
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public MeetingDaoImpl() {
		
	}
	
	
	@Override
	public int updateReadCnt(MeetingVO inVO) throws SQLException {
		int flag = 0;
		
		String statement = this.NAMESPACE + ".updateReadCnt";
		LOG.debug("============================");
		LOG.debug("param:" + inVO.toString());
		LOG.debug("statement:" + statement);
		LOG.debug("============================");
		
		flag = this.sqlSessionTemplate.update(statement, inVO);
		LOG.debug("flag : " + flag);
		
		return flag;	
	}

	@Override
	public List<MeetingVO> doRetrieve(DTO dto) throws SQLException {
		List<MeetingVO> list = new ArrayList<MeetingVO>();
		String statement = this.NAMESPACE + ".doRetrieve";
		SearchVO inVO = (SearchVO) dto;
		LOG.debug("============================");
		LOG.debug("param:" + inVO.toString());
		LOG.debug("statement:" + statement);
		LOG.debug("============================");
		
		list = sqlSessionTemplate.selectList(statement, inVO);
		
		for(MeetingVO vo : list) {
			LOG.debug("vo: " + vo);
		}
		
		return list;
	}

	@Override
	public int doDelete(MeetingVO inVO) throws SQLException {
		int flag = 0;
		
		String statement = this.NAMESPACE + ".doDelete";
		LOG.debug("============================");
		LOG.debug("param:" + inVO.toString());
		LOG.debug("statement:" + statement);
		LOG.debug("============================");
		
		flag = this.sqlSessionTemplate.delete(statement, inVO);
		LOG.debug("flag = " + flag);
		return flag;
	}

	@Override
	public int doUpdate(MeetingVO inVO) throws SQLException {
		int flag = 0;
		String statement = this.NAMESPACE + ".doUpdate";
		LOG.debug("============================");
		LOG.debug("param:" + inVO.toString());
		LOG.debug("statement: " + statement);
		LOG.debug("============================");
		
		flag = sqlSessionTemplate.update(statement, inVO);
		LOG.debug("flag : " + flag);
		return flag;
	}

	@Override
	public int getCount(MeetingVO inVO) throws SQLException {
		int count = 0;
		
		String statement = this.NAMESPACE + ".getCount";
		LOG.debug("============================");
		LOG.debug("param:" + inVO.toString());
		LOG.debug("statement: " + statement);
		LOG.debug("============================");
		
		count = this.sqlSessionTemplate.selectOne(statement, inVO);
		LOG.debug("============================");
		LOG.debug("count=" + count);
		LOG.debug("============================");
		return count;
	}

	@Override
	public int doInsert(MeetingVO inVO) throws SQLException {
		int flag = 0;
		
		String statement = this.NAMESPACE+".doInsert";
		
		LOG.debug("==============================");
		LOG.debug("param:" + inVO.toString());
		LOG.debug("statement:" + statement);
		LOG.debug("==============================");
		
		flag = this.sqlSessionTemplate.insert(statement, inVO);
		LOG.debug("flag:" + flag);
		
		return flag;
	}

	@Override
	public MeetingVO doSelectOne(MeetingVO inVO) throws SQLException {
		MeetingVO outVO = null;
		
		String statement = this.NAMESPACE + ".doSelectOne";
		LOG.debug("============================");
		LOG.debug("param:" + inVO.toString());
		LOG.debug("statement:" + statement);
		LOG.debug("============================");
		
		outVO = this.sqlSessionTemplate.selectOne(statement, inVO);
		LOG.debug("============================");
		LOG.debug("outVO=" + outVO);
		LOG.debug("============================");
		
		return outVO;
	}

}
