<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<fmt:setLocale value="vi-VN" scope="session" />
<div class="col-9">
	<div class="scroll-table">
		<table style="width: 1800px;" class="table text-center table-striped">
			<thead class="thead-dark">
				<tr>
					<th>#</th>
					<th><s:message code="staff.id"/></th>
					<th><s:message code="staff.name"/></th>
					<th><s:message code="staff.gender"/></th>
					<th><s:message code="staff.birthday"/></th>
					<th><s:message code="staff.email"/></th>
					<th><s:message code="staff.phone"/></th>
					<th><s:message code="staff.photo"/></th>
					<th><s:message code="staff.salary"/></th>
					<th><s:message code="staff.depart.id"/></th>
					<th colspan="2"><s:message code="global.option"/></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach begin="0" end="${listStaff.size()}" varStatus="stt"
					var="staff" items="${listStaff}">
					<tr>
						<td>${stt.index+1}</td>
						<td>${staff.id}</td>
						<td>${staff.name}</td>
						<td>${staff.gender?"Nam (Male)":"Nữ (Female)"}</td>
						<td><fmt:formatDate value="${staff.birthday}" /></td>
						<td>${staff.email}</td>
						<td>${staff.phone}</td>
						<td>${staff.photo}</td>
						<td><fmt:formatNumber value="${staff.salary}" type="currency" />
						</td>
						<td>${staff.depart.id}</td>
						<td>
							<button class="btn btn-primary"
								onclick="window.location.href='admin/staff/update.htm?id=${staff.id.trim()}'">
								<i class="fa fa-pencil-square-o" aria-hidden="true"></i> <s:message code="global.button.update"/>
							</button>
						</td>
						<td>
							<button class="btn btn-danger"
								onclick="deleteStaff('${staff.id.trim()}')">
								<i class="fa fa-trash-o" aria-hidden="true"></i> <s:message code="global.button.delete"/>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<button onclick="window.location.href='admin/staff/insert.htm'"
		type="button" class="btn btn-success m-3 float-right">
		<i class="fa fa-plus" aria-hidden="true"></i> <s:message code="staff.insert"/>
	</button>
</div>
<script>
function deleteStaff(id) {
	Swal.fire({
		  title: 'Are you sure?',
		  text: "Are you sure to detele '"+id+"'!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Yes, delete it!'
		}).then((result) => {
        if (result.value) {
        	window.location.href = "admin/staff/delete.htm?id="+id;
        } else if(result.dismiss === Swal.DismissReason.cancel){
        	Swal.fire(
        		      'Cancelled',
        		      'This staff is safe :)',
        		      'error'
        		    )
        }
    });
}
</script>