(function($) {
  'use strict';

  if (window.Vboard !== undefined) { return; }

  window.Vboard = function(element) {
    this.element = element;
  }

  var VboardFunctions = {
    init: function(options) {

    },
  };

  $.extend(window.Vboard.prototype, VboardFunctions);

  $.fn.vboard = function(options) {
    if (this.length == 0) { return this; }

    return this.each(function() {
      new window.Vboard(this).init(options);
    });
  };
})(jQuery);