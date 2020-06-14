
angular.module('cursos')
    .controller('editarPersonaController', function ($window, $routeParams, userService, SCurso, SPersona) {


        var vm = this;

        //Contiene el título de la página 
        vm.titulo = "Crear persona";

        vm.genero = ["Masculino", "Femenino", "Otro"];

        //Contiene la lista de cursos
        vm.cursos = [];

        //Contiene la información de la parsona
        vm.persona = { IdPersona: 0, CursoPersona: [] };

        vm.init = function () {

            SCurso.query({}, function (dataCursos) {

                vm.cursos = dataCursos

                //Si es para editar una persona
                if ($routeParams.idPersona != "0") {

                    SPersona.getPersona({ IdPersona: $routeParams.idPersona }, function (dataPersona) {

                        vm.titulo = "Editar persona";
                        vm.persona = dataPersona;
                        vm.persona.FechaNacimiento = new Date(vm.persona.FechaNacimiento);

                        vm.actualizarCursos();

                    }, function (error) {
                        vm.manejarExcepciones(error);
                    });
                }


            }, function (error) {
                vm.manejarExcepciones(error);
            });


        }

        vm.actualizarCursos = function () {
            _.each(vm.persona.CursoPersona, function (cp) {
                vm.cursoSeleccionado(cp);
            });
        }

        /**
         * Asocua el curso con la persona
         * @param {any} cp
         */
        vm.cursoSeleccionado = function (cp) {
            cp.cursos = _.find(vm.cursos, function (c) { return c.IdCurso == cp.IdCurso; });
        }


        /**
         * Agrega un nuevo curso a la persona
         */
        vm.agregarCurso = function () {

            var personaCurso = {
                IdPersona: vm.persona.IdPersona,
                DictaCurso: false,
                guid: _.uniqueId('id_')
            };

            vm.persona.CursoPersona.push(personaCurso);
        }

        /**
         * Marca como eliminado el curso para luego enviarlo a la base de datos y eliminarlo
         * @param {any} cp
         */
        vm.eliminarCurso = function (cp) {
            cp.Eliminado = true;
        }


        /**
         * Guardar usuario
         */
        vm.guardar = function () {

            vm.guardarOprimido = true;

            //Valida los datos de la persona
            if (!vm.persona.Apellido || !vm.persona.Genero || !vm.persona.Hobbies || !vm.persona.LugarNacimiento
                || !vm.persona.LugarResidencia || !vm.persona.Nombre)
                return;

            //Valida que no haya curso sin seleccionar
            if (_.find(vm.persona.CursoPersona, function (cp) { return !cp.IdCurso && !cp.Eliminado; }))
                return;

            //Quita los cursos que estan eliminados y no existen en la base de datos
            vm.persona.CursoPersona = _.filter(vm.persona.CursoPersona, function (cp) {
                if (!cp.IdCursoPersona && !cp.Eliminado || cp.IdCursoPersona)
                    return true;
            })

            SPersona.post({}, vm.persona, function (dataPersona) {

                //Actualiza los datos del usuario
                vm.titulo = "Editar persona";
                vm.persona = dataPersona;
                toastr.success(!vm.persona.IdPersona ? "La persona ha sido creado exitosamente" : "La persona ha sido editada exitosamente");
                vm.actualizarCursos();

            }, function (error) {
                vm.manejarExcepciones(error)
            });
        }

        /**
         * Controla el mensaje de error
         * @param {any} error
         */
        vm.manejarExcepciones = function (error) {

            if (error && error.data.error)
                toastr.error(error.data.error);

            else
                toastr.error(error.toString());

            console.log("Error", error);
        }

        vm.irAtras = function () {
            $window.history.back();
        }

        vm.init();
    });