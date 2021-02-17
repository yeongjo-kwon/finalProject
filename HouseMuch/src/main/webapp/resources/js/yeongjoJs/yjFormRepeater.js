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
	$('.invoice-repeater2, .repeater-default').repeater({
		show: function () {
			$(this).slideDown();
			
			// Feather Icons
			if (feather) {
				feather.replace({ width: 14, height: 14 });
			}
			$(this).find('#householdCode').val(0);
			
			$(this).find('#UCostAmount').keyup(function(){
				//전기요금 계산 (주택용 전력(저압))
				var amount=$(this).val();
				var price=0;
				
				//누진제 적용
				if(amount<=200){
					price=910+(amount*93.3);
				}else if(amount<=400){
					price=1600+(200*93.3)+((amount-200)*187.9);
				}else{
					price=7300+(200*93.3)+(200*187.9)+((amount-400)*280.6);
				}
				
				//부가세 + 전력기금 추가 (+10원 절삭)
				price+=price*0.137;
				$(this).parent().parent().next().find('#UCostPrice').val(Math.round(price/10)*10);
			});
			
			$(this).find('#householdCode').change(function(){
				ajaxElecChrgDupCheck($(this));
			});
			
			var now=$(this);
			
			$(this).parent().parent().submit(function(){
				if($(now).parent().parent().parent().find('#isValid').val()
						==$(now).parent().parent().parent().find('#beforeIsValid').val()){
					if($(now).find('#householdCode').val()=="0"){
						alert('세대가 선택되지 않았습니다.');
						$('#isValid').val(Number($('#isValid').val())+1);
						return false;
					}else if($('#dupCheckCount').val()!="0"){
						alert('중복된 세대코드가 존재합니다.');
						$('#isValid').val(Number($('#isValid').val())+1);
						return false;
					}else if($(now).find('#UCostAmount').val().length<=0){
						alert('전기 사용량이 입력되지 않았습니다.');
						$(now).find('#UCostAmount').focus();
						$('#isValid').val(Number($('#isValid').val())+1);
						return false;
					}
				}
			});
	  	},				
    	hide: function (deleteElement) {
      		if (confirm('정말 이 항목을 삭제하시겠습니까?')) {
        		$(this).slideUp(deleteElement);
        		
        		$(this).empty();
        		$(this).remove();
      		}
    	}
  	});
});

function ajaxElecChrgDupCheck(eventEl){
  	$.ajax({
		url:contextPath+"/admin/adminMngcost/adminElectricChargeRegDupCheck.do",
		type:"post",
		data:$('form[name=repeatFrm]').serialize(),
		dataType:"json",
		success:function(res){
			var cnt=0;
			
			//등록 대상끼리 중복체크
			var bool1=false;
			var currDupArr=res.currDup;
			for(var i=0; i<currDupArr.length; i++){
				if($(eventEl).val()==currDupArr[i]){
					bool1=true;
					break;
				}
			}
			if(bool1){
				$(eventEl).prev().find('#warnIcon').css("display", "inline");
				cnt++;
			}else{
				$(eventEl).prev().find('#warnIcon').css("display", "none");
			}
			
			//입력된 데이터와 중복체크
			var bool2=false;
			var alreadyDupArr=res.alreadyDup;
			for(var i=0; i<alreadyDupArr.length; i++){
				if($(eventEl).val()==alreadyDupArr[i]){
					bool2=true;
					break;
				}
			}
			if(bool2){
				$(eventEl).prev().find('#cautionIcon').css("display", "inline");
				cnt++;
			}else{
				$(eventEl).prev().find('#cautionIcon').css("display", "none");
			}
			
			//플래그 & 중복 row 개수
			if($(eventEl).next().val()=='N'){
				if(cnt>0) {
					$(eventEl).next().val('Y');
					$('#dupCheckCount').val(Number($('#dupCheckCount').val())+1);
					$('#iconInfo').css("display", "inline");
				}
			}else if($(eventEl).next().val()=='Y'){
				if(cnt==0) {
					$(eventEl).next().val('N');
					if($('#dupCheckCount').val()==1){
						$('#iconInfo').css("display", "none");
					}
					$('#dupCheckCount').val(Number($('#dupCheckCount').val())-1);
				}
			}
		},
		error:function(xhr, status, error){
			alert("error : "+error);
		}
	});
}
