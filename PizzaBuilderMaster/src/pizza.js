// Write your Pizza Builder JavaScript in this file.
// $("document").on('Ready',function(){

function CalculatePrice(){
	var total_price;
	$('btn-pepperoni').hasClass('active') ? total_price+=1
	$('btn-mushrooms').hasClass('active') ? total_price+=1
	$('btn-green-peppers').hasClass('active') ? total_price+=1
	$('btn-sauce').hasClass('active') ? total_price+=3
	$('btn-crust').hasClass('active') ? total_price+=5
	return total_price
};

function


$('.btn-pepperonni').on('click', function(){
	$('.pep').toggle();
	$(this).toggleClass('active');
});
$(".btn-mushrooms").on("click", function(){
	$('.mushroom').toggle();
	$(this).toggleClass('active');
});
$(".btn-green-peppers").on("click",function(){
	$('.green-pepper').toggle();
	$(this).toggleClass('active');
});
$(".btn-sauce").on("click",function(){
	$('.sauce').toggleClass("sauce-white");
	$(this).toggleClass('active');
});
$(".btn-crust").on("click",function(){
	$('.crust').toggleClass("crust-gluten-free");
	$(this).toggleClass('active');
});





// });