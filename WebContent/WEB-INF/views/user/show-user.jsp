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
								<th><s:message code="user.username"/></th>
								<th><s:message code="user.password"/></th>
								<th><s:message code="user.fullname"/></th>
								<th colspan="2"><s:message code="global.option"/></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach begin="0" end="${listUser.size()}" varStatus="stt"
								var="user" items="${listUser}">

								<tr>
									<td>${stt.index+1}</td>
									<td>${user.username}</td>
									<td>${user.password}</td>
									<td>${user.fullName}</td>
									<td>
										<button class="btn btn-primary" onclick="window.location.href='admin/user/update-user.htm?username=${user.username}'">
											<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
											<s:message code="user.update"/>
										</button>
									</td>
									<td>
										<button class="btn btn-danger"
											onclick="deleteUser('${user.username}')">
											<i class="fa fa-trash-o" aria-hidden="true"></i> <s:message code="global.button.delete"/>
										</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="row">
				<div class="col-sm-6">
					<form class="form-inline" action="admin/user/find.htm" method="get">
						  <div class="form-group mx-sm-3 mb-2">
						    <label for="inputPassword2" class="">Tìm Kiếm: </label>
						    <input type="text" class="form-control" name="search" id="inputPassword2" placeholder="Username">
						  </div>
						  <button type="submit" class="btn btn-primary mb-2">Tìm Kiếm</button>
					</form>
				</div>
					<div class="col-sm-6">
						<button onclick="window.location.href='admin/user/add-user.htm'"
							type="button" class="btn btn-success m-3 float-right">
							<i class="fa fa-plus" aria-hidden="true"></i> <s:message code="user.insert"/>
						</button>
					</div>
				</div>
			</div>
	
<script>
function deleteUser(username) {
	Swal.fire({
		  title: 'Are you sure?',
		  text: "Are you sure to detele '"+username+"'!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Yes, delete it!'
		}).then((result) => {
        if (result.value) {
        	window.location.href = "admin/user/delete/"+username.trim()+".htm";
        } else if(result.dismiss === Swal.DismissReason.cancel){
        	Swal.fire(
        		      'Cancelled',
        		      'Your user is safe :)',
        		      'error'
        		    )
        }
    });
}
</script>
