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


// $(document).ready(function () {
//     $("#assists-editable").click(function () {
//         console.log($(this).text());
//     });
// })



var editNumber = function () {
};
$(document).mouseup(function(e) {
    var container = $("#stats-row");
    var goalsTotal = document.getElementById("goals-editable").value;
    var statsTotal = document.getElementById("assists-editable").value;

    // if the target of the click isn't the container nor a descendant of the container
    if (!container.is(e.target) && container.has(e.target).length === 0) {

        playerId = container.attr("player-id");
        gameId = container.attr("game-id");
        auth_token = container.attr("auth-token");

        var payload = {user_id: playerId, game_id: gameId, total: goalsTotal, stat_type: "goal",
            "authenticity_token" : auth_token};

        $.post("/statistics", payload, function (data, status) {
            console.log("DONE!");
        }).fail(function() {
            console.log("ERROR!");
        });

        var payload = {
            statistic: {player: playerId, game: gameId, total: statsTotal, stat_type: "assist"},
            "authenticity_token" : auth_token};

        $.post("/statistics", payload, function (data, status) {
            console.log("DONE!");
        }).fail(function() {
            console.log("ERROR!");
        });
    }
});

var add_player = function(team_id, user_id, auth_token){
    var payload = {"id": team_id, "user_id" : user_id, "authenticity_token" : auth_token};
    $.post("/add_player", payload, function (data, status) {
        console.log("DONE!");
    }).fail(function() {
        console.log("ERROR!");
        alert("Error!")
    });

}
