$.calendar = {

  mode: 'view', //can be in edit mode

  selectedDays: [],

  toggleMode: function(element) {
    if ($.calendar.mode == "view") {
      $.calendar.mode = "edit"
      $(element).text("Edit")
    } else {
      $.calendar.mode = "view"
      $(element).text("View")
    }
  },

  dayClicked: function(dayElement) {
    var _this = $.calendar
    var $daySquare = $(dayElement);
    var dateStr = $daySquare.data("year") + " - " + $daySquare.data("month") + " - " + $daySquare.data("day");

    if (_this.mode == 'view') {
      _this.showDayDetails($daySquare);
    } else {
      if ($daySquare.hasClass("vacation_day_selected")) {
        $daySquare.removeClass("vacation_day_selected");
        _this.removeDayFromWantedVacationsDays(dateStr);
      } else {
        $daySquare.addClass("vacation_day_selected");
        _this.selectedDays.push(dateStr)
      }
    }
  },

  showDayDetails: function($daySquare) {
    var title = $daySquare.text() + " de " + $daySquare.closest("div.month").find(".month_name").text();
    $('#modal-1').find("h3").text(title);
    $('#modal-1').addClass('md-show');
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