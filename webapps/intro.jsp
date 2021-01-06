<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

${ctxPath = pageContext.request.contextPath; ''}

<!DOCTYPE>
<html>
<head>
	<title></title>
	<jsp:include page="/includee/init.jsp"/>
</head>
<body>
	<jsp:include page="/includee/navbar.jsp"/>
	<div class="container" style="margin: 60px auto;">
		<h2 style="font-family: 'Merriweather';">Be a Business Booster!</h2>
		<br />
		<img src="${ctxPath}/img/intro.jpg" alt="Image" />
		<br /><br /><br />
		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
		Donec ac urna id dolor semper malesuada et quis justo. 
		Ut imperdiet, est a tincidunt cursus, risus libero lacinia quam, 
		et rutrum neque quam non risus. Cras venenatis leo nec imperdiet volutpat. 
		Mauris sit amet varius nibh. Sed vel nisl lacus. Ut sit amet tortor consequat, 
		ultrices libero vel, efficitur dolor. Vestibulum commodo vulputate dui, 
		at dictum orci cursus suscipit. Mauris mattis nunc erat. 
		Interdum et malesuada fames ac ante ipsum primis in faucibus. 
		Aenean suscipit lorem quis leo consectetur scelerisque. Praesent condimentum, 
		massa ac vehicula dictum, urna tortor fermentum lacus, non eleifend augue est ut leo.
		Morbi tincidunt ex eget tincidunt tincidunt. Praesent metus enim, egestas ut euismod at, 
		commodo nec enim. Etiam tempor ut ligula eu rutrum. Mauris nec tellus orci. 
		Aliquam auctor posuere est a interdum. Pellentesque hendrerit tellus eros, 
		in dictum eros auctor vel. Integer sodales varius nisl at dictum. 
		Donec mi nunc, finibus eu interdum quis, aliquam vitae arcu.</p>
	</div>
	<jsp:include page="/includee/footer.jsp"/>
</body>
</html>