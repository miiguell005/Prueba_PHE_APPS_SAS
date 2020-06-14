
var app = angular.module('cursos', ["ngAnimate", "ngRoute", "ngResource" ])

app.config(function ($routeProvider) {

    $routeProvider
        .when('/', {
            templateUrl: 'views/persona/personas.html',
            controller: 'personasController',
            controllerAs: '$ctrl'
        })
        .when('/persona', {
            templateUrl: 'views/persona/personas.html',
            controller: 'personasController',
            controllerAs: '$ctrl'
        })
        .when('/persona/:idPersona', {
            templateUrl: 'views/persona/editarPersona.html',
            controller: 'editarPersonaController',
            controllerAs: '$ctrl'
        })
        .when('/dashboard', {
            templateUrl: 'views/dashboard/dashboard.html',
            controller: 'dashboardController',
            controllerAs: '$ctrl'
        })
        .otherwise({
            redirectTo: '/'
        });
})