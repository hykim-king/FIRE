/** 
 * 게시 컨트롤러
 */
package com.pcwk.fire.meeting.controller;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pcwk.fire.cmn.MessageVO;
import com.pcwk.fire.cmn.SearchVO;
import com.pcwk.fire.cmn.StringUtil;
import com.pcwk.fire.meeting.domain.MeetingVO;
import com.pcwk.fire.meeting.service.MeetingService;

@Controller("meetingController")
@RequestMapping("meeting")
public class MeetingController {
	
	final Logger LOG = LogManager.getLogger(this.getClass());
	
	@Autowired
	MeetingService meetingService;
	
	public MeetingController() {
		
	}
	
	@RequestMapping(value = "/doUpdate.do", method = RequestMethod.POST,
			produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doUpdate(MeetingVO inVO) throws SQLException{
		LOG.debug("====================");
		LOG.debug("=doUpdate=");
		LOG.debug("=inVO= " + inVO);
		LOG.debug("====================");
		
		int flag = meetingService.doUpdate(inVO);
		String resultMsg = "";
		if(1 == flag) {
			resultMsg = "수정 되었습니다.";
		}
		else {
			resultMsg = "수정 실패.";
		}
		
		MessageVO message = new MessageVO(String.valueOf(flag), resultMsg);
		
		String jsonString = new Gson().toJson(message);
		LOG.debug("====================");
		LOG.debug("=jsonString= " + jsonString);
		LOG.debug("====================");
		
		return jsonString;
	}
	
	
	@RequestMapping(value = "/doDelete.do", method = RequestMethod.POST,
			produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doDelete(MeetingVO inVO) throws SQLException{
		LOG.debug("====================");
		LOG.debug("=doDelete=");
		LOG.debug("=inVO= " + inVO);
		LOG.debug("====================");
		
		int flag = meetingService.doDelete(inVO);
		String resultMsg = "";
		if(1 == flag) {
			resultMsg = "삭제 되었습니다.";
		}
		else {
			resultMsg = "삭제 실패.";
		}
		
		MessageVO message = new MessageVO(String.valueOf(flag), resultMsg);
		String jsonString = new Gson().toJson(message);
		LOG.debug("====================");
		LOG.debug("=jsonString= " + jsonString);
		LOG.debug("====================");
		
		return jsonString;
	}
	
	@RequestMapping(value = "/doSelectOne.do")
	public String doSelectOne(Model model, MeetingVO inVO) throws SQLException{
		LOG.debug("====================");
		LOG.debug("=doSelectOne=");
		LOG.debug("=inVO= " + inVO);
		LOG.debug("====================");
		
		MeetingVO outVO = meetingService.doSelectOne(inVO);
		LOG.debug("====================");
		LOG.debug("=outVO= " + outVO);
		LOG.debug("====================");
		model.addAttribute("vo", outVO);
		
		return "meeting/meeting_mod";
	}
	
	@RequestMapping(value = "/doInsert.do", method = RequestMethod.POST,
			produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doInsert(MeetingVO inVO) throws SQLException{
		LOG.debug("====================");
		LOG.debug("=doInsert=");
		LOG.debug("=inVO= " + inVO);
		LOG.debug("====================");
		
		// 최초 등록시 등록자 아이디 = 수정자 아이디
		inVO.setModId(inVO.getRegId());
		
		int flag = meetingService.doInsert(inVO);
		String resultMsg = "";
		if(1 == flag) {
			resultMsg = inVO.getmTitle() + "가 등록 되었습니다.";
		}
		else {
			resultMsg = " 등록 실패.";
		}
		
		MessageVO message = new MessageVO(String.valueOf(flag), resultMsg);
		String jsonString = new Gson().toJson(message);
		LOG.debug("====================");
		LOG.debug("=jsonString= " + jsonString);
		LOG.debug("====================");
		
		return jsonString;
	}
	
	@RequestMapping(value = "/moveToReg.do", method = RequestMethod.GET,
			produces = "application/json;charset=UTF-8")
	public String moveToReg(Model model, SearchVO inVO) throws SQLException {
		String viewName = "meeting/meeting_reg";
		LOG.debug("====================");
		LOG.debug("=moveToReg=");
		LOG.debug("=inVO= " + inVO);
		LOG.debug("====================");
		model.addAttribute("vo", inVO);
		return viewName;
	}
	
	@RequestMapping(value = "/doRetrieve.do", method = RequestMethod.GET,
					produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doRetrieve(SearchVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("====================");
		LOG.debug("=doRetrieve=");
		LOG.debug("=inVO= " + inVO);
		LOG.debug("====================");
		
		//페이지 사이즈
		if(inVO.getPageSize() == 0) {
			inVO.setPageSize(10);
		}
		//페이지 번호
		if(inVO.getPageNum() == 0) {
			inVO.setPageNum(1);
		}
		//검색구분
		if(inVO.getSearchDiv() == null) {
			inVO.setSearchDiv(StringUtil.nvl(inVO.getSearchDiv(), ""));
		}
		//검색어
		if(inVO.getSearchWord() == null) {
			inVO.setSearchWord(StringUtil.nvl(inVO.getSearchWord(), ""));
		}
		
		// 게시 구분
		if(null == inVO.getDiv()) {
			inVO.setDiv(StringUtil.nvl(inVO.getDiv(), "10"));
		}
		
		LOG.debug("====================");
		LOG.debug("=inVO= " + inVO);
		LOG.debug("====================");
		
		List<MeetingVO> list = meetingService.doRetrieve(inVO);
		Gson gson = new Gson();
		
		jsonString = gson.toJson(list);
		
		LOG.debug("====================");
		LOG.debug("=jsonString=" + jsonString);
		LOG.debug("====================");
		
		return jsonString;
	}
	
	// meeting/meeting_list
	// meeting/meeting_reg
	// meeting/meeting_mod
	
	//http://localhost:8081/fire/meeting/meetingView.do
	@RequestMapping(value = "/meetingView.do", method = RequestMethod.GET)
	public String meetingView(Model model, SearchVO inVO) throws SQLException{
		LOG.debug("===================");
		LOG.debug("=meetingView()=");
		LOG.debug("===================");
		
		//페이지 사이즈
		if(inVO.getPageSize() == 0) {
			inVO.setPageSize(10);
		}
		//페이지 번호
		if(inVO.getPageNum() == 0) {
			inVO.setPageNum(1);
		}
		//검색구분
		if(inVO.getSearchDiv() == null) {
			inVO.setSearchDiv(StringUtil.nvl(inVO.getSearchDiv(), ""));
		}
		//검색어
		if(inVO.getSearchWord() == null) {
			inVO.setSearchWord(StringUtil.nvl(inVO.getSearchWord(), ""));
		}
		
		// 게시 구분
		if(null == inVO.getDiv()) {
			inVO.setDiv(StringUtil.nvl(inVO.getDiv(), "10"));
		}
		
		LOG.debug("===================");
		LOG.debug("=inVO=" + inVO);
		LOG.debug("===================");
		
		List<MeetingVO> list = meetingService.doRetrieve(inVO);
		
		int totalCnt = 0;
		//총 글수: paging사용
		//pageTotal : 총 페이지 수
		double pageTotal = 0;
		
		if(list.size() > 0 && list != null) {
			totalCnt = list.get(0).getTotalCnt(); // 총글수
			
			pageTotal = Math.ceil(totalCnt/(inVO.getPageSize()*1.0));
			
			LOG.debug("====================");
			LOG.debug("=totalCnt/(inVO.getPageSize()*1.0)=" + totalCnt/(inVO.getPageSize()*1.0)); // 1.5
			LOG.debug("=pageTotal=" + pageTotal); // 2.0
			LOG.debug("====================");
		}
		
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageTotal", pageTotal);
		model.addAttribute("list", list);
		model.addAttribute("vo", inVO);
			
		
		
		return "meeting/meeting";
		}
}
