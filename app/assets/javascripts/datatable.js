$(document).ready(function () {
    $('a.colorbox').colorbox({ opacity:0.85 , rel:'group1' });
});
var asInitVals = new Array();

$(document).ready(function() {
    $('#dataTable-hotnews').dataTable({
        "bJQueryUI": true,
        "sScrollY": 400,
        "iDisplayLength": 15,
        "sPaginationType": "full_numbers",
        "aoColumns": [{"sWidth":"4%"},null,{"sWidth":"6%"},{"sWidth":"12%"}],
        "aoColumnDefs": [{ "bSortable": false, "aTargets": [3] }],
        "oLanguage": {
			"sLengthMenu": "_MENU_ จำนวนข้อมูลต่อหน้า",
			"sSearch": "ค้นหา:",
            "sInfo": "กำลังแสดง _START_ ถึง _END_ จาก _TOTAL_ ระเบียน",
            "sInfoEmpty": "กำลังแสดง 0 ถึง 0 จาก 0 ระเบียน",
            "sZeroRecords": "ไม่พบข้อมูล",
            "oPaginate": {
                "sFirst": "หน้าแรก",
                "sNext": "หน้าถัดไป",
                "sLast": "หน้าสุดท้าย",
                "sPrevious": "หน้าก่อนหน้า"
            }
		}
    });
    $('#datatables-users').dataTable({
        "bJQueryUI": true,
        "sScrollY": 400,
        "sPaginationType": "full_numbers",
        "aoColumnDefs": [{ "bSortable": false, "aTargets": [5] }],
        "aoColumns": [null,null,{"sWidth":"3%"},{"sWidth":"6%"},{"sWidth":"12%"},{"sWidth":"11%"}],
        "oLanguage": {
            "sLengthMenu": "_MENU_ จำนวนข้อมูลต่อหน้า",
            "sSearch": "ค้นหา:",
            "sInfo": "กำลังแสดง _START_ ถึง _END_ จาก _TOTAL_ ระเบียน",
            "sInfoEmpty": "กำลังแสดง 0 ถึง 0 จาก 0 ระเบียน",
            "sZeroRecords": "ไม่พบข้อมูล",
            "oPaginate": {
                "sFirst": "หน้าแรก",
                "sNext": "หน้าถัดไป",
                "sLast": "หน้าสุดท้าย",
                "sPrevious": "หน้าก่อนหน้า"
            }
        }
    });
    $('#datatables-news').dataTable({
        "bJQueryUI": true,
        "sScrollY": 400,
        "iDisplayLength": 15,
        "sPaginationType": "full_numbers",
        "aoColumnDefs": [{ "bSortable": false, "aTargets": [6] }],
        "aoColumns": [{"sWidth":"15%"},null,{"sWidth":"10%"},{"sWidth":"16%"},{"sWidth":"10%"},{"sWidth":"12%"},{"sWidth":"11%"}],
        "oLanguage": {
            "sLengthMenu": "_MENU_ จำนวนข้อมูลต่อหน้า",
            "sSearch": "ค้นหา:",
            "sInfo": "กำลังแสดง _START_ ถึง _END_ จาก _TOTAL_ ระเบียน",
            "sInfoEmpty": "กำลังแสดง 0 ถึง 0 จาก 0 ระเบียน",
            "sZeroRecords": "ไม่พบข้อมูล",
            "oPaginate": {
                "sFirst": "หน้าแรก",
                "sNext": "หน้าถัดไป",
                "sLast": "หน้าสุดท้าย",
                "sPrevious": "หน้าก่อนหน้า"
            }
        }
    });
    $('#tagging').dataTable({
        "bJQueryUI": true,
        "sPaginationType": "full_numbers",
        "aoColumnDefs": [{ "bSortable": false, "aTargets": [5] }],
        "aoColumns": [{"sWidth":"15%"},null,{"sWidth":"10%"},{"sWidth":"16%"},{"sWidth":"12%"},{"sWidth":"11%"}],
        "oLanguage": {
            "sLengthMenu": "_MENU_ จำนวนข้อมูลต่อหน้า",
            "sSearch": "ค้นหา:",
            "sInfo": "กำลังแสดง _START_ ถึง _END_ จาก _TOTAL_ ระเบียน",
            "sInfoEmpty": "กำลังแสดง 0 ถึง 0 จาก 0 ระเบียน",
            "sZeroRecords": "ไม่พบข้อมูล",
            "oPaginate": {
                "sFirst": "หน้าแรก",
                "sNext": "หน้าถัดไป",
                "sLast": "หน้าสุดท้าย",
                "sPrevious": "หน้าก่อนหน้า"
            }
        }
    });

    var oTable = $('#datatables-checkreads').dataTable( {
		"bJQueryUI": true,
        "sScrollY": 200,
        "iDisplayLength": 10,
        "sPaginationType": "full_numbers",
		// "aoColumns": [{"sWidth":"15%"},null,{"sWidth":"10%"},{"sWidth":"16%"},{"sWidth":"10%"},{"sWidth":"12%"},{"sWidth":"11%"}],
		"oLanguage": {
            "sLengthMenu": "_MENU_ จำนวนข้อมูลต่อหน้า",
            "sSearch": "ค้นหา:",
            "sInfo": "กำลังแสดง _START_ ถึง _END_ จาก _TOTAL_ ระเบียน",
            "sInfoEmpty": "กำลังแสดง 0 ถึง 0 จาก 0 ระเบียน",
            "sZeroRecords": "ไม่พบข้อมูล",
            "oPaginate": {
                "sFirst": "หน้าแรก",
                "sNext": "หน้าถัดไป",
                "sLast": "หน้าสุดท้าย",
                "sPrevious": "หน้าก่อนหน้า"
            }
        }
	} );
    var oTables = $('#datatables-checkunreads').dataTable( {
        "bJQueryUI": true,
        "sScrollY": 200,
        "iDisplayLength": 10,
        "sPaginationType": "full_numbers",
        // "aoColumns": [{"sWidth":"15%"},null,{"sWidth":"10%"},{"sWidth":"16%"},{"sWidth":"10%"},{"sWidth":"12%"},{"sWidth":"11%"}],
        "oLanguage": {
            "sLengthMenu": "_MENU_ จำนวนข้อมูลต่อหน้า",
            "sSearch": "ค้นหา:",
            "sInfo": "กำลังแสดง _START_ ถึง _END_ จาก _TOTAL_ ระเบียน",
            "sInfoEmpty": "กำลังแสดง 0 ถึง 0 จาก 0 ระเบียน",
            "sZeroRecords": "ไม่พบข้อมูล",
            "oPaginate": {
                "sFirst": "หน้าแรก",
                "sNext": "หน้าถัดไป",
                "sLast": "หน้าสุดท้าย",
                "sPrevious": "หน้าก่อนหน้า"
            }
        }
    } );
	$("tfoot input").keyup( function () {
					/* Filter on the column (the index) of this element */
					oTable.fnFilter( this.value, $("tfoot input").index(this) );
				} );

				$("tfoot input").each( function (i) {
					asInitVals[i] = this.value;
				} );
				
				$("tfoot input").focus( function () {
					if ( this.className == "search_init" )
					{
						this.className = "";
						this.value = "";
					}
				} );
				
				$("tfoot input").blur( function (i) {
					if ( this.value == "" )
					{
						this.className = "search_init";
						this.value = asInitVals[$("tfoot input").index(this)];
					}
	} );
} );

$(document).ready(function() {
    'use strict';
    var result = $('#result'),
        load = function (e) {
            e = e.originalEvent;
            e.preventDefault();
            window.loadImage(
                (e.dataTransfer || e.target).files[0],
                function (img) {
                    result.children().replaceWith(img);
                },
                {
                    maxWidth: 200,
                    maxHeight: 200,
                    canvas: true
                }
            );
        };
    $(document).on('dragover', function (e) {
            e = e.originalEvent;
            e.preventDefault();
            e.dataTransfer.dropEffect = 'copy';
        })
        .on('drop', load);
    $('#file-input').on('change', load);
});

