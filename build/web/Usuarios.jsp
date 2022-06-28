<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>Nuevo cliente</title>

        <!-- Normalize V8.0.1 -->
        <link rel="stylesheet" href="./css/normalize2.css">

        <!-- Bootstrap V4.3 -->
        <link rel="stylesheet" href="./css/bootstrap.min2.css">

        <!-- Bootstrap Material Design V4.0 -->
        <link rel="stylesheet" href="./css/bootstrap-material-design.min2.css">

        <!-- Font Awesome V5.9.0 -->
        <link rel="stylesheet" href="./css/all.css">

        <!-- Sweet Alerts V8.13.0 CSS file -->
        <link rel="stylesheet" href="./css/sweetalert2.min2.css">

        <!-- Sweet Alert V8.13.0 JS file-->
        <script src="./js/sweetalert2.min.js" ></script>

        <!-- jQuery Custom Content Scroller V3.1.5 -->
        <link rel="stylesheet" href="./css/jquery.mCustomScrollbar.css">

        <!-- General Styles -->
        <link rel="stylesheet" href="./css/style2.css">

    </head>
    <body>

        <!-- Page header -->
        <div class="full-box page-header">
            <h3 class="text-left">
                <i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR USUARIO
            </h3>
            <p class="text-justify">
               En el módulo USUARIO podrá registrar nuevos usuarios en el sistema ya sea un administrador o un cajero, también podrá ver la lista de usuarios registrados, buscar usuarios en el sistema, actualizar datos de otros usuarios y los suyos.
            </p>
        </div>

        <div class="container-fluid">
            <ul class="full-box list-unstyled page-nav-tabs">
                <li>
                    <a class="active" href="Registrar_Usuario.jsp"><i class="fas fa-plus fa-fw"></i> &nbsp; AGREGAR USUARIO</a>
                </li>
                <li>
                    <a href="Controlador?menu=Usuarios&accion=Listar"><i class="fas fa-clipboard-list fa-fw"></i> &nbsp; LISTA DE USUARIOS</a>
                </li>

            </ul>	
        </div>

        <!-- Content here-->
        <div class="container-fluid">
            <form action="Controlador?menu=Usuarios" method="POST" class="form-neon" autocomplete="off">
                <fieldset>
                    <legend><i class="fas fa-user"></i> &nbsp; Información básica</legend>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="cliente_dni"">DNI</label>
                                    <input  type="text" pattern="[a-zA-Z0-9-]{1,27}" class="form-control" id="cliente_dni" name="txtDni" maxlength="27" required>
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="form-group">
                                    <label for="cliente_nombre">Nombre</label>
                                    <input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,40}" class="form-control" name="txtNombre" id="cliente_nombre" maxlength="40" required>
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label for="cliente_telefono">Teléfono</label>
                                    <input type="text" pattern="[0-9()+]{1,20}" class="form-control" name="txtTelefono" id="cliente_telefono" maxlength="20" required>
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label for="cliente_apellido" >Estado</label>
                                    <input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,40}" class="form-control" name="txtEstado" id="txtEstado" maxlength="40" required>
                                </div>
                            </div>

                            <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label for="cliente_apellido" >Usuario</label>
                                    <input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,40}" class="form-control" name="txtUsuario" id="txtUsuario" maxlength="40" required>
                                </div>
                            </div>
                            <div class="col-12 col-md-4">
                                <div class="form-group">
                                    <label for="cliente_apellido" >Tipo Usuario</label>
                                    <input type="text" pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ ]{1,40}" class="form-control" name="txtTipousuario" id="txtTipousuario" maxlength="40" required>
                                </div>
                            </div>
                        </div>
                </fieldset>
                <br><br><br>
                <p class="text-center" style="margin-top: 40px;">
                    <button type="reset" class="btn btn-raised btn-secondary btn-sm"><i class="fas fa-paint-roller"></i> &nbsp; LIMPIAR</button>
                    &nbsp; &nbsp;
                    <button type="submit" class="btn btn-raised btn-info btn-sm" value="Agregar" name="accion"><i class="far fa-save"></i> &nbsp; GUARDAR</button>
                </p>
            </form>
        </div>	

</body>
</html>