$.calendar = {

  mode: 'view', //can be in edit mode

  selectedDays: [],

  toggleMode: function(element) {
    if ($.calendar.mode == "view") {
      $.calendar.mode = "edit"
      $(element).text("x")
      $(element).addClass("edit_mode"); 
      $(element).removeClass("view_mode"); 
      $("#date_view_container").addClass("edit_mode")
      $("#date_view_container").removeClass("view_mode")
    } else {
      $.calendar.mode = "view"
      $(element).text("+")
      $(element).removeClass("edit_mode"); 
      $(element).addClass("view_mode"); 
      $("#date_view_container").addClass("view_mode")
      $("#date_view_container").removeClass("edit_mode")
    }
  },

  dayClicked: function(dayElement) {
    var _this = $.calendar
    var $daySquare = $(dayElement);
    // var dateStr = $daySquare.data("year") + " - " + $daySquare.data("month") + " - " + $daySquare.data("day");
    var dateStr = $daySquare.data("date");
    console.log(dateStr);
    if (_this.mode == 'edit') {
      if ($daySquare.hasClass("vacation_selected")) {
        $daySquare.removeClass("vacation_selected");
        _this.removeDayFromWantedVacationsDays(dateStr);
        $('.chosen_date_tr[data-chosen_date="' + dateStr + '"]').remove();
      } else {
        $(".chosen_dates").append('<tr class="calendar_info chosen_date_tr" data-chosen_date=' + dateStr + '><td>' + dateStr + '</td></tr>');
        $daySquare.addClass("vacation_selected");
        _this.selectedDays.push(dateStr)
      }
    }
  },

  setDisplayVacationsOnHoverState: function() {
    var inHandler = function() {
      var $td = $(".names_space td")
      $td.html($(""))
      var $day_vacation_users = $(this).find(".day_vacation_users")
      var users_in_vacation_this_day_html = $day_vacation_users.html();

      if (users_in_vacation_this_day_html != undefined) {
        $(".days_info").css("visibility", "visible");
        $td.html(users_in_vacation_this_day_html);
        $(".square_number").text($day_vacation_users.data("users_count"))
      } else {
        $(".days_info").css("visibility", "hidden");
      }
    }
    var outHandler = function() {
    }

    $(".day").hover(inHandler, outHandler)
  },


  removeDayFromWantedVacationsDays: function(dateStr) {
    var array = $.calendar.selectedDays;
    for (var i = array.length-1; i>=0; i--) {
        if (array[i] === dateStr) {
            array.splice(i, 1);
        }
    }
    return false;
  },

  showWantedVacationDays: function() {
    $.each($.calendar.selectedDays, function(i, date) {
      console.log(date);
      $('[data-date="' + date + '"]').addClass("vacation_day_selected");
    });
  },

  submitDays: function() {
    _this.selectedDays = [];
  }
}