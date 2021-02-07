/*=========================================================================================
    File Name: form-repeater.js
    Description: form repeater page specific js
    ----------------------------------------------------------------------------------------
    Item Name: Vuexy HTML Admin Template
    Version: 1.0
    Author: PIXINVENT
    Author URL: http://www.themeforest.net/user/pixinvent
==========================================================================================*/

$(function () {
	'use strict';
	var contextPath="/apt";
	
	// form repeater jquery
	$('.invoice-repeater, .repeater-default').repeater({
		show: function () {
			$(this).slideDown();
			
			// Feather Icons
			if (feather) {
				feather.replace({ width: 14, height: 14 });
			}
			
			var now=$(this);
			
			//폼 유효성 검사
			$(this).parent().parent().submit(function(){
				if($(this).parent().find('#isValid').val()
						==$(this).parent().find('#beforeIsValid').val()){
					if($(now).find('#mngcostMCtgNo').val()==0){
						alert('대분류가 선택되지 않았습니다.');
						$('#isValid').val(Number($('#isValid').val())+1);
						return false;
					}else if($(now).find('#mngcostSCtgNo').val()=="0"){
						alert('소분류가 선택되지 않았습니다.');
						$('#isValid').val(Number($('#isValid').val())+1);
						return false;
					}else if($(now).find('#mngcostPrice').val().length<=0){
						alert('지출 금액이 입력되지 않았습니다.');
						$(now).find('#mngcostPrice').focus();
						$('#isValid').val(Number($('#isValid').val())+1);
						return false;
					}else if($(now).find('#mngcostContent').val().length<=0){
						$('#mngcostContent').val("내용 없음");
					}
				}
			});
			
			//지출금액 실시간 더하기
			var pr=0;
			$(this).find('#mngcostPrice').focus(function(){
				pr=Number($(this).val());
			});
			$(this).find('#mngcostPrice').blur(function(){
				tot=Number($('#totalPay').html())-pr;
				$('#totalPay').html(tot+Number($(this).val()));
			});
		
			$(this).find('#mngcostMCtgNo').val(0);
			$(this).find('#mngcostSCtgNo').html("<option value='0'>관리비 소분류</option>");
			
			$(this).find('#mngcostMCtgNo').change(function(){
				if($(this).val()!=0){
					var me=$(this);
					
					//관리비 카테고리 세팅 (리피터 이용 버전)
		 			$.ajax({
						url:contextPath+"/mngcost/showSubCtg.do",
						type:"get",
						data:"mngcostMCtgNo="+$(me).val(),
						dataType:"json",
						success:function(res){
							if(res.length>0){
								var str="<option value='0'>관리비 소분류</option>";
								$.each(res, function(idx, item){
									str+="<option value='"+item.mngcostSCtgNo
										+"'>"+item.mngcostSCtgName+"</option>";
								});
								$(me).parent().parent().next().find('#mngcostSCtgNo').html(str);
							}
						},
						error:function(xhr, status, error){
							alert("error : "+error);
						}
					});
				}							
			});
	  	},				
    	hide: function (deleteElement) {
      		if (confirm('정말 이 항목을 삭제하시겠습니까?')) {
        		$(this).slideUp(deleteElement);
        		
        		//지출금액 실시간 빼기
        		var minusTot=Number($(this).parent().parent().find('#totalPay').html());
        		$(this).parent().parent().find('#totalPay').html(minusTot-Number($(this).find('#mngcostPrice').val()));
        		
        		$(this).empty();
        		$(this).remove();
      		}
    	}
  	});
});