# dashing.js is located in the dashing framework
# It includes jquery & batman for you.
#= require dashing.js

#= require_directory .
#= require_tree ../../widgets

console.log("Yeah! The dashboard has started!")

Dashing.on 'ready', ->
  set_size()
  Dashing.numColumns ||= 4

handle_resize = ->
  set_size()
  $(".rickshaw_graph svg").each (i, elem) -> elem.remove()
  for widget_type of Dashing.widgets
    for widget_name of Dashing.widgets[widget_type]
      widget = Dashing.widgets[widget_type][widget_name]
      if widget.graph != undefined
        widget.graph = undefined
        widget.ready()
  console.log("Resized widgets to " + Dashing.widget_base_dimensions + ".")

set_size = ->
   Dashing.widget_base_dimensions = [$(".widget").width(), $(".widget").height()];
   Dashing.widget_margins = [parseInt($(".widget").css("margin-top")), parseInt($(".widget").css("margin-left"))]

window.onresize = handle_resize
