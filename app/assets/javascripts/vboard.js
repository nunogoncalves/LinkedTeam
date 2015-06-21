$.vboard = {
  init: function(options) {
    var options = options || {},
        margin  = options.margin || 2,
        on   = moment(new Date()),
        from = moment(on).subtract(margin, 'd'),
        to   = moment(on).add(margin + 1, 'd'),
        $weekdaysHtml = $('<tr>'),
        $daysHtml     = $('');

    var members = [{}, {}, {}];

    for (var date = moment(from); date.isBefore(to); date.add(1, 'd')) {
      $weekdaysHtml.append('<td>' + date.format('dd') + '</td>');
    }

    $('#vboard-days-table').append($weekdaysHtml);
  }
}