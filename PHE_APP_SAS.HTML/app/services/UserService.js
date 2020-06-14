angular.module('cursos')

    .service('userService', function ($rootScope) {

        var vm = this;

        //Contiene la tura relativa de la aplicación
        this.urlService = "http://localhost:50384/";
        
    });
