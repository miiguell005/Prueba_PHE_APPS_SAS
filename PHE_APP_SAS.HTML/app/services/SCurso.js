angular.module('cursos')
    .factory('SCurso', SCurso);

function SCurso($resource, userService) {
    var urlService = userService.urlService;

    return $resource(urlService + "api/Cursos/:idCurso", { idCurso: "@IdCurso" },
        {
            query: {
                method: 'GET', url: urlService + "api/Cursos", isArray: true
            },
            getCurso: {
                method: 'GET', url: urlService + "api/Cursos/:idCurso", params: { idCurso: "@IdCurso" }, isArray: false
            },
            getCarreras: {
                method: 'GET', url: urlService + "api/Cursos/Carreras", isArray: true
            },
            getRangoEdades: {
                method: 'GET', url: urlService + "api/Cursos/Tango/Edades", isArray: true
            },
            getClasificacionGenero: {
                method: 'GET', url: urlService + "api/Cursos/clasificacion/genero", isArray: true
            },
        });
}
