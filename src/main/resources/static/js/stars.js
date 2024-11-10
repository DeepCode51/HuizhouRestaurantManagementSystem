const stars = document.getElementsByClassName("stars"),
      full  = `<i class="fas fa-star"></i>`,
      half  = `<i class="fas fa-star-half"></i>`,
      empty = `<i class="far fa-star"></i>`;

for(let star of stars){
	
	let num = parseFloat(star.innerHTML);
	let count = 0;
	let str = "";
	
	for(var i=1; i<=num; i++){
		count++;
		str += full;
	}
	
	if(num%1 >= 0.5){
		count++;
		str += half;
	}
    
	/* icons don't quite look right with the empty stars after half stars */
	
	//for(var i=count; i<5; i++){
	//    str += empty;
	//}
	
	star.innerHTML = str;
}