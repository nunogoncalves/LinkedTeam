(function($) {
  var loading = false;

  $.vboard = {
    init: function(options) {
      var options = options || {},
          margin  = options.margin || 60,

          on   = moment(new Date()),
          from = moment(on).subtract(margin, 'd'),
          to   = moment(on).add(margin + 1, 'd'),

          $table        = $('#vboard-days-table'),
          $tableContent = $('<tr>');

      for (var date = moment(from); date.isBefore(to); date.add(1, 'd')) {
        $tableContent.append('<td>' + date.format('dd') + '</td>');
      }

      $.each($('.vboard-team-members'), function(index, element) {
        var $days = $('<tr>');

        $days.data('team-id', $(element).data('team-id'));

        for (var date = moment(from); date.isBefore(to); date.add(1, 'd')) {
          var $day = $('<td>');

          $day.text(date.format('D'))
              .data('day', date.format('D'))
              .data('month', date.format('M'))
              .data('year', date.format('YYYY'));

          $days.append($day);
        }

        $tableContent = $tableContent.add($days);
      });

      $table.append($tableContent);

      var $container = $('#vboard-table-container');

      if ($table.width() > $container.width()) {
        $container.animate({
          scrollLeft: ($table.width() - $container.width()) / 2
        }, 0);
      }

      $container.on('scroll', function() {
        var width           = $table.width() - $container.width(),
            center          = width / 2,
            leftLimit       = width * 0.2,
            rightLimit      = width * 0.8,
            currentPosition = $container.scrollLeft();

        if (currentPosition < leftLimit) {
          $.vboard.loadPage('next');
        } else if (currentPosition > rightLimit) {
          $.vboard.loadPage('prev');
        }
      });

      $('#vboard-prev-vacation').on('click', function() {
        $.vboard.jumpTo('prev');
      });

      $('#vboard-prev-vacation').on('click', function() {
        $.vboard.jumpTo('next');
      });

      $('.vboard-team-selector').on('change', function() {
        var $this = $(this);

        if ($this.prop('checked')) {
          $this.data('team-id');
          $this.data('member-id');
        } else {

        }
      });
    },

    loadPage: function(direction) {
      if (loading) {
        return;
      }

      $.ajax({
        url:      'calendars/admin/vacations',
        data:     { member_ids: [1, 2] },
        dataType: 'json'
      })
      .done(function() {
        if (direction === 'next') {
          $.each($table, function(index, element) {

          });
        } else {

        }
      });
    },

    jumpTo: function(direction) {

    }
  }
})(jQuery);