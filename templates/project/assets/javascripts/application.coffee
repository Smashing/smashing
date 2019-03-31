# dashing.js is located in the dashing framework
# It includes jquery & batman for you.
#= require dashing.js

#= require_directory .
#= require_tree ../../widgets

console.log("Yeah! The dashboard has started!")

Dashing.on 'ready', ->
  Dashing.widget_base_dimensions = [$(".widget").width(), $(".widget").height()];
  Dashing.widget_margins = [parseInt($(".widget").css("margin-top")), parseInt($(".widget").css("margin-left"))]
  Dashing.numColumns ||= 4
