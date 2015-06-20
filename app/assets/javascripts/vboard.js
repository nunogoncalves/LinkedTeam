(function($) {
  'use strict';

  if (window.Vboard !== undefined) { return; }

  window.Vboard = function(element, options) {
    this.$element = $(element);
    this.groups   = options.groups || {};
  };

  var VboardFunctions = {
    init: function() {
    }
  };

  $.extend(window.Vboard.prototype, VboardFunctions);

  $.fn.vboard = function(options) {
    if (this.length == 0) { return this; }

    return this.each(function() {
      new window.Vboard(this, options).init();
    });
  };
})(jQuery);