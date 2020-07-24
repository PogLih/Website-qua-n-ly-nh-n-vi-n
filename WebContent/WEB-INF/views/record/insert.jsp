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
			<form method="post" action="admin/record/insert.htm"
				name="submitForm" class="main-form needs-validation"
				style="width: 350px;" novalidate>
				<div class="form-group my-3 text-center" data-plugin="formMaterial">
					<h3>
						<c:choose>
							<c:when test="${empty message}"><s:message code="record.insert"/></c:when>
							<c:otherwise>
								${message}
								<c:remove var="message" />
							</c:otherwise>
						</c:choose>
					</h3>
				</div>

				<div class="row">
					<label class="form-control-label"><s:message code="record.staff.name"/></label> <select
						class="form-control" name="staff.id" id="inputStaff">
						<c:forEach var="staff" items="${listStaff}">
							<option value="${staff.id}">${staff.name}</option>
						</c:forEach>
					</select>
				</div>

				<div class="row my-3">
					<label class="form-control-label"><s:message code="record.type"/></label>
					<div class="form-control bg-white">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="type"
								id="inlineRadio1" value="true" checked> <label
								class="form-check-label" for="inlineRadio1"><s:message code="record.type.prise"/></label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="type"
								id="inlineRadio2" value="false"> <label
								class="form-check-label" for="inlineRadio2"><s:message code="record.type.discipline"/></label>
						</div>
					</div>
				</div>

				<div class="row form-group my-3">
					<label class="form-control-label" for="inputDepart"><s:message code="record.date"/></label> <input
						type="date" class="form-control validated" id="inputDepart"
						name="date" placeholder="Depart Name" required>
					<div class="invalid-feedback">Invalid Date</div>
				</div>

				<div class="row form-group my-3">
					<label for="inputReason"><s:message code="record.date"/></label>
					<textarea class="form-control" id="inputReason" name=reason rows="3" required></textarea>
					<div class="invalid-feedback">Invalid Reason</div>
				</div>

				<div class="form-control-plaintext my-3">
					<button class="btn btn-primary mb-3 px-3 mx-2" type="submit">
						<i class="fas fa-plus"></i> <s:message code="global.button.insert"/>
					</button>
					<button class="btn btn-danger mb-3 px-3 mx-2"
						onclick="window.location.href='admin/record/show-record.htm'"
						type="button">
						<i class="fas fa-sign-out-alt"></i> <s:message code="global.button.cancel"/>
					</button>
				</div>
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
                text: "You want to create User?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Yes, Create it!",
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