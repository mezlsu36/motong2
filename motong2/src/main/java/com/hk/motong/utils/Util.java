package com.hk.motong.utils;

public class Util {

	private String arrowNbsp;


	public void setArrowNbsp(String depth) {
		String nbsp="";
		int depthInt=Integer.parseInt(depth);
		for (int i = 0; i < depthInt; i++) {
			nbsp+="&nbsp;&nbsp;&nbsp;&nbsp;";
		}

		this.arrowNbsp=nbsp+(depthInt>0?"<img src='img/arrow_icon.png'/>":"");
	}
	
	public String getArrowNbsp() {
		return arrowNbsp;
	}

}