<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script
	src="https://reactiveraven.github.io/jqBootstrapValidation/js/jqBootstrapValidation.js"></script>
<script
	src="https://unpkg.com/sweetalert2@7.1.3/dist/sweetalert2.all.js"></script>
<style>
body {
	background: rgb(238, 174, 202);
	background: radial-gradient(circle, rgba(238, 174, 202, 1) 0%,
		rgba(148, 187, 233, 1) 100%);
}

.main-div {
	background-color: pink;
	width: 550px;
}
</style>
</head>
<body>
	<div class="container-fluid d-flex justify-content-center">
		<div
			class="row mt-5 d-flex justify-content-center main-div rounded-lg">
			<form method="post" action="admin/user/update-user.htm" name="submitForm"
				class="main-form needs-validation" style="width: 350px;" novalidate>
				<div class="form-group my-3 text-center" data-plugin="formMaterial">
					<h3>
						<c:choose>
							<c:when test="${empty message}"><s:message code="staff.update"/></c:when>
							<c:otherwise>${message}</c:otherwise>
						</c:choose>
						<c:remove var="message"/>
					</h3>
				</div>
				<div class="form-group my-3" data-plugin="formMaterial">
					<label class="form-control-label" for="inputText"><s:message code="user.username"/></label>
					<input type="text" class="form-control validated" id="inputText"
						name="username" placeholder="Username" value="${user.username}"
						required readonly>
					<div class="invalid-feedback">Invalid Username</div>
				</div>

				<div class="form-group my-3" data-plugin="formMaterial">
					<label class="form-control-label" for="inputPassword"><s:message code="user.password"/></label>
					<input type="password" class="form-control validated"
						id="inputPassword" name="password" placeholder="Password"
						value="${user.password}" required>
					<div class="invalid-feedback">Invalid Password</div>
				</div>

				<div class="form-group my-3" data-plugin="formMaterial">
					<label class="form-control-label" for="inputFullname"><s:message code="user.fullname"/></label>
					<input type="text" class="form-control validated"
						id="inputFullname" name="fullName" placeholder="Text"
						value="${user.fullName}" required>
					<div class="invalid-feedback">Invalid Fullname</div>
				</div>
				<button class="btn btn-primary mb-3" type="submit"><s:message code="user.update"/></button>
				<button class="btn btn-danger mb-3"
					onclick="window.location.href='admin/user/show-user.htm'" type="button"><s:message code="global.button.cancel"/></button>
			</form>
		</div>
	</div>
	<script>
        var form = document.querySelector('.needs-validation');

        form.addEventListener('submit', function (event) {
            event.preventDefault();
            event.stopPropagation();
            if (form.checkValidity() === true) {
                alert()
            }
            form.classList.add('was-validated');
        })

        function alert(aaaa) {
            swal({
                title: "Are you sure?",
                text: "You want to update User?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes, update it!",
                cancelButtonText: "No, cancel plx!"
            }).then((result) => {
                if (result.value) {
                	document.submitForm.submit();
                } else {
                    swal("Cancelled", "Your User is safe :)", "error");
                }
            });
        }

    </script>
</body>

</html>