<cfoutput>
<!DOCTYPE html>
    <head>
		<title>Railo Docs</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <script type="text/javascript" src="#getContextRoot()#/javascripts/jquery-1.7.2.min.js"></script>
        <script type="text/javascript" src="#getContextRoot()#/bootstrap/js/bootstrap.min.js"></script>
        <script src="http://yandex.st/highlightjs/7.0/highlight.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('pre code').each(function(i, e) {hljs.highlightBlock(e)});
            });        </script>
        <link rel="stylesheet" href="#getContextRoot()#/bootstrap/css/bootstrap.css"/>
        <link rel="stylesheet" href="#getContextRoot()#/bootstrap/css/bootstrap-responsive.css"/>
        <link rel="stylesheet" href="#getContextRoot()#/stylesheets/application.css"/>
        <link rel="stylesheet" href="#getContextRoot()#/stylesheets/github.css"/>
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