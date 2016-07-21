var index=0;
function change(){
	index=index+1;
	if(index==3){
		index=1;
	}
	if(index==1){
		pic1.style.display='block';
		pic2.style.display='none';
		pic3.style.display='none';
	}
	if(index==2){
		pic1.style.display='none';
		pic2.style.display='block';
		pic3.style.display='none';
	}
	if(index==3){
		pic1.style.display='none';
		pic2.style.display='none';
		pic3.style.display='block';
	}
	setTimeout('change()',1000);
}