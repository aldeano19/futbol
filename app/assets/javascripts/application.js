// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks

//= require jquery3
//= require popper
//= require bootstrap

//= require_tree .

//
// $('document').ready(function(){
//
//     $("tr").click(function() {
//         window.location = $(this).data("link")
//     })
// });


var foo = function () {
    console.log("foo");
}

var bar = function (p1) {
    console.log(p1);
}


var add_player = function(team_id, user_id, auth_token){
    var payload = {"id": team_id, "user_id" : user_id, "authenticity_token" : auth_token};
    $.post("/add_player", payload, function (data, status) {
        console.log("DONE!");
    }).fail(function() {
        console.log("ERROR!");
        alert("Error!")
    });

}
