$(document).ready(function () {
    $('a.colorbox').colorbox({ opacity:0.85 , rel:'group1' });
});
var asInitVals = new Array();

$(document).ready(function() {
    $('#hotnewss').dataTable({
        "bJQueryUI": true,
        "sScrollY": 300,
        "sPaginationType": "full_numbers",
        "aoColumns": [{"sWidth":"4%"},null,{"sWidth":"6%"},{"sWidth":"11.6%"}],
        "aoColumnDefs": [{ "bSortable": false, "aTargets": [3] }],
        "oLanguage": {
			"sLengthMenu": "_MENU_ Records per page",
			"sSearch": "Search all columns:"
		}
    });
    $('#datatables-user').dataTable({
        "bJQueryUI": true,
        "sPaginationType": "full_numbers",
        "aoColumnDefs": [{ "bSortable": false, "aTargets": [4] }],
        "aoColumns": [null,null,{"sWidth":"6%"},{"sWidth":"12%"},{"sWidth":"11%"}],
        "oLanguage": {
			"sLengthMenu": "_MENU_ Records per page",
			"sSearch": "Search all columns:"
		}
    });
    $('#datatables-newss').dataTable({
        "bJQueryUI": true,
        "sPaginationType": "full_numbers",
        "aoColumnDefs": [{ "bSortable": false, "aTargets": [6] }],
        "aoColumns": [{"sWidth":"15%"},null,{"sWidth":"10%"},{"sWidth":"16%"},{"sWidth":"10%"},{"sWidth":"12%"},{"sWidth":"11%"}],
        "oLanguage": {
			"sLengthMenu": "_MENU_ Records per page",
			"sSearch": "Search all columns:"
		}
    });
    $('#tagging').dataTable({
        "bJQueryUI": true,
        "sPaginationType": "full_numbers",
        "aoColumnDefs": [{ "bSortable": false, "aTargets": [5] }],
        "aoColumns": [{"sWidth":"15%"},null,{"sWidth":"10%"},{"sWidth":"16%"},{"sWidth":"12%"},{"sWidth":"11%"}],
        "oLanguage": {
			"sLengthMenu": "_MENU_ Records per page",
			"sSearch": "Search all columns:"
		}
    });

    var oTable = $('#datatables-checkread').dataTable( {
		"bJQueryUI": true,
        "sPaginationType": "full_numbers",
		// "aoColumns": [{"sWidth":"15%"},null,{"sWidth":"10%"},{"sWidth":"16%"},{"sWidth":"10%"},{"sWidth":"12%"},{"sWidth":"11%"}],
		"oLanguage": {
			"sLengthMenu": "_MENU_ Records per page",
			"sSearch": "Search all columns:"
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