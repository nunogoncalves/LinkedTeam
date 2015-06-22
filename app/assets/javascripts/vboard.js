'use strict'

$.vboard = {
  init: function(options) {
    var options = options || {},
        margin  = options.margin || 30,

        on   = moment(new Date()),
        from = moment(on).subtract(margin, 'd'),
        to   = moment(on).add(margin + 1, 'd'),

        $tableContent = $('<tr>');

    for (var date = moment(from); date.isBefore(to); date.add(1, 'd')) {
      $tableContent.append('<td>' + date.format('dd') + '</td>');
    }

    $.each($('.vboard-team-members'), function(index, $element) {
      var $days = $('<tr>');

      for (var date = moment(from); date.isBefore(to); date.add(1, 'd')) {
        $days.append('<td>' + date.format('D') + '</td>');
      }

      $tableContent = $tableContent.add($days);
    });

    $('#vboard-days-table').append($tableContent);

    var $container = $('#vboard-table-container');

    $container.animate({
      scrollLeft: $container.offset().left
    }, 0);

    $('#vboard-prev-vacation').on('click', function() {
      $.vboard.jumpTo('prev');
    });

    $('#vboard-prev-vacation').on('click', function() {
      $.vboard.jumpTo('next');
    });
  },

  jumpTo: function() {

  }
}