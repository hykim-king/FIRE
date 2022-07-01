package com.pcwk.fire.meeting;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.pcwk.fire.cmn.SearchVO;
import com.pcwk.fire.meeting.dao.MeetingDao;
import com.pcwk.fire.meeting.domain.MeetingVO;

@RunWith(SpringJUnit4ClassRunner.class) //JUnit기능을 스프링 프레임으로 확장!
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		                           "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"		
}) //applicationContext.xml loading
public class JUnitMeetingDaoTest {

	final Logger LOG = LogManager.getLogger(this.getClass());
	  
	@Autowired  //컨텍스트 프레임워크는 변수 타입과 일치하는 컨텍스트 내의 빈을 찾고, 변수에 주입
	ApplicationContext context;
	
	@Autowired
	MeetingDao dao;
	
	MeetingVO meeting01;
	MeetingVO meeting02;
	MeetingVO meeting03;
	
	SearchVO search;
	
	@Before
	public void setUp() throws Exception{
		LOG.debug("====================");
		LOG.debug("=0.setUp()=");
		LOG.debug("====================");
		
		search = new SearchVO(10,1,"","", "10");
		
		meeting01 = new MeetingVO(10, 10, "서울", 1, "1박2일", "Y", "2022-09-09", "혼자여행", 1, "날짜 사용 안함", "admin1", "날짜 사용 안함", "admin1");
		meeting02 = new MeetingVO(100, 10, "강원도", 2, "2박3일", "Y", "2022-09-09", "먹방여행", 1, "날짜 사용 안함", "admin1", "날짜 사용 안함", "admin1");
		meeting03 = new MeetingVO(1000, 10, "강원도", 3, "당일치기", "Y", "2022-09-09", "먹방여행", 1, "날짜 사용 안함", "admin1", "날짜 사용 안함", "admin1");
		
		
		
		LOG.debug("context:"+context);
		LOG.debug("dao:"+dao);
		  
		assertNotNull(context);
		assertNotNull(dao);
	}
	
	@Test
	@Ignore
	public void doRetrieve() throws SQLException{
		// 1.
		dao.doDelete(meeting01);
		
		// 2.
		dao.doInsert(meeting01);
		
		LOG.debug("====================");
		LOG.debug("=1.doRetrieve()=");
		LOG.debug("====================");
		List<MeetingVO> list = dao.doRetrieve(search);
		assertEquals(8, list.size());
	}
	
	@Test
//	@Ignore
	public void update() throws SQLException{
		//1. 삭제
		//2. 1건등록
		//3. 1건등록 데이터조회
		//4. 1건조회 데이터수정
		//5. 수정
		//6. 비교
		LOG.debug("====================");
		LOG.debug("=1.update()=");
		LOG.debug("====================");
		
		// 1.
		dao.doDelete(meeting01);
		
		// 2.
		dao.doInsert(meeting01);
//		assertEquals(1, dao.getCount(meeting01));
		
		// 3.
		MeetingVO vsVO = dao.doSelectOne(meeting01);
		
		// 4.
		String upStr = "_U";
		vsVO.setmTitle(vsVO.getmTitle() + upStr);
		vsVO.setmContents(vsVO.getmContents() + upStr);
		vsVO.setmLoc(20);
		vsVO.setModId(vsVO.getModId() + upStr);
		
		//5.
		dao.doUpdate(vsVO);
		
//		6.
		MeetingVO resultVO = dao.doSelectOne(vsVO);
		isSameData(vsVO, resultVO);
	}
	
	
	@Test
	@Ignore
	public void addAndGet() throws SQLException {
		LOG.debug("====================");
		LOG.debug("=1.addAndGet()=");
		LOG.debug("====================");
		
		dao.doDelete(meeting01);
//		dao.doDelete(meeting02);
//		dao.doDelete(meeting03);
		//2. 등록
		dao.doInsert(meeting01);
//		dao.doInsert(meeting02);
		
//		// 3. 단건조회
		MeetingVO outVO = dao.doSelectOne(meeting01);
		
		//4. 비교
//		isSameData(outVO, meeting01);
		
//		MeetingVO outVO2 = dao.doSelectOne(meeting02);
//		isSameData(outVO2, meeting02);
		
//		assertEquals(2, dao.getCount(meeting01));
	}
	
	private void isSameData(MeetingVO vsVO, MeetingVO orgVO) {
		assertEquals(vsVO.getmSeq(), orgVO.getmSeq());
		assertEquals(vsVO.getmLoc(), orgVO.getmLoc());
		assertEquals(vsVO.getmTitle(), orgVO.getmTitle());
		assertEquals(vsVO.getmNum(), orgVO.getmNum());
		assertEquals(vsVO.getmKind(), orgVO.getmKind());
		assertEquals(vsVO.getmStatus(), orgVO.getmStatus());
		assertEquals(vsVO.getmDate(), orgVO.getmDate());
		assertEquals(vsVO.getmContents(), orgVO.getmContents());
		assertEquals(vsVO.getmReadcnt(), orgVO.getmReadcnt());
		assertEquals(vsVO.getRegId(), orgVO.getRegId());
		assertEquals(vsVO.getModId(), orgVO.getModId());
	}

}
