$( document ).ready(function() {

  var tmp   =  window.location.href;
  var match = /(\d+)$/.exec(tmp);
  var current_page  = match ? RegExp.$1 : 1;
  var next_page     = parseInt(current_page)+1;
  var previous_page = current_page == 1 ? 1 : parseInt(current_page)-1;
  var max_pages = '';

  console.log('loading page: ' + current_page);

  $.ajax({
    url: '/players/info',
    type: 'GET',
    success: function(ret) {
      console.log("Max pages: " + ret.max_pages);
      max_pages = ret.max_pages
      $('#page_info').append(ret.max_pages);
    },
    error: function (jqXHR, textStatus, errorThrown)  {
       console.log("Couldn't get page info; error = " + errorThrown);
    }
  });


  $('#page_info').html("Page " + current_page + " of ");

  $('#table_players').DataTable({
    "order": [[ 4, "desc" ]],
    "scrollX": true,
    "paging": false,
    "iDisplayLength": 25,
    // "processing": true,  // not working for some reason...
    // "serverSide": true,
    // "ajax": "/players"
  });

  $('#show_next').on('click', function() {
    if ( current_page == max_pages ) {
      return false;
    }
    window.location.href = "/players?page=" + next_page;
  });

  $('#show_previous').on('click', function() {
    if ( current_page == 1 ) {
      return false;
    }
    window.location.href = "/players?page=" + previous_page;
  });


});