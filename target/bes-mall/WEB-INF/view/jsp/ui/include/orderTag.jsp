<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<div class="right-title clearfix">
	<a>我的订单</a>
	<ul class="order-nav fr clearfix">
		<li ${tag==1?"class=\"on\"":"" }><a href="/u/order/list.html">全部订单</a></li>
		<li ${tag==10?"class=\"on\"":"" }><a href="/u/order/list/obligation.html">未付款</a></li>
		<li	${tag==20?"class=\"on\"":"" }><a href="/u/order/list/receiving.html">交易中</a></li>
		<li ${tag==50?"class=\"on\"":"" }><a href="/u/order/list/completed.html">交易完成</a></li>
		<li ${tag==60?"class=\"on\"":"" }><a href="/u/order/list/closed.html">已关闭</a></li>
	</ul>
</div>