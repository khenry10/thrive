"use strict";

(function(){
  angular
  .module("list", [
    "ui.router",
    "ngResource"
  ])
  .config([
    "$stateProvider",
    routerFunction
  ]);

function routerFunction($stateProvider){
  $stateProvider
  .state("listIndex", {
    url: "/angular",
    template: "<h1> Anuglar </h1>"
    // templateUrl: "/ngviews/list.index.html"
  })
};

})();
