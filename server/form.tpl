<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Mawud - Fast, Secure Password Management</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

		<link href="http://fonts.googleapis.com/css?family=Source+Code+Pro" rel="stylesheet" type="text/css"/>
		<link href='http://fonts.googleapis.com/css?family=Overlock+SC' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Scada' rel='stylesheet' type='text/css'>
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
		<style type="text/css">

		::-webkit-input-placeholder {
			color:#444;
		}
		::-moz-placeholder {
			color:#444;
		}
		body {
			font-family: 'Scada', sans-serif;
			text-align:center;
			background-color:#111;
			color:#CCC;
		}
		input {
			background-color:#222;
			color:#BFFF00;
			font-family:'Scada', sans-serif;
			font-size:32px;
			margin-left:auto;
			margin-right:auto;
			margin-bottom:10px;
			border-color: #00CCFF;
			border-radius: 5px;
			border-style: solid;
			border-width: 2px;
			padding:20px;
			box-shadow: #00CCFF 0px 0px 16px 0px, #00CCFF 0px 0px 20px 0px inset;
		}
		input:focus {
			outline:none;
			background-color:#333;
		}
		#service {
			margin-left:auto;
			display:block;
		}
		.mastertext {
			margin-right:auto;
			display:block;
		}
		#length {
			display:block;
			font-size:24px;
			text-align:center;
			padding:10px;
			margin-left:auto;
			margin-right:auto;
			box-shadow: #00CCFF 0px 0px 4px 0px, #00CCFF 0px 0px 10px 0px inset;
		}
		#other {
			display:block;
			text-align:center;
			font-size:18px;
			padding:5px;
			margin-left:auto;
			margin-right:auto;
			box-shadow: #00CCFF 0px 0px 4px 0px, #00CCFF 0px 0px 10px 0px inset;
		}
		div#formbox {
			margin-top:100px;
		}
		#result {
			border-color: #77DD00;
			border-radius: 5px;
			border-style: solid;
			border-width: 2px;
			box-shadow: #77DD00 0px 0px 16px 0px, #77DD00 0px 0px 20px 0px inset;
			margin-bottom:15px;
			display:block;
			font-size:32px;
			padding:20px;
			margin-left:auto;
			margin-right:auto;
		}
		div#btn:hover{
			cursor:pointer;
		}
		div#btn {
			margin-top:20px;
			margin-bottom:20px;
			margin-left:auto;
			margin-right:auto;
			width: 400px;
			font-color: white;
			background-color:#999;
		}
		#defaultsbox{
			margin-left:auto;
			margin-right:auto;
			width:400px;
			background:#222;
			border-bottom-color: #00CCFF;
			border-bottom-left-radius: 5px;
			border-bottom-right-radius: 5px;
			border-bottom-style: solid;
			border-bottom-width: 2px;
			border-left-color: #00CCFF;
			border-left-style: solid;
			border-left-width: 2px;
			border-right-color: #00CCFF;
			border-right-style: solid;
			border-right-width: 2px;
			border-top-color: #00CCFF;
			border-top-left-radius: 5px;
			border-top-right-radius: 5px;
			border-top-style: solid;
			border-top-width: 2px;
			box-shadow: #00CCFF 0px 0px 16px 0px, #00CCFF 0px 0px 20px 0px inset;
		}
		a#showdefaults {
			color:#999;
			margin-bottom:15px;
			margin-top:5px;
		}
		a#showdefaults:hover{
			color:#AAA;
			cursor:pointer;
		}
		a.mainlink{
			display:block;
		}
		a {
			color:#999;
			margin-bottom:15px;
			margin-top:5px;
			text-decoration:none;
		}
		a:hover {
			color:#AAA;
			cursor:pointer;
		}
		p {
			margin-top:20px;
			margin-left:150px;
			margin-right:150px;
			margin-bottom:20px;
		}
		div#aboutbox {
			text-align:left;
			margin-left:auto;
			margin-right:auto;
			width:600px;
			background:#222;
			border-color: #2ACBF3;
			border-radius: 5px;
			border-style: solid;
			border-width: 2px;
			box-shadow: #2ACBF3 0px 0px 16px 0px, #2ACBF3 0px 0px 20px 0px inset;
		}
		div#biginputsbox{
			background-color:#222;
			padding-top:20px;
			width:600px;
			margin-left:auto;
			margin-right:auto;
			margin-bottom:20px;
			border-radius: 5px;
			border-style: solid;
			border-color: #CCFFFF;
			border-width: 2px;
			box-shadow: #CCFFFF 0px 0px 16px 0px, #CCFFFF 0px 0px 20px 0px inset;
		}
		h1 {
			margin-left:auto;
			margin-right:auto;
			font-size:80px;
			text-shadow: #BFFF00;
			color:#BFFF00;
		}
		h2 {
			font-size:50px;
			color:#6BBB00;
		}
		</style>
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?#red=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

        <!-- Add your site or application content here -->
		<div id="formbox" style="display:none;">
			<form>
				<div id="biginputsbox">
					<input id="result" type="text" size="25" placeholder="RESULT" style="display:none;"/>
					<input id="service" type="text" name="service" placeholder="SERVICE" size="25" style="display:none;"/>
					<div id="masterpassbox">
						<input class="mastertext" id="masterpass" size="25" type="password" placeholder="PASSPHRASE" name="master" style="display:none;"/>
						<input class="mastertext" id="masterpass-shown" size="25" type="text" style="display:none" placeholder="PASSPHRASE" name="master" />
						<input id="showmaster" type="checkbox" />
						<label for="showmaster">Show passphrase</label>
					</div>
				</div>
				<a class="mainlink" id="showdefaults">view/edit parameters</a>
				<div id="defaultsbox" style="display:none;">
					<label for="length">Length</label>
					<input id="length" size="1" type="text" name="length" value="15" />
					<input id="alpha" checked="checked" type="checkbox" name="alpha" value="allowed" />
					<label for="alpha">Alphabetic</label>
					<input id="numer" checked="checked" type="checkbox" name="numer" value="allowed" />
					<label for="numer">Numeric</label>
					<input id="symbo" checked="checked" type="checkbox" name="symbo" value="allowed" /> <label for="symbo">Symbolic</label>
					<input id="other" type="text" placeholder="MORE ALLOWED CHARS" name="other_allowed" value="" />
					<div id="btn"><a style="display:none;" id="submit" href="#">GET PASSWORD</a></div>
				</div>
			</form>
			<a class="mainlink" id="about">what is this?</a>
			<div id="aboutbox" style="display:none;">
				<p>Mawud is password management system that never stores a single password!</p>
				<p>
					Instead, it uses a service name (like "gmail") and a master passphrase to 
					generate a pseudorandom, 15-character password. Try it out--just type a service
					and passphrase, then hit enter to get the resulting password!  It'll be
					automatically highlighted for easy copying.
				</p>
				<p>
					The next time you want to log into your service, just use the same master passphrase
					with that service's name, and the same password will be generated.
				</p>
				<p>
					There's no storage of your passwords anywhere.  No accounts. No authentication.
					No need to worry about whether I've encrypted your passwords securely.
				</p>
				<p>
					The password generation is open source and written in Go, so if you'd 
					prefer, you can run everything locally!  
				</p>
				<p>
					View source at <a href="https://github.com/johnswanson/pwgen-go">github.</a>
				</p>
				<p>
					Technical details: your service and passphrase are concatenated, then run through
					a SHA-256 hash a thousand times (the extra iterations just slow down the process for
					anyone trying to generate a list of possible output passwords).
				</p>
			</div>
			<h2 id="loading"></h2>
		</div>


        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<script src="http://crypto-js.googlecode.com/svn/tags/3.0.2/build/rollups/sha256.js"></script>
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
			const alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
			const symbolic = "~`!@#$%^&*()_+-={}|[]\\:\";'<>?,./"
			const numeric =  "0123456789"

			$("#about").click(function(){
				$("#aboutbox").slideToggle('fast', function(){
					if(!$("#aboutbox").is(":visible")) {
						$("#service").focus()
					}
				})
			})

			$("#showdefaults").click(function(){
				$("#defaultsbox").slideToggle('fast', function(){
					if ($("#defaultsbox").is(":visible")) {
						$("#length").focus()
					} else {
						$("#service").focus()
					}
				})
			})

			$(document).ready(function(){
				$("#formbox").fadeIn(1200)
				$("#service").fadeIn(200)
				$("#result").fadeIn(1200)
				$("#masterpass").fadeIn(1200)
				$("#service").focus()
			})

			$("#showmaster").change(function(){
				if ($("#showmaster").is(":checked")) {
					$("#masterpass-shown").show()
					$("#masterpass").val("")
					$("#masterpass").hide()
					$("#masterpass-shown").focus()
				} else {
					$("#masterpass-shown").val("")
					$("#masterpass-shown").hide()
					$("#masterpass").show()
					$("#masterpass").focus()
				}
			})

			$("input").keypress(function(e){
				if (e.which == 13) {
					length = $("#length").val()

					master = $("#showmaster").is(":checked")?$("#masterpass-shown").val():$("#masterpass").val()

					service = $("#service").val().toLowerCase()

					alpha = $("#alpha").is(":checked")
					numbers = $("#numer").is(":checked")
					symbols = $("#symbo").is(":checked")
					other = $("#other").val()
					
					Allowed = (alpha ? alphabet : "") + 
							  (numbers ? numeric : "") + 
							  (symbols ? symbolic : "") +
							  other

					pw = computePassword(master, service, Allowed, length)
					$("#result").val(pw)
					$("#result").select()
				}
			})


			function computePassword(master, service, Allowed, length) {
				var iterations = 1001
				var pw = ""
				while (pw.length < length) {
					iterations += 1
					bs = repeatedSha(master+service+iterations.toString(), iterations)
					pw = AlphaEncode(Allowed, bs)
				}
				return pw.substring(0, length)
			}

			function repeatedSha(phrase, reps) {
				if (reps == 1){
					return CryptoJS.SHA256(phrase)
				} else {
					return repeatedSha(CryptoJS.SHA256(phrase), reps - 1)
				}
			}

			function AlphaEncode(alpha, bytes) {
				bytes = bytes.toString(CryptoJS.enc.Hex)
				output = ""
				for (i=0; i<(bytes.length-1); i = i+2) {
					n = parseInt( bytes.substring(i, i+2), 16)
					l = alpha.length
					while (n > 0) {
						first = n % l
						output += alpha.charAt(first)
						n = Math.floor(n/l)
					}
				}
				return output
			}
		</script>
    </body>
</html>
