/**
 * yjAgGrid.js
 */
$(function () {
	  'use strict';
	  var contextPath="/apt";
	  var tableData;
	  
	  $.ajax({
			url:contextPath+"/admin/adminMngcost/showMngcostOrderList.do",
			type:"get",
			dataType:"json",
			async:false,
			success:function(res){
				if(res.length>0){
					tableData=res;
				}
			},
			error:function(xhr, status, error){
				alert("error : "+error);
			}
	  });
	  
	  /*** COLUMN DEFINE ***/
	  var columnDefs = [
	    {
	      headerName:'사용년월',
	      field: 'YM',
	      editable: false,
	      sortable: true,
	      filter: true,
	      width: 200,
	      filter: true,
	      checkboxSelection: true,
	      headerCheckboxSelectionFilteredOnly: true,
	      pinned: 'left'
	    },
	    {
	      headerName: '지출총액',
	      field: 'TPRICE',
	      editable: false,
	      sortable: true,
	      filter: true,
	      width: 310
	    },
	    {
	      headerName: '청구상태',
	      field: 'ISORDER',
	      editable: false,
	      sortable: true,
	      filter: true,
	      width: 200
	    }
	  ];

	  /*** GRID OPTIONS ***/
	  var gridOptions = {
	    columnDefs: columnDefs,
	    rowSelection: 'single',
	    floatingFilter: true,
	    filter: true,
	    pagination: true,
	    paginationPageSize: 5,
	    pivotPanelShow: 'always',
	    colResizeDefault: 'shift',
	    animateRows: true,
	    resizable: true,
	   	onSelectionChanged: onSelectionChanged
	  };

	  /*** DEFINED TABLE VARIABLE ***/
	  var gridTable = document.getElementById('myGrid');

	  var assetPath = '/apt/resources/app-assets/';
	  if ($('body').attr('data-framework') === 'laravel') {
	    assetPath = $('body').attr('data-asset-path');
	  }

	  /*** GET TABLE DATA FROM URL ***/

	  agGrid.simpleHttpRequest({ url: assetPath + 'data/ag-grid-data.json' }).then(function (data) {
	    gridOptions.api.setRowData(tableData);
	  });

	  /*** FILTER TABLE ***/
	  function updateSearchQuery(val) {
	    gridOptions.api.setQuickFilter(val);
	  }

	  $('.ag-grid-filter').on('keyup', function () {
	    updateSearchQuery($(this).val());
	  });

	  /*** CHANGE DATA PER PAGE ***/
	  function changePageSize(value) {
	    gridOptions.api.paginationSetPageSize(Number(value));
	  }

	  $('.sort-dropdown .dropdown-item').on('click', function () {
	    var $this = $(this);
	    changePageSize($this.text());
	    $('.filter-btn').text('1 - ' + $this.text() + ' of 500');
	  });

	  /*** EXPORT AS CSV BTN ***/
	  $('.ag-grid-export-btn').on('click', function (params) {
	    gridOptions.api.exportDataAsCsv();
	  });

	  /*** INIT TABLE ***/
	  new agGrid.Grid(gridTable, gridOptions);
	  
	  function onSelectionChanged() {
 	  	var selectedRows = gridOptions.api.getSelectedRows();
	  	$('#startdate').val(selectedRows[0].YM);
	  	$('#isorder').val(selectedRows[0].ISORDER);
	  }
});