<cfoutput>
<!DOCTYPE html>
    <head>
		<title>Railo Docs</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="/bootstrap/css/bootstrap.css"/>
        <link rel="stylesheet" href="/bootstrap/css/bootstrap-responsive.css"/>
        <style type="text/css">
            body {
                padding-top: 60px;
                padding-bottom: 40px;
            }
        </style>
	</head>
	<body>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <ul class="nav">
                        <li><a href="#buildUrl('tags')#">Tags</a></li>
                        <li><a href="/functions">Functions</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container">
            #body#	<!--- body is result of views --->
        </div>
	</body>
</html>
</cfoutput>