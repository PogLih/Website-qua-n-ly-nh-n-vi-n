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
<script src="https://kit.fontawesome.com/2705abeb1d.js"
	crossorigin="anonymous"></script>
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
			<form method="post" action="admin/depart/update.htm"
				name="submitForm" class="main-form needs-validation"
				style="width: 350px;" novalidate>
				<div class="form-group my-3 text-center" data-plugin="formMaterial">
					<h3>
						<c:choose>
							<c:when test="${empty message}"><s:message code="depart.update"/></c:when>
							<c:otherwise>
								${message}
								<c:remove var="message"/>
							</c:otherwise>
						</c:choose>
					</h3>
				</div>
				<div class="form-group my-3" data-plugin="formMaterial">
					<label class="form-control-label" for="inputText"><s:message code="depart.id"/></label>
					<input type="text" class="form-control-plaintext validated bg-white" id="inputText"
						name="id" placeholder="Depart ID" value="${depart.id}" readonly required>
					<div class="invalid-feedback">Invalid Depart ID</div>
				</div>

				<div class="form-group my-3" data-plugin="formMaterial">
					<label class="form-control-label" for="inputDepart"><s:message code="depart.name"/></label>
					<input type="text" class="form-control validated"
						id="inputDepart" name="name" placeholder="Depart Name" value="${depart.name}" required>
					<div class="invalid-feedback">Invalid Password</div>
				</div>

				<button class="btn btn-primary mb-3" type="submit">
					<i class="fas fa-plus"></i> <s:message code="depart.update"/>
				</button>
				<button class="btn btn-danger mb-3"
					onclick="window.location.href='admin/depart/show-depart.htm'"
					type="button">
					<i class="fas fa-sign-out-alt"></i> <s:message code="global.button.cancel"/>
				</button>
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
                text: "You want to update depart?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes, Create it!",
                cancelButtonText: "No, cancel plx!"
            }).then((result) => {
                if (result.value) {
                	document.submitForm.submit();
                } else {
                    swal("Cancelled", "This depart is safe :)", "error");
                }
            });
        }

    </script>
</body>

</html>