package com.comm;

public class PageUtil {
	
	private int totalPage;
	private int blockPage;
	private int startPage;
	private int endPage;
	private int currentPage;
	
	public PageUtil(int totalPage, int blockPage, int startPage, int endPage, int currentPage) {
		super();
		this.totalPage = totalPage;
		this.blockPage = blockPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.currentPage = currentPage;
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
	
}
