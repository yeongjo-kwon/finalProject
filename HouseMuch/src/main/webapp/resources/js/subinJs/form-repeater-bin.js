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
  	$('.invoice-repeater-bin, .repeater-default').repeater({
    	show: function () {
    		$(this).slideDown();
     		// Feather Icons
      		if (feather) {
        		feather.replace({ width: 14, height: 14 });
      		}
      
      		var now=$(this);
      	
      		var dateMask = $('.date-mask');
      	
	  		if(dateMask.length) {
				new Cleave(dateMask, {
				date: true,
				delimiter: '-',
				datePattern: ['Y', 'm', 'd']
				});
			}
      	
	      	//수빈 입주민관리 폼 유효성 검사
			$(this).parent().parent().submit(function(){
				if($(this).parent().find('#isValid').val()==$(this).parent().find('#beforeIsValid').val()){
					if($(now).find('#dong').val()==0){
						alert('동을 선택해주세요');
						$('#isValid').val(Number($('#isValid').val())+1);
						return false;
					}else if($(now).find('#ho').val()==0){
						alert('호를 선택해주세요');
						$('#isValid').val(Number($('#isValid').val())+1);
						return false;
					}else if($(now).find('#hMembName').val().length<=0){
						alert('이름을 입력해주세요');
						$(now).find('#hMembName').focus();
						$('#isValid').val(Number($('#isValid').val())+1);
						return false;
					}else if($(now).find('#birth').val().length<=0){
						alert('생년월일을 입력해주세요');
						$(now).find('#birth').focus();
						$('#isValid').val(Number($('#isValid').val())+1);
						return false;				
					}
				}
			});      
	      	
	      	$(this).find('#dong').val(0);
	      	$(this).find('#relation').val('본인');
	      	$(this).find('#ho').val(0);
			$(this).find('#ho').html("<option value='0'>호</option>");
						
			$(this).find('#dong').change(function(){
				if($(this).val()!=0){
					var me=$(this);
						
		 			$.ajax({
						url:contextPath+"/admin/adminOwner/hoList.do",
						type:"get",
						data:"dong="+$(me).val(),
						dataType:"json",
						success:function(res){
							if(res.length>0){
								var str="<option value='0'>호</option>";
								$.each(res, function(idx, item){
									str+="<option value='"+item+"'>"+item+"호</option>";
								});
								$(me).parent().parent().next().find('#ho').html(str);
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
	      if (confirm('삭제하시겠습니까?')) {
	        $(this).slideUp(deleteElement);
	      }
	    }
	});
	
	
});
