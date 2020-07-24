<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

			<div class="col-9">
				<div class="scroll-table">
					<table class="table text-center table-striped">
						<thead class="thead-dark">
							<tr>
								<th>#</th>
								<th><s:message code="depart.id"/></th>
								<th><s:message code="depart.name"/></th>
								<th colspan="2"><s:message code="global.option"/></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach begin="0" end="${listDepart.size()}" varStatus="stt"
								var="depart" items="${listDepart}">

								<tr>
									<td>${stt.index+1}</td>
									<td>${depart.id}</td>
									<td>${depart.name}</td>
									<td>
										<button class="btn btn-primary" onclick="window.location.href='admin/depart/update.htm?id=${depart.id.trim()}'">
											<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
											<s:message code="global.button.update"/>
										</button>
									</td>
									<td>
										<button class="btn btn-danger"
											onclick="deleteDepart('${depart.id.trim()}')">
											<i class="fa fa-trash-o" aria-hidden="true"></i> <s:message code="global.button.delete"/>
										</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<button onclick="window.location.href='admin/depart/insert.htm'"
					type="button" class="btn btn-success m-3 float-right">
					<i class="fa fa-plus" aria-hidden="true"></i> <s:message code="depart.insert"/>
				</button>
			</div>
	
<script>
function deleteDepart(id) {
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
        	window.location.href = "admin/depart/delete/"+id.trim()+".htm";
        } else if(result.dismiss === Swal.DismissReason.cancel){
        	Swal.fire(
        		      'Cancelled',
        		      'This depart is safe :)',
        		      'error'
        		    )
        }
    });
}
</script>
