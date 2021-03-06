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
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require Chart.bundle
//= require chartkick

jQuery(document).on('turbolinks:load', function() {

  $('.carousel').carousel({
             interval: 3000
         });
         

  $("#table-option").click(function(){
    $("#events-table").show();
    $("#events-pie-chart").hide();
    $("#events-line-chart").hide();
});

  $("#chart-option").click(function(){
    $("#events-table").hide();
    $("#events-pie-chart").show();
    $("#events-line-chart").hide();
});

  $("#graph-option").click(function(){
    $("#events-table").hide();
    $("#events-pie-chart").hide();
    $("#events-line-chart").show();
});

    $("#events-table").show();
    $("#events-pie-chart").hide();
    $("#events-line-chart").hide();

});

/*var blocmetrics = {};
blocmetrics.report = function(eventName){
    var event = {event: { name: eventName }};
    var request = new XMLHttpRequest();
    request.open("POST", "https://ez-events-darylmcc.c9users.io/api/events", true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
};*/

//= require_tree .