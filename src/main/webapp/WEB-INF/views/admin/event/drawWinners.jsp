<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/utility.jsp" />
<div class="modal fade" id="drawWinners">
	<div class="modal-dialog modal-dialog-centered modal-sm">
		<div class="modal-content">
			<div class="modal-body">
				<form class="forms-sample" id="drawForm">
				<input type="hidden" value="${event.id}" name="eventId" id="eventId">
					<div class="form-group">
						<div class="row">
							<div class="input-group">
								<label for="numOfWinners" style="font-family: 'Pretendard-Regular'; font-size: 17px;">추첨할 인원을 선택해주세요.</label>
								<span class="input-group-btn data-dwn">
									<button class="btn btn-inverse-dark btn-fw py-2" id="down" type="button">
										<span class="ph ph-minus"></span>
									</button>
								</span>
								<input type="text" class="form-control text-center" id="numOfWinners" name="numOfWinners" value="1" min="1" max="10">
								<span class="input-group-btn data-up">
									<button class="btn btn-inverse-dark btn-fw py-2" id="up" type="button">
										<span class="ph ph-plus"></span>
									</button>
								</span>
							</div>
						</div>
					</div>
					<div class="d-flex justify-content-center">
						<button type="submit" class="btn btn-primary me-2" id="drawBtn">추첨</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script src="${ctp}/js/admin/event/drawWinners.js"></script>