package com.jsp.test;

// 멤버변수(필드)를 private 로 하고 getter, setter 메서드르르 만든 클래스 -> 자바빈
// 자바빈에는 규칙이 있다
// 1. 변수는 private, 이름은 소문자
// 2. 생성자는 default 생성자가 있어야한다
// getter setter 는 getValue, setValue 규칙준수 camel-case, capitalize


public class bean {
	private int x;
	private int y;
	public bean() {
		x=0;
		y=0;
	}
	public int getX() {
		return x;
	}
	public int getY() {
		return y;
	}
	public void setX(int x) {
		this.x =x;
	}
	public void setY(int y) {
		this.y =y;
	}
}
