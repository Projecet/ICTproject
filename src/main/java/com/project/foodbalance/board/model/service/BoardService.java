package com.project.foodbalance.board.model.service;



import java.util.ArrayList;

import com.project.foodbalance.board.model.vo.Board;
import com.project.foodbalance.common.Paging;
import com.project.foodbalance.common.SearchDate;


public interface BoardService {
	ArrayList<Board> selectTop5();
	int selectListCount();  //총 게시글 갯수 조회용 (페이지 수 계산용)
	ArrayList<Board> selectList(Paging page); //한 페이지에 출력할 게시글 조회용
	Board selectBoard(int board_no); //해당 번호에 대한 게시글 상세 조회용
	int updateAddReadcount(int board_no);  //상세보기시에 조회수 1증가 처리용
	int insertOriginBoard(Board board); //원글 등록용
	int updateOrigin(Board board);  //원글 수정용
	int deleteBoard(Board board);  //게시글 삭제용
	
////	ArrayList<Board> selectSearchTitle(String keyword);
//	ArrayList<Board> selectSearchWriter(Paging page);//작성자 검색
////	ArrayList<Board> selectSearchDate(Paging page);
//	
//	
//	ArrayList<Board> selectSearchTitle(Paging page); //제목 검색 페이징
//	int searchTitleCount(String keyword);
//	int searchWriterCount(String keyword);
////	int searchDateCount(SearchDate date);
	
	ArrayList<Board> selectSearchTitle(String keyword);
	ArrayList<Board> selectSearchWriter(String keyword);
	ArrayList<Board> selectSearchDate(SearchDate date);
}
