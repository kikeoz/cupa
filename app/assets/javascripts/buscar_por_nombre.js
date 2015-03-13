function buscarPorNombre(){
   $("#boton_buscar").click(function(){
     var med_texto = $("#med_nombre").val();
         $.ajax({
            url: "/medicamentos/buscar_por_nombre/" + med_texto,
            dataType: "JSON",
            timeout: 10000,
            beforeSend: function(){
               $("#respuesta").html("Cargando...");
            },
            error: function(){
               $("#respuesta").html("Error al intentar buscar la clave. Por favor intente más tarde.");
            },
            success: function(res){
               if(res){
                  $("#respuesta").html('<a href="/medicamentos/'+res.med_id+'"> '+res.med_nombre+' ' + res.med_linea + ' </a>');
               }else{
                  $("#respuesta").html("La clave no se encuentra.");
               }
            }
         })

  });
};
$(document).ready(function(){
   buscarPorNombre();
});

$("body").on("click touch","#boton_buscar",function(){
  alert("#q23");
});