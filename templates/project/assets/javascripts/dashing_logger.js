(function(){

    var clog = console.log.bind(console);

    console.log = function(message){

      if(message == 'Connection error') {
        document.getElementById("connection_error").style.display = "flex";
      }

      if(message == 'Connection opened') {
        document.getElementById("connection_error").style.display = "none";
      }

      clog(message)
    }

})();