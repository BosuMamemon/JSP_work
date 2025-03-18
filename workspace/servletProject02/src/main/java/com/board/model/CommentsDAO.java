package com.board.model;

import java.util.ArrayList;

public interface CommentsDAO {
	
//	전체 보기
	public ArrayList<CommentsDTO> commentList(int bNum);
	
//	추가
	public int commentInsert(CommentsDTO comment);
	
//	개수
	public int commentCount(int bNum);
}
