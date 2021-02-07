/**
 * yjInquiryAjax
 */
 	var contextPath="/apt";
 	//관리비 카테고리 세팅
 	function ajaxCtgSetting(me){
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
					$(me).parent().parent().find('#mngcostSCtgNo').html(str);
				}
			},
			error:function(xhr, status, error){
				alert("error : "+error);
			}
		});
	}
	
	//관리비 지출내역 조회(입주자)
	function ajaxInquiry(){
		$.ajax({
			url:contextPath+"/mngcost/showDetail.do",
			type:"get",
			data:{
				mngcostMCtgNo:$('#mngcostMCtgNo').val(),
				mngcostSCtgNo:$('#mngcostSCtgNo').val(),
				mngcostClaimdate:$('#mngcostClaimdate').val()
			},
			dataType:"json",
			success:function(res){
				var str="";
				if(res.length>0){
					$.each(res, function(idx, item){
						str+="<tr><th scope='row'>"+(idx+1)+"</th>";
						str+="<td>"+formatDate(item.mngcostUsedate)+"</td>";
						str+="<td>"+item.mngcostContent+"</td>";
						str+="<td>"+numFormat(item.mngcostPrice)+"원</td></tr>";
					});
				}else{
					str+="<tr><th scope='row'>#</th>";
					str+="<td colspan='3'>내역이 존재하지 않습니다.</td></tr>";
				}
				$('#mngcostInfoTable').find('tbody').html(str);
			},
			error:function(xhr, status, error){
				alert("error : "+error);
			}
		});
	}
	
	//관리비 상세내역 보여주기(꽌리자)
 	function ajaxAdminInquiry(){
		$.ajax({
			url:contextPath+"/admin/adminMngcost/showDetail.do",
			type:"get",
			data:{
				mngcostMCtgNo:$('#mngcostMCtgNo').val(),
				mngcostSCtgNo:$('#mngcostSCtgNo').val(),
				startdate:$('#startdate').val(),
				enddate:$('#enddate').val()
			},
			dataType:"json",
			success:function(res){
				var str="";
				if(res.length>0){
					$.each(res, function(idx, item){
						str+="<tr><th scope='row'><input type='checkbox' name='mngcostNoArray[]' value='"+item.mngcostNo+"'></th>";
						str+="<td>"+item.mngcostContent+"</td>";
						str+="<td>"+numFormat(item.mngcostPrice)+"원</td>";
						str+="<td>"+formatDate(item.mngcostUsedate)+"</td></tr>";
					});
				}else{
					str+="<tr><th scope='row'>#</th>";
					str+="<td colspan='3'>내역이 존재하지 않습니다.</td></tr>";
				}
				$('#mngcostInfoTable').find('tbody').html(str);
			},
			error:function(xhr, status, error){
				alert("error : "+error);
			}
		});
	}
	
	//천 단위 넘버포맷
	function numFormat(number){
		return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
	}
