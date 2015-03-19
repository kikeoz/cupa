// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs


$(document).ready(function(){

	$("#med_texto").keyup(function(e){
	  var text = $(this);
		
		if($.isNumeric(text.val())){
			$.ajax({
				url: '/medicamentos/buscar_por_clave/' + text.val(),
				type: 'GET',
				success: function(medicamentos){
					$(".medList").html("");
					$.each(medicamentos,function(index,medicamento){

						$(".medList").append(
							"<table width=100%><tr><td width=20%><b> CLAVE: </b>" + medicamento.med_id + 
							"</td><td width=60%> <b> DESCRIPCION: </b>" + medicamento.med_nombre +
							"</td><td width=20%><b> LINEA: </b>" + medicamento.med_linea + 
							"</td></tr></table><hr>")
					})
				},
				error: function(){
				}
			});
		} 
		else{

			$.ajax({
				url: '/medicamentos/buscar_por_nombre/' + text.val(),
				type: 'GET',
				success: function(medicamentos){
					$(".medList").html("");
					$.each(medicamentos,function(index,medicamento){
						$(".medList").append(
							"<table width=100%><tr><td width=20%><b> CLAVE: </b>" + medicamento.med_id + 
							"</td><td width=60%> <b> DESCRIPCION: </b>" + medicamento.med_nombre +
							"</td><td width=20%><b> LINEA: </b>" + medicamento.med_linea + 
							"</td></tr></table><hr>")
					})
				},
				error: function(){
				}
			});
		}
	  	
		
	});
});


