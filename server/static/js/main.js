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
	$("#masterpass").fadeIn(1200)
	if (!("autofocus" in document.createElement("input"))) {
		$("#service").focus()
	}
})

$("#result").blur(function(){
	$("#service").select()
	$("#result").slideUp(200)
	$("#result").text("")
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
		$("#result").slideDown(100, function(){
			$("#result").val(pw)
			$("#result").focus()
			$("#result").select()
		})
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
