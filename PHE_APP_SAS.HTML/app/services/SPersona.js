angular.module('cursos')
    .factory('SPersona', SPersona);

function SPersona($resource, userService) {
    var urlService = userService.urlService;

    return $resource(urlService + "api/Persona/:idPersona", { idPersona: "@IdPersona" },
        {
            query: {
                method: 'GET', url: urlService + "api/Persona", isArray: true
            },
            getPersona: {
                method: 'GET', url: urlService + "api/Persona/:idPersona", params: { idPersona: "@IdPersona" }, isArray: false
            },
            post: {
                method: 'POST', url: urlService + "api/Persona", isArray: false
            },
            put: {
                method: 'PUT', url: urlService + "api/Persona/:idPersona", params: { idPersona: "@IdPersona" }, isArray: false
            },
            remove: {
                method: 'Delete', url: urlService + "api/Persona/:idPersona", params: { idPersona: "@IdPersona" }, isArray: false
            },
        });
}
