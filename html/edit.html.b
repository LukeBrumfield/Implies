<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<script type="text/javascript" src="prototype.js"></script>
	<script type="text/javascript" src="path.js"></script>
	<script type="text/javascript"> 
	var http_request = false; 

	//New Reference functions
	 
	function makeRequestnewref(url) { 
	   http_request = new XMLHttpRequest();
	   http_request.onreadystatechange = alertContentsnewref;  // set callback
	   http_request.open('GET', url, true);  // initialize
	   http_request.send(null);  // run
	} 


	function alertContentsnewref() 
	{   // callback

	   if (http_request.readyState == 4) 
	  {  // javascript code
		   if (http_request.status == 200) 
		  {  // http code
		if(http_request.responseText == "Success\n")
		{
			alert("Reference successfully added");
		}
		else if (http_request.responseText == "Duplicate\n")
			{
			alert("Reference already exists");
		}

		   }
	   else 
		   { 
			   alert('There was a problem with the request ' 
					  + http_request.status ); 
		   } 
	   } 
	} 

	function inputnewref (form){
		var KeyName = form.KeyName.value;
		var MRNumber = form.MRNumber.value;
		var FreeText = form.FreeText.value;
		var myURL = 'http://reu.marshall.edu/~mummertc/cgi-bin/newreference.cgi?';
		myURL = myURL + 'KeyName=' + encodeURI(KeyName);
		myURL = myURL + '&MRNumber=' + encodeURI(MRNumber);
		myURL = myURL + '&FreeText=' + encodeURI(FreeText);
			makeRequestnewref(myURL); 

	}

	//End New Ref functions


	//New Sub functions
	function makeRequestnewsub(url) { 
	   http_request = new XMLHttpRequest();
	   http_request.onreadystatechange = alertContentsnewsub;  // set callback
	   http_request.open('GET', url, true);  // initialize
	   http_request.send(null);  // run
	} 
	

	function alertContentsnewsub() {   // callback

	   if (http_request.readyState == 4) {  // javascript code
		   if (http_request.status == 200) {  // http code
			if(http_request.responseText == "Success\n"){
				alert("The subsystem was created successfully");

			}else if (http_request.responseText == "Duplicate\n"){
				alert("That ASCII name has already been used");
				}
			else{alert(http_request.responseText);}
	 
		   } else { 
			   alert('There was a problem with the request ' 
					  + http_request.status ); 
		   } 
	   } 
	} 
	function inputnewsub (form){
		var ASCIIName = form.ASCIIName.value;
		var LaTexName = form.LaTexName.value;
		var Reference = form.Reference.value;
		var FreeText = form.FreeText.value;
		var myURL = 'http://reu.marshall.edu/~mummertc/cgi-bin/newsub.cgi?';
		myURL = myURL + 'ASCIIName=' + encodeURI(ASCIIName);
		myURL = myURL + '&LaTexName=' + encodeURI(LaTexName);
		myURL = myURL + '&Reference=' + encodeURI(Reference);
		myURL = myURL + '&FreeText=' + encodeURI(FreeText);
			makeRequestnewsub(myURL);
	}

	//End new subsystem functions

	//New result functions
	function makeRequestnewresult(url) { 
	   http_request = new XMLHttpRequest();
	   http_request.onreadystatechange = alertContentsnewresult;  // set callback
	   http_request.open('GET', url, true);  // initialize
	   http_request.send(null);  // run
	} 


	function alertContentsnewresult() {   // callback

	   if (http_request.readyState == 4) {  // javascript code
		   if (http_request.status == 200) {  // http code
			   alert(http_request.responseText);

	 
		   } else { 
			   alert('There was a problem with the request ' 
					  + http_request.status ); 
		   } 
	   } 
	} 
	function inputnewresult (form){
		var Left = form.KeyName.value;
		var Right = form.MRNumber.value;
		var Relate = form.Relate.value;
		var Citation = form.FreeText.value;
		var myURL = 'http://reu.marshall.edu/~mummertc/cgi-bin/newresult.cgi?';
		myURL = myURL + 'Left=' + encodeURI(Left);
		myURL = myURL + '&Right=' + encodeURI(Right);
		myURL = myURL + '&Relate=' + encodeURI(Relate);
		myURL = myURL + '&Citation=' + encodeURI(Citation);
			makeRequestnewresult(myURL);
	}
	</script>
	<script type="text/javascript"
	  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML-full">
	</script>
	<script> //MathJax Rendering for new subsystem
		(function () {  
		window.UpdateMath_newsub = function (TeX) {
		ns = document.getElementById('MathOutput_newsub');
		ns.innerHTML = TeX;
		MathJax.Hub.Typeset(ns);
			}
	  })();
	</script>
	<script> //MathJax for new subsystem pt 2
		(function () {  
		window.UpdateMath2_newsub = function (TeX) {
		ns2 = document.getElementById('MathOutput2_newsub');
		ns2.innerHTML = TeX;
		MathJax.Hub.Typeset(ns2);
			}
	  })();
	</script>
	<script>
	  (function () {  
		window.UpdateMath_newref = function (TeX) {
		mo = document.getElementById('MathOutput_newref');
		mo.innerHTML = TeX;
		MathJax.Hub.Typeset(mo);
		}
	  })();
	</script>

	<script>
	function shownewresult() { 
	  document.getElementById('main').className='hidden'; 
	  document.getElementById('newresult').className='content'; 
	  document.getElementById('newref').className='hidden'; 
	  document.getElementById('newsub').className='hidden'; 
	  document.getElementById('editsub').className='hidden';
	  document.getElementById('editref').className='hidden';
	  document.getElementById('editresult').className="hidden";  
	}

	function shownewref() { 
	  document.getElementById('main').className='hidden'; 
	  document.getElementById('newresult').className='hidden'; 
	  document.getElementById('newref').className='content'; 
	  document.getElementById('newsub').className='hidden'; 
	  document.getElementById('editsub').className='hidden';
	  document.getElementById('editref').className='hidden';
	  document.getElementById('editresult').className="hidden"; ;  
	}
	function shownewsub() { 
	  document.getElementById('main').className='hidden'; 
	  document.getElementById('newresult').className='hidden'; 
	  document.getElementById('newref').className='hidden'; 
	  document.getElementById('newsub').className='content'; 
	  document.getElementById('editsub').className='hidden';
	  document.getElementById('editref').className='hidden';
	  document.getElementById('editresult').className="hidden";  
	}
	function showmain() { 
	  document.getElementById('main').className='content'; 
	  document.getElementById('newresult').className='hidden'; 
	  document.getElementById('newref').className='hidden'; 
	  document.getElementById('newsub').className='hidden'; 
	  document.getElementById('editsub').className='hidden';
	  document.getElementById('editref').className='hidden';
	  document.getElementById('editresult').className="hidden";  
	}

	function showeditsub() { 
	  document.getElementById('main').className='hidden'; 
	  document.getElementById('newresult').className='hidden'; 
	  document.getElementById('newref').className='hidden'; 
	  document.getElementById('newsub').className='hidden'; 
	  document.getElementById('editsub').className='content';
	  document.getElementById('editref').className='hidden';
	  document.getElementById('editresult').className="hidden"; 
	}
	function showeditref() { 
	  document.getElementById('main').className='hidden'; 
	  document.getElementById('newresult').className='hidden'; 
	  document.getElementById('newref').className='hidden'; 
	  document.getElementById('newsub').className='hidden'; 
	  document.getElementById('editsub').className='hidden';
	  document.getElementById('editref').className='content';
	  document.getElementById('editresult').className="hidden"; 
	}
	function showeditresult() { 
	  document.getElementById('main').className='hidden'; 
	  document.getElementById('newresult').className='hidden'; 
	  document.getElementById('newref').className='hidden'; 
	  document.getElementById('newsub').className='hidden'; 
	  document.getElementById('editsub').className='hidden';
	  document.getElementById('editref').className='hidden';
	  document.getElementById('editresult').className="content";  
	}
	</script>
	<script type="text/javascript">

		function getJSONP(url, success){

			var ud = '_' + +new Date,
				script = document.createElement('script'),
				head = document.getElementsByTagName('head')[0] || document.documentElement;

			window[ud] = function (data)
			{
				head.removeChild(script);
				success && success(data);
			};

			script.src = url.replace('callback=?', 'callback=' + ud);
			head.appendChild(script);

		}

		 getJSONP('http://reu.marshall.edu/~implies/cgi-bin/listsubsystems.cgi');
		 
		var http_request = false;
		var http_request2 = false;
		var side;
		var right;
		var left = document.getElementById("leftsubsystem");
		var systems = new Array();
		
		function click_node(node)
		{
			$('info').update(node);
			MathJax.Hub.Typeset();
		}

		function makeRequest(url)
		{
			http_request = new XMLHttpRequest();
			http_request.onreadystatechange = alertContents; // set callback
			http_request.open('GET', url, true); // initialize
			http_request.send(null); // run
		}

		function alertContents()
		{
			if(http_request.readyState == 4)
			{
				if(http_request.status == 200)
				{
					alert("running");

					var obj = JSON.parse(http_request.responseText);
					var tar = document.getElementById("target");
					var ul = document.createElement('ul');
					tar.appendChild(ul);
					for(var i = 0; i < obj.length; i++)
					{
						systems[obj[i][0]] = obj[i][1];
						var itm = document.createElement('li');
						var lnk = document.createElement('a');
						var str = '\\(\\\\' + obj[i][1] + '\\)';
						var js = 'javascript:switchSub("' + obj[i][0] + '");';
						lnk.innerHTML = str;
						lnk.href = js;
						itm.appendChild(lnk);
						ul.appendChild(itm);
					}
					MathJax.Hub.Typeset();

				}
				else
				{
					alert('There was a problem A ' + http_request.status);
				}
			}
		}

		function populateResult()
		{
		
			var url = 'http://reu.marshall.edu/~implies/cgi-bin/gendot.cgi?';
			//var url = 'http://localhost/~ubuntu/cgi/gendot.cgi?';
			
			upper = document.getElementById("uppersubsystem").label;
			lower = document.getElementById("lowersubsystem").label;
			
			url = url + 'upper=' + encodeURI(upper);
			url = url + '&lower=' + encodeURI(lower);                
			
			http_request2 = new XMLHttpRequest();
			http_request2.onreadystatechange = alertContents2; // set callback
			http_request2.open('GET', url, true); // initialize
			http_request2.send(null); // run
						
			return false;
		}

		function changeSub(end)
		{
			var str;
			side = end;
			document.getElementById('info').style.display = "none";
			document.getElementById('target').style.display = "";
			document.getElementById('select').style.display = "";
			if(side.localeCompare('uppersubsystem'))
			{
			   var str = "Left"
			}
			else
			{
			  str = "Right"
			}
			document.getElementById('select').innerHTML = "Choose " + str + " Subsystem";
			MathJax.Hub.Typeset();
			alert(end);

		}
		
		function changeRelate(){
			if(document.getElementById('relation').innerHTML == "Implies"){
				document.getElementById('relation').innerHTML = "Does not Imply";
			}
			else{
				document.getElementById('relation').innerHTML = "Implies";
			}
		
		}

		function switchSub(ascii)
		{
			document.getElementById(side).innerHTML = '\\(' + systems[ascii] + '\\)';
			document.getElementById(side).label = ascii;
			document.getElementById('info').style.display = "";
			document.getElementById('target').style.display = "none";
			document.getElementById('select').style.display = "none";
			MathJax.Hub.Typeset(side);
		}

		function kl(str)
		{
			return function ()
			{
				alert(str);
			}
		}

        </script>

	<head>
	  <title>Edit - Reverse Mathematics Zoo</title>
	  <meta name="generator" content=
	  "HTML Tidy for Linux/x86 (vers 25 March 2009), see www.w3.org" />
	  <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700'
	  rel='stylesheet' type='text/css' />
	  <link rel="stylesheet" type="text/css" href="style.css" media=
	  "screen" />
	  <link rel="stylesheet" type="text/css" href="centered.css" media=
	  "screen" />
	</head>

	<body onload="showmain()">
	  <div id="container">
		<div id="banner">
		  <h1>Reverse Mathematics Zoo</h1>

		  <div id="centeredmenu">
			<ul>
			  <li><a href="introduction.html">Introduction</a></li>

			  <li><a href="explore.html">Explore</a></li>

			  <li><a href="edit.html" class="active">Edit</a></li>

			  <li><a href="bibliography.html">Bibliography</a></li>

			  <li><a href="news.html">News</a></li>
			</ul>
		  </div>

		  <p id="layoutdims"><a href="#">Log in</a></p>
		</div>

		<div id="nav">
		  <h3>Enter new data</h3>

		  <ul class="menu">
			<li><a href="#" onclick ="shownewresult()" >Results</a></li>

			<li><a href="#" onclick="shownewsub()">Subsystem</a></li>

			<li><a href="#" onclick="shownewref()">References</a></li>
		  </ul>

		  <h3>Edit existing data</h3>

		  <ul class="menu">
			<li><a href="#" onclick="showeditresult()">Results</a></li>

			<li><a href="#" onclick="showeditsub()">Subsystem</a></li>

			<li><a href="#" onclick="showeditref()">References</a></li>
		  </ul>
		</div>


	<div class="hidden" id="main">
	  <h2>Log in</h2>

	  <p>Test</p>

	  <p>Test</p>

	  <p>Test</p>

	  <p>Test</p>

	  <p>Test</p>
	</div>

	<!-- div for new reference-->
	<div class="hidden" id="newref">
		<FORM NAME="form" ACTION="" METHOD="GET">
		 <p>Key: <input type="text" name="KeyName" value=""><br><br>
		 Math Reviews number: <input type="text" name="MRNumber" value=""> (optional)<br><br>
	Reference details:<br/>
		<textarea name="FreeText" id="MathInput_ref" 
		   size="50" onkeyup="UpdateMath_newref(this.value)" >  </textarea>
		<br><br>
		</p>
		<div id="MathOutput_newref" class="tex_render"> </div>
		<br><br>
		<p>
		<input type="button" id="mybutton_newref" name="mybutton_newref" value="Submit" onClick="inputnewref(this.form)">
		</FORM>
		</p>
	</div>

	<!-- div for new subsystem-->
	<div class="hidden" id="newsub">
		<FORM NAME="myform_newsub" ACTION="" METHOD="GET">
			<p>ASCII name: <input type="text" name="ASCIIName" value="">
				<br><br>
				LaTeX name:<br/>
				<textarea name="LaTexName" id="MathInput" size="50" onkeyup="UpdateMath_newsub(this.value)"></textarea> 
				<br><br>
			</p>
			<p>
				<div id="MathOutput_newsub" class="tex_render"></div>
			</p>
			<br>
			<p>
				Reference to subsystem (optional): <input type="text" name="Reference" value="">
				<br><br>
				Free text about subsystem (optional) <br/>
				<textarea name="FreeText" id="MathInput2" size="50" onkeyup="UpdateMath2_newsub(this.value)"></textarea>
				<br><br>
			</p>
				<div id="MathOutput2_newsub" class="tex_render"></div>
			<br>
			<input type="button" id="mybutton_newsub" name="mybutton_newsub" value="Submit" onClick="inputnewsub(this.form)">
		</FORM>
	</div>

	<!--div for newresult-->
	<div class="hidden" id="newresult">
		<FORM NAME="myform_newresult" ACTION="" MEHTOD="GET">
			<h3>Right Subsystem</h3>
			<ul class="select">
				<li id="uppersubsystem">None Selected</li>
				<li>
				<a class="selectsubsystem" href="#" name="uppersubsystem" onclick="changeSub('uppersubsystem');">[change]</a>
				</li>
			</ul>
			<h3>Relate</h3>
				<ul class="select">
				<li id="relation">Implies</li>
				<li>
				<a class="selectrelate" href="#" name="relate" onclick='changeRelate();'>[change]</a>
				</li>
			</ul>
			<h3>Left Subsystem</h3>
			<ul class="select">
				<li id="lowersubsystem">None Selected</li>
				<li>
				<a id="lowersubsystem" class="selectsubsystem" href="#" name="lowerubsystem" onclick='changeSub("lowersubsystem");'>[change]</a>
				</li>
			</ul>
	<div id="content">
		<div id="select" class="content"></div>
		<div id="target" style="display:none"></div>
	</div>
	<div class="content" id="info"></div>
    <div id="debug_output" style="display:none"></div>
            <!-- Always keep debug_output -->
		Reference:
		<input type="text" name="Reference" value=""><br><br>
		<input type="button" name="button" value="Submit" onClick="inputnewresult(this.form)">
		</FORM>
		</p>
	</div>
	
	
	<!-- div for edit reference-->
	<div class="hidden" id="editref">
		<FORM NAME="myform_editref" ACTION="" METHOD="GET">
		 <p>Key: <input type="text" name="KeyName" value=""><br><br>
		 Math Reviews number: <input type="text" name="MRNumber" value=""> (optional)<br><br>
	Reference details:<br/>
		<textarea name="FreeText" id="MathInput_ref" 
		   size="50" onkeyup="UpdateMath_editref(this.value)" >  </textarea>
		<br><br>
		</p>
		<div id="MathOutput_editref" class="tex_render"> </div>
		<br><br>
		<p>
		<input type="button" id="mybutton_editref" name="mybutton_editref" value="Submit" onClick="inputeditref(this.form)">
		</FORM>
		</p>
	</div>

	<!-- div for edit subsystem-->
	<div class="hidden" id="editsub">
		<FORM NAME="myform_editsub" ACTION="" METHOD="GET">
			<p>ASCII name: <input type="text" name="ASCIIName" value="">
				<br><br>
				LaTeX name:
				<textarea name="LaTexName" id="MathInput" size="50" onkeyup="UpdateMath_editsub(this.value)"></textarea> 
				<br><br>
			</p>
			<p>
				<div id="MathOutput_editsub" class="tex_render">
				</div>
			</p>
			<br>
			<p>
				Reference to subsystem (optional): <input type="text" name="Reference" value="">
				<br><br>
				Free text about subsystem (optional)
				<textarea name="FreeText" id="MathInput2" size="50" onkeyup="UpdateMath2_editsub(this.value)"></textarea>
				<br><br>
			</p>
			<div id="MathOutput2_editsub" class="tex_render">
			</div>
			<br>
			<input type="button" id="mybutton_editsub" name="mybutton_editsub" value="Submit" onClick="inputeditsub(this.form)">
		</FORM>
	</div>


	<!--div for newresult-->
	<div class="hidden" id="editresult">
		<FORM NAME="myform_editresult" ACTION="" MEHTOD="GET">
		
		<input type="text" name="Reference" value=""><br><br>
		<input type="button" name="button" value="Submit" onClick="inputeditresult(this.form)">
		</FORM>
		</p>
	</div>

	<div id="push"></div>
	</div>

	<div id="footer">
		<p><a href="about.html">About this site</a> &bull; <a href=
		"copyright.html">Copyright</a> &bull; <a href="about.html">Contact
		us</a></p>
	</div>
	</body>
</html>

