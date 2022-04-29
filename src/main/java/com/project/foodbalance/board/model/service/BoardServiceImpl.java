package com.project.foodbalance.board.model.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.foodbalance.board.model.dao.BoardDao;
import com.project.foodbalance.board.model.vo.Board;
import com.project.foodbalance.common.Paging;
import com.project.foodbalance.common.SearchDate;


@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public ArrayList<Board> selectTop5() {
		return boardDao.selectTop5();
	}

	@Override
	public int selectListCount() {
		return boardDao.selectListCount();
	}

	@Override
	public ArrayList<Board> selectList(Paging page) {
		return boardDao.selectList(page);
	}

	@Override
	public Board selectBoard(int board_no) {
		return boardDao.selectBoard(board_no);
	}

	@Override
	public int updateAddReadcount(int board_no) {
		return boardDao.updateAddReadcount(board_no);
	}

	@Override
	public int insertOriginBoard(Board board) {
		return boardDao.insertOriginBoard(board);
	}

	@Override
	public int updateOrigin(Board board) {
		return boardDao.updateOrigin(board);
	}

	@Override
	public int deleteBoard(Board board) {
		return boardDao.deleteBoard(board);
	}

	
//	//제목 검색 페이징
//	@Override
//	public ArrayList<Board> selectSearchTitle(Paging page) {
//		return boardDao.selectSearchTitle(page);
//	}
//	
//	//작성자 검색 페이징
//	@Override
//	public ArrayList<Board> selectSearchWriter(Paging page) {
//		return boardDao.selectSearchWriter(page);
//	}
//	
//	//날짜 검색 페이징
////	@Override
////	public ArrayList<Board> selectSearchDate(Paging page) {
////		return boardDao.selectSearchDate(page);
////	}	
//	
	
//	//제목 검색 카운트
//	@Override
//	public int searchTitleCount(String keyword) {
//		return boardDao.searchTitleCount(keyword);
//	}
//	
//	//작성자 검색 카운트
//	@Override
//	public int searchWriterCount(String keyword) {
//		return boardDao.searchWriterCount(keyword);
//	}

	@Override
	public ArrayList<Board> selectSearchTitle(String keyword) {
		return boardDao.selectSearchTitle(keyword);
	}

	@Override
	public ArrayList<Board> selectSearchWriter(String keyword) {
		return boardDao.selectSearchWriter(keyword);
	}

	@Override
	public ArrayList<Board> selectSearchDate(SearchDate date) {
		return boardDao.selectSearchDate(date);
	}
	
	//날짜 검색 카운트
//	@Override
//	public int searchDateCount(SearchDate date) {
//		return boardDao.searchDateCount(date);
//	}
//	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
