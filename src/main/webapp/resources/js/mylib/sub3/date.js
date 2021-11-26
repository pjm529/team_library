$(function(){
	

let date = new Date();

/*function nowDate(){
	let viewYear = date.getFullYear();
	let viewMonth = date.getMonth() + 1;
	let viewDate = date.getDate();
	
	document.querySelector('.date').textContent = `${viewYear}-${viewMonth}-${viewDate}`;
	
}*/


$(document).ready(function(){
	var nowDate = $(".date").val();
	console.log(nowDate);
});


function prevDay() {
    date.setDate(date.getDate() - 1);
}

function nextDay() {
    date.setDate(date.getDate() + 1);
}

function goToday() {
    date = new Date();
}

});