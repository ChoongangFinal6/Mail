<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../reference.jsp" %>

<c:if test="${SelectList != 'sendView' }">
	<input id="emMailGetDel" type="submit" value="삭제" class="button-style mailDel hover">
	<div id="waitDel"></div>
</c:if>

<c:if test="${SelectList == 'sendView' }">
	<input id="emMailSendDel" type="submit" value="삭제" class="button-style mailDel hover">
	<div id="waitDel"></div>
</c:if>

<div style="border: 1px solid black; margin: 10px;"></div>

	<c:if test="${mailList.size() < 1}">
		<div style="width: 100%" align="center"><h3>메일함이 비어있습니다.</h3></div>
	</c:if>
	
	<c:if test="${mailList.size() > 0}">
		<c:set var="Cnt" value="0" />
		<c:forEach var="list" items="${mailList }">
		<table style="font-size: 20px;">	
				<tr>			
					<td style="padding-left: 13px;">
						<div class="maillist hover">
							<table>
								<tr height="35px;">
										<td width="50px;"><input class="emNoChk" id="emNoChk${Cnt }" type="checkbox" value="${list.emNo }"></td>
										<c:if test="${SelectList != 'sendView' }">
											<td width="300px;">${list.emSendAddr }</td>
										</c:if>
										<c:if test="${SelectList == 'sendView' }">
											<td width="300px;">${list.emGetAddr }</td>
										</c:if>
										<td width="450px;"><a href="emMailContent.do?emNo=${list.emNo }" class="aClass">${list.emTitle }</a></td>
										<td>${list.emSendDate }</td>
								</tr>							
							</table>							
						</div>
					</td>			
				</tr>		
		</table>	
		<c:set var="Cnt" value="${Cnt+1 }"></c:set>
		</c:forEach>
	</c:if>
	
	
	<div style="border: 1px solid black; margin: 10px;"></div>
	
	<div style="text-align: center; font-size: 20px;">

		<c:if test="${SelectList == 'all' }">
			<form>
				<c:if test="${startPage > pageBlock }">
					<a href="emMailMain.do?currentPage=${startPage-pageBlock }">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<a href="emMailMain.do?currentPage=${i }">[${i }]</a>
				</c:forEach>
				<c:if test="${endPage < totalPage }">
					<a href="emMailMain.do?currentPage=${startPage+pageBlock }">[다음]</a>
				</c:if>
			</form>
		</c:if>


		<c:if test="${SelectList == 'sendView' }">
			<form>
				<c:if test="${startPage > pageBlock }">
					<a href="emMailSendView.do?currentPage=${startPage-pageBlock }">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<a href="emMailSendView.do?currentPage=${i }">[${i }]</a>
				</c:forEach>
				<c:if test="${endPage < totalPage }">
					<a href="emMailSendView.do?currentPage=${startPage+pageBlock }">[다음]</a>
				</c:if>
			</form>
		</c:if>

		<c:if test="${SelectList == 'notRead' }">
			<form>
				<c:if test="${startPage > pageBlock }">
					<a href="emMailNotRead.do?currentPage=${startPage-pageBlock }">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<a href="emMailNotRead.do?currentPage=${i }">[${i }]</a>
				</c:forEach>
				<c:if test="${endPage < totalPage }">
					<a href="emMailNotRead.do?currentPage=${startPage+pageBlock }">[다음]</a>
				</c:if>
			</form>
		</c:if>
	</div>