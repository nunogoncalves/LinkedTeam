$.calendar = {

  mode: 'view', //can be in edit mode

  selectedDays: [],

  toggleMode: function(element) {
    if ($.calendar.mode == "view") {
      $.calendar._putInEditMode(element);
    } else {
      $.calendar._putInViewMode(element);
    }
  },

  _putInEditMode: function(element) {
    $.calendar.mode = "edit"
    $(element).text("x").addClass("edit_mode").removeClass("view_mode");
    $("#date_view_container").addClass("edit_mode").removeClass("view_mode");
    $('.vacations_sub').prop('hidden', false);
  },

  _putInViewMode: function(element) {
    $.calendar.mode = "view"
    $(element).text("+").removeClass("edit_mode").addClass("view_mode");
    $("#date_view_container").addClass("view_mode").removeClass("edit_mode")
    $('.vacations_sub').prop('hidden', true);
  },

  dayClicked: function(dayElement) {
    var _this = $.calendar
    var $daySquare = $(dayElement);
    var dateStr = $daySquare.data("date");
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

  setVacationsOnHoverEvent: function() {
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
    var outHandler = function() {}

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
      $('[data-date="' + date + '"]').addClass("vacation_day_selected");
    });
  },

  refreshDaysWithUsers: function($days) {
    $.each($days, function(index, selectedDay) {
      var $vacations_of_day_container = $(selectedDay).find(".vacations_of_day_container");
      var date = $(selectedDay).data("date");
      $.ajax({
        url: "/calendars/vacations?q[date_eq=" + date + "]",
        success: function(data) {
          $vacations_of_day_container.html('<div class="day_vacation_users" style="display: none" data-users_count=" ' + data.vacations.length + '"></div>')
          $.each(data.vacations, function(index, vacation) {
            var $day_vacation_users = $vacations_of_day_container.find(".day_vacation_users")
            $day_vacation_users.append("<div class='member_name'>" + vacation.user_name + "</div>")
          });
        }
      });
    });
  },

  submitVacationsSuccess: function() {
    $.calendar.toggleMode();
    //remove selected style and add user to vacations days
    var $selectedElements = $(".vacation_selected").removeClass("vacation_selected");

    $.each($selectedElements, function(index, selectedDay) {
      $(selectedDay).addClass("with_events")
    });

    $.calendar.refreshDaysWithUsers($selectedElements);

    $.calendar.selectedDays = [];
    $(".chosen_dates").html("");
  },

  submitVacations: function() {
    $.ajax({
      method: "POST",
      url: "calendars/vacations",
      data: {
        vacations: $.calendar.selectedDays
      },
      success: $.calendar.submitVacationsSuccess,
      error: function() {
        console.log("error");
      }
    });
  }
}