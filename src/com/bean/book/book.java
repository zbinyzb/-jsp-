package com.bean.book;

public class book {
	private String tno;
	private String bname;
	private String  writer;
	private String  pubdept;
	private float  price;
	private String typnum;
	private String remark;
	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPubdept() {
		return pubdept;
	}
	public void setPubdept(String pubdept) {
		this.pubdept = pubdept;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getTypnum() {
		return typnum;
	}
	public void setTypnum(String typnum) {
		this.typnum = typnum;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public boolean validate(){
		
		boolean ok=true;
		if(tno==null || tno.length()==0){
			ok=false;
		}
		if(bname==null || bname.length()==0) {
			ok=false;
		}
		if(writer==null || writer.length()==0) {
			ok=false;
		}
		if(pubdept==null || pubdept.length()==0) {
			ok=false;
		}
		
		if(typnum==null || typnum.length()==0) {
			ok=false;
		}
		if(remark==null || remark.length()==0) {
			ok=false;
		}

			
		return ok;
	}

}
