// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require best_in_place
//= require jquery.purr
//= require best_in_place.purr
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var blocmetrics = function(name, location, property_1, property_2){
  var _bm_event = {
    name: name,
    location: location,
    property_1: property_1,
    property_2: property_2
  }

  var _bm_request = $.ajax({
    url: "http://localhost:3000/events.json",
    crossDomain: true,
    xhrFields: {
      withCredentials: true
    },
    method: "post",
    data: {event: _bm_event}
  })
}

//Example function, where property_1 is 'referer URL' and property_2 is 'user email address' 

// $(document).ready(function(){
//   var referrer = document.referrer
//   var user_email = <%= current_user.email %>;
//   blocmetrics('page_view', window.location.origin, referrer, user_email)
// })

//     $("a.trackable").click(function(){
//             alert( "test" );
//             sendTrackableEvent('click', $(this).data("track"), referrer, user_email);
//         }
//     )
// })

// <%= link_to "Link Name", link_path, class: "trackable", "data-track" => "whatever-you-want-to-identify-link" %>


// $(document).ready(function() {
//      var topic_id = <%= @topic.id %>;
//      var user_email = <%= current_user.email %>;
//      blocmetrics.track('topic_view', topic_id, user_email);
// });

// $(document).ready(function(){
//     blocmetrics('Page View', "www.bookmarkme.co/topics", "<%= current_user.email %>")
// });

// console.log(blocmetrics);


// blocmetrics.track('Page View', page_id, current_user.email)

// var blocmetrics = (function () {
//     var submitted = {};
//     _bm_event = {};

//     submitted.track = function(name, arg_1, arg_2) {
//             _bm_event.name = name;
//             var page_id = <%= @topic.id %>;
//             var user_email = <%= current_user.email %>;
//     };

//     function _send_data() {
//         _bm_request = new XMLHttpRequest();
//         _bm_request.open("POST", "http://localhost:3000/events.json", true);
//         _bm_request.setRequestHeader('Content-Type', 'application/json');
//         _bm_request.onreadystatechange = function () {

// // don't do anything here, we don't want to interfere with the behavior of the host site

//         };

//         _bm_request.send(JSON.stringify(_bm_event));

//     };

//     return submitted;

// })();

