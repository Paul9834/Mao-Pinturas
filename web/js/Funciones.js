function GenerarUser(){
    
    var Documento = document.getElementById("txtDocumento");
    var Usuario = document.getElementById("txtUsuario");
    
    Usuario.value = Documento.value+"@maopinturas.com"; 
    
    if (Documento.value.length=== 0) {
    Usuario.value="";
}
}

function alertaexito(){

 window.onload = function () {
      swal("¡Empleado Registrado! " ,  {
      icon: "success"
    }); 
    };

}