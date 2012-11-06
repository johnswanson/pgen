<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
		<style type="text/css">

		body {
			text-align:center;
		}
		#service {
			font-size:32px;
			padding:20px;
			text-align:center;
			margin-left:auto;
			margin-right:auto;
			display:block;
		}
		.mastertext {
			font-size:35px;
			margin-left:auto;
			margin-right:auto;
			padding:20px;
			display:block;
			text-align:center;
		}
		#length {
			display:block;
			font-size:24px;
			text-align:center;
			padding:10px;
			margin-left:auto;
			margin-right:auto;
		}
		#other {
			display:block;
			text-align:center;
			font-size:18px;
			padding:5px;
			margin-left:auto;
			margin-right:auto;
		}
		div#formbox {
			margin-top:20%;
		}
		#result {
			display:block;
			text-align:center;
			font-size:32px;
			padding:20px;
			margin-left:auto;
			margin-right:auto;
		}
		a#submit {
			font-size:60px;
			text-decoration:none;
			font-color: black;
		}
		
		</style>
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

        <!-- Add your site or application content here -->
		<div id="formbox">
			<form method="POST" action="">
				<input id="service" type="text" name="service" placeholder="service" />
				<div id="masterpassbox">
					<input class="mastertext" id="masterpass" size="50" type="password" placeholder="passphrase" name="master" />
					<input class="mastertext" id="masterpass-shown" size="50" type="text" style="display:none" placeholder="passphrase" name="master" />
					<label for="showmaster">Show Password</label>
					<input id="showmaster" type="checkbox" />
				</div>
				<label for="length">Length</label>
				<input id="length" size="3" type="text" name="length" value="15" />
				<label for="alpha">Alphabetic</label>
				<input id="alpha" checked="checked" type="checkbox" name="alpha" value="allowed" />
				<label for="numer">Numeric</label>
				<input id="numer" checked="checked" type="checkbox" name="numer" value="allowed" />
				<label for="symbo">Symbolic</label>
				<input id="symbo" checked="checked" type="checkbox" name="symbo" value="allowed" />
				<label for="other">Other</label>
				<input id="other" type="text" placeholder="other chars" name="other_allowed" value="" />
				<a id="submit" href="#">Get Password</a>
			</form>
		</div>
		<input id="result" type="text" size="80" />


        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.8.2.min.js"><\/script>')</script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>

        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
        <script>
            var _gaq=[['_setAccount','UA-35026453-1'],['_trackPageview']];
            (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
            g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
            s.parentNode.insertBefore(g,s)}(document,'script'));
        </script>

		<script type="text/javascript">
			$("#showmaster").change(function(){
				if ($("#showmaster").is(":checked")) {
					$("#masterpass-shown").show()
					$("#masterpass").val("")
					$("#masterpass").hide()
				} else {
					$("#masterpass-shown").val("")
					$("#masterpass-shown").hide()
					$("#masterpass").show()
				}
			});

			$(".mastertext").keypress(function(e){
				if (e.which == 13) {
					$("#submit").click()
				}
			});

			$("#submit").click(function(e){
				data = {
					length:$("#length").val(),
					master:$("#showmaster").is(":checked")?$("#masterpass-shown").val():$("#masterpass").val(),
					service:$("#service").val(),
					alpha: $("#alpha").is(":checked")?"allowed":"",
					numer:$("#numer").is(":checked")?"allowed":"",
					symbo:$("#symbo").is(":checked")?"allowed":"",
					other:$("#other").val(),
				}
				$.post('getpw', data, function(result){
					$("#result").val(result)
					$("#result").select()
				});
			});
		</script>
    </body>
</html>
