	$(function(){
		var $div_li=$("div#select ul li");
		$div_li.click(function(){
			$(this).addClass("selected").siblings().removeClass("selected");
			var index=$div_li.index(this);
			$("div#box>div").eq(index).show().siblings().hide();
			})
		})