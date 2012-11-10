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

		<link href='http://fonts.googleapis.com/css?family=Scada' rel='stylesheet' type='text/css'>
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
		<link href="static/css/main.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?#red=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

        <!-- Add your site or application content here -->
		<div id="formbox" style="display:none;">
			<input readonly="readonly" id="result" type="text" size="25" placeholder="RESULT" style="display:none;"/>
			<form>
				<div id="biginputsbox">
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
			<a class="mainlink" id="about">help</a>
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
					View source at <a href="https://github.com/johnswanson/pgen">github.</a>
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
		<script type="text/javascript" src="static/js/main.js"></script>
    </body>
</html>
