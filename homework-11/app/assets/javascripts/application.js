// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
var i = 0
$(document).on("page:change",function(){ 
  if( /movies\/\d+\/edit/.test( location.href) || /movies\/new/.test( location.href) || /serials\/\d+\/edit/.test( location.href) || /serials\/new/.test( location.href) ){
    for (; i < document.getElementsByTagName('input').length; i++) {
      if (document.getElementsByTagName('input')[i].type == "button") break;
    }

    if (document.getElementsByTagName('select').length == 1){
      document.getElementsByTagName('input')[i].disabled = true;
    } 
  }
})

function delete_select(num_el){
  var div = document.getElementById("selects"+num_el);
  div.parentNode.removeChild(div);
    
  if (document.getElementsByTagName('select').length == 1){
    document.getElementsByTagName('input')[i].disabled = true;
  }
}

function create_select(){  
  var count = document.getElementsByTagName('select').length+1
  document.getElementsByTagName('input')[i].disabled = false;
  var button_destroy = document.getElementsByTagName('input')[i];
  var select = document.getElementsByTagName('select')[0];
  var div = document.getElementById('add_select')     

  var new_div = document.createElement('div')
  var new_select = select.cloneNode(true)
  var new_button_destroy = button_destroy.cloneNode(true)

  new_div.id = "selects"+count
  if (/movies+/.test( location.href)){
    new_select.name = "movie_genre[genre"+count+"_id]"
    new_select.id = "movie_genre_genre"+count+"_id"
  }

  if (/serials+/.test( location.href)){
    new_select.name = "serial_genre[genre"+count+"_id]"
    new_select.id = "serial_genre_genre"+count+"_id"
  }

  new_button_destroy.id = "del_select"+count
  new_button_destroy.setAttribute('onclick', 'delete_select('+count+')');

  div.appendChild(new_div)
  new_div.appendChild(new_select)
  new_div.appendChild(new_button_destroy)
}

