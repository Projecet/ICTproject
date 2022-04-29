package com.project.foodbalance.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.foodbalance.common.Paging;
import com.project.foodbalance.common.SearchDate;
import com.project.foodbalance.notice.model.vo.Notice;

@Repository("noticeDao")
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<Notice> selectAll() {
		List<Notice> list = session.selectList("noticeMapper.selectAll");
		return (ArrayList<Notice>)list;
	}
	
	//총 게시글 갯수 조회용 (페이지 수 계산용)
	public int selectListCount() {
		return session.selectOne("noticeMapper.getListCount");
	}
	
	//한 페이지에 출력할 게시글 조회용
	public ArrayList<Notice> selectList(Paging page) {
		List<Notice> list = session.selectList("noticeMapper.selectList", page);
		return (ArrayList<Notice>)list;
	}
	
	//해당 번호에 대한 게시글 상세 조회용
	public Notice selectNotice(int notice_no) {
		return session.selectOne("noticeMapper.selectNotice", notice_no);
	}
	
	//원글 등록용
	public int insertNotice(Notice notice) {
		return session.insert("noticeMapper.insertNotice", notice);
	}
	
	//원글 수정용
	public int updateNotice(Notice notice) {
		return session.update("noticeMapper.updateNotice", notice);
	}
	
	//게시글 삭제용
	public int deleteNotice(int notice_no) {
		return session.delete("noticeMapper.deleteNotice", notice_no);
	}
	
	//제목으로 검색 갯수 카운트
	public int selectWriterCount() {
		return session.selectOne("noticeMapper.getTitleCount");
	}

	public ArrayList<Notice> selectNewTop3() {
		List<Notice> list = session.selectList("noticeMapper.selectTop3");
		return (ArrayList<Notice>)list;
	}
	
	//제목으로 검색
	public ArrayList<Notice> selectSearchTitle(String keyword) {
		List<Notice> list = session.selectList("noticeMapper.selectSearchTitle", keyword);
		return (ArrayList<Notice>)list;
	}
	
	//작성자로 검색
	public ArrayList<Notice> selectSearchWriter(String keyword) {
		List<Notice> list = session.selectList("noticeMapper.selectSearchWriter", keyword);
		return (ArrayList<Notice>)list;
	}
	
	//날짜로 검색
	public ArrayList<Notice> selectSearchDate(SearchDate date) {
		List<Notice> list = session.selectList("noticeMapper.selectSearchDate", date);
		return (ArrayList<Notice>)list;
	}
}
