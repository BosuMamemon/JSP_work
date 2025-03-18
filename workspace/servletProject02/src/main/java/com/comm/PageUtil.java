package com.comm;

public class PageUtil {
	
	private int totalPage;
	private int blockPage;
	private int startPage;
	private int endPage;
	private int currentPage;
	private String searchField;
	private String searchWord;
	
	public PageUtil(int totalPage, int blockPage, int startPage, int endPage, int currentPage, String searchField, String searchWord) {
		super();
		this.totalPage = totalPage;
		this.blockPage = blockPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.currentPage = currentPage;
		this.searchField = searchField;
		this.searchWord = searchWord;
	}
	
	public int getTotalPage() {
		return totalPage;
	}
	public int getBlockPage() {
		return blockPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public String getSearchField() {
		return searchField;
	}
	
	public String getSearchWord() {
		return searchWord;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}
	
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
}
