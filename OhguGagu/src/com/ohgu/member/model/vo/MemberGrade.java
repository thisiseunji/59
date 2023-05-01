package com.ohgu.member.model.vo;

public class MemberGrade {
	private int gradeId;
	private String gradeName;
	private int pointRate;
	private int min;
	private int max;

	public MemberGrade() {}
	
	public MemberGrade(String gradeName) {
		this.gradeName = gradeName; 
	}
	
	public MemberGrade(int gradeId, String gradeName, int pointRate, int min, int max) {
		super();
		this.gradeId = gradeId;
		this.gradeName = gradeName;
		this.pointRate = pointRate;
		this.min = min;
		this.max = max;
	}
	public int getGradeId() {
		return gradeId;
	}
	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public int getPointRate() {
		return pointRate;
	}
	public void setPointRate(int pointRate) {
		this.pointRate = pointRate;
	}
	public int getMin() {
		return min;
	}
	public void setMin(int min) {
		this.min = min;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	
	
	@Override
	public String toString() {
		return "MemberGrade [gradeId=" + gradeId + ", gradeName=" + gradeName + ", pointRate=" + pointRate + ", min="
				+ min + ", max=" + max + "]";
	}
}
