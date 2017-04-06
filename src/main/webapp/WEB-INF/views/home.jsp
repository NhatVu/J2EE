<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Admicro | Dashboard</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="<spring:url value="/resources/bootstrap/css/bootstrap.min.css" />">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<spring:url value="/resources/dist/css/AdminLTE.min.css"/>">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="<spring:url value="/resources/dist/css/skins/_all-skins.min.css"/>">
<!-- iCheck -->
<link rel="stylesheet" href="<spring:url value="/resources/plugins/iCheck/flat/blue.css"/>">
<!-- Morris chart -->
<link rel="stylesheet" href="<spring:url value="/resources/plugins/morris/morris.css"/>">
<!-- jvectormap -->
<link rel="stylesheet"
	href="<spring:url value="/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.css"/>">
<!-- Date Picker -->
<link rel="stylesheet" href="<spring:url value="/resources/plugins/datepicker/datepicker3.css"/>">

<link rel="stylesheet" href="<spring:url value="/resources/css/style.css"/>">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>

<body class="hold-transition sidebar-mini skin-blue">
	<div class="wrapper">
		<jsp:include page="layout/Header.jsp" flush="true"></jsp:include>
		<!-- Left side column. contains the logo and sidebar -->
		<jsp:include page="layout/LeftSideBar.jsp" flush="true"></jsp:include>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1 class="text-center">Home</h1>
				<hr />
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-sm-3 pull-right">

			
					</div>
				</div>

				<!-- filter -->
				<div class="form-inline show-news-filter">
					<div class="form-group">
						<label for="focusedInput">Source</label> <select
							class="form-control" name="source" onchange="handleSelectChange(config)">
							<option value="all">All</option>
							<option value="twitter">Twitter</option>
							<option value="facebook">Facebook</option>
							<option value="news">News</option>
						</select>
					</div>
					<div class="form-group">
						<label for="inputPassword">Category</label> <select
							class="form-control" name="category" onchange="handleSelectChange(config)">
							<option value="all">Any</option>
							<option value="Accident">Accident</option>
							<option value="Acts of Violence or War">Acts of Violence or War</option>
							<option value="Bizarre News and World Records">Bizarre News and World Records</option>
							<option value="Celebrity and Human Interest News">Celebrity and Human Interest News</option>
							<option value="Election">Election</option>
							<option value="Financial">Financial</option>
							<option value="Legal and Criminal Case">Legal and Criminal Cases</option>
							<option value="Natural Disaster">Natural Disaster</option>
							<option value="New Law">New Law</option>
							<option value="Political Meeting">Political Meeting</option>
							<option value="Scandal and Hearing">Scandals/Hearings</option>
							<option value="Science and Discovery">Science and Discovery</option>
							<option value="Sport">Sport</option>
							<option value="General">General</option>
						</select>
					</div>
					<div class="form-group">
						<label for="inputSuccess2">Date</label>
						<div class='input-group date' id='startDate' style="width: 70%">
							<input type='text' class="form-control" name="fromDate"
								id="selectedDate" /> <span class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
					<!--  <div class="form-group">
						<label for="inputSuccess2">Time</label> <select
							class="form-control" name="">
							<option value="">DESC</option>
							<option value="">ACS</option>
						</select>
					</div> -->
					<div class="form-group">
						<label for="inputWarning2">Probability</label> <select
							class="form-control" name="probabilityForYes"
							onchange="handleSelectChange(config)">
							<option value="decs">DESC</option>
							<option value="acs">ACS</option>
						</select>
					</div>
				</div>

				<table class="table table-striped show-hot-news"
					style="margin-top: 10px;">
					<thead>
						<tr>
							<th>NO.</th>
							<th class="table-content-width">Content</th>
							<th>Category</th>
							<th>Probability</th>
							<th>Post Date</th>
							<th>Source</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<jsp:include page="layout/Footer.jsp" flush="true"></jsp:include>


	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.2.3 -->
	<script src="<spring:url value="/resources/plugins/jQuery/jquery-2.2.3.min.js"/>"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<!-- Bootstrap 3.3.6 -->
	<script src="<spring:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
	<!-- Morris.js charts -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="<spring:url value="/resources/plugins/morris/morris.min.js"/>"></script>
	<!-- Sparkline -->
	<script src="<spring:url value="/resources/plugins/sparkline/jquery.sparkline.min.js"/>"></script>
	<!-- jvectormap -->
	<script src="<spring:url value="/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"/>"></script>
	<!-- jQuery Knob Chart -->
	<script src="<spring:url value="/resources/plugins/knob/jquery.knob.js"/>"></script>
	<!-- daterangepicker -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"/>"></script>
	<!-- datepicker -->
	<script src="<spring:url value="/resources/plugins/datepicker/bootstrap-datepicker.js"/>"></script>
	<!-- Slimscroll -->
	<script src="<spring:url value="/resources/plugins/slimScroll/jquery.slimscroll.min.js"/>"></script>
	<!-- FastClick -->
	<script src="<spring:url value="/resources/plugins/fastclick/fastclick.js"/>"></script>
	<!-- AdminLTE App -->
	<script src="<spring:url value="/resources/dist/js/app.min.js"/>"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<spring:url value="/resources/dist/js/demo.js"/>"></script>


	
</body>
</html>
