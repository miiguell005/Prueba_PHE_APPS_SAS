
angular.module('cursos')
    .controller('personasController', function ($window, userService, SCurso, SPersona) {


        var vm = this;

        //Contiene la lista de personas
        vm.personas = [];
        vm.cursos = [];

        vm.init = function () {
            SCurso.query({}, function (dataCursos) {

                vm.cursos = _.indexBy(dataCursos, 'IdCurso');;
                console.log(vm.cursos );

                SPersona.query({}, function (dataPersonas) {

                    vm.personas = dataPersonas;

                }, function (error) {
                    vm.manejarExcepciones(error);
                });
            }, function (error) {
                vm.manejarExcepciones(error);
            });
        }

        /**
         * Permite eliminar una persona
         */
        vm.eliminarPersona = function (persona) {

            bootbox.confirm({
                message: "Está seguro que desea eliminar a '" + persona.Nombre + "'",
                buttons: {
                    confirm: {
                        label: 'Confirmar',
                        className: 'btn-success'
                    },
                    cancel: {
                        label: 'Cancelar',
                        className: 'btn-danger'
                    }
                },
                callback: function (result) {

                    if (result) {

                        SPersona.remove({ IdPersona: persona.IdPersona }, function (dataPersona) {

                            //Descarta el usuario eliminado
                            persona.Eliminado = true;

                            toastr.success("Se ha eliminado la persona");

                            //Actualiza la lista en el html
                            $scope.$apply();

                        }, function (error) {
                            vm.manejarExcepciones(error);
                        })
                    }
                }
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