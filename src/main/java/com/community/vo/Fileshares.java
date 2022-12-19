package com.community.vo;

public class Fileshares {
	
	private int fileNo;
	private String fileName;
	private int filePostNo;
	
	public Fileshares() {}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getFilePostNo() {
		return filePostNo;
	}

	public void setFilePostNo(int filePostNo) {
		
		this.filePostNo = filePostNo;
	}

	@Override
	public String toString() {
		return "File [fileNo=" + fileNo + ", fileName=" + fileName + ", filePostNo=" + filePostNo + "]";
	}

}
