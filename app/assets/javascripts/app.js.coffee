# Define App
TodoApp = angular.module("TodoApp", [])

# Define Controller
TodoApp.controller("ItemsCtrl", ["$scope", "$http", ($scope, $http) ->

  $scope.items = []

  $http.get("/items.json").success (data)->
    $scope.items = data

  $scope.addItem = ->
    console.log $scope.newItem
    $http.post("/items.json", $scope.newItem).success (data)->
      console.log "ITEM SAVED!"
      $scope.newItem = {}
      $scope.items.push(data)

  $scope.deleteItem = ->
    console.log @item
    $http.delete("/items/#{@item.id}.json").success (data)=>
      console.log "item deleted"
      $scope.items.splice(@$index,1)

])

# Define Config
TodoApp.config(["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])