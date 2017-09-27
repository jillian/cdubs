var app = window.app = {};

app.Patients = function() {
  this._input = $('#patient-search-txt');
  this._initAutocomplete();
};

app.Patients.prototype = {
  _initAutocomplete: function() {
    this._input
      .autocomplete({
        source: '/patients',
        appendTo: '#patient-search-results',
        select: $.proxy(this._select, this)
      })
      .autocomplete('instance')._renderItem = $.proxy(this._render, this);
  },

  _render: function(ul, item) {
    var markup = [
      '<span class="img">',
        '<img src="' + item.image_url + '" />',
      '</span>',
      '<span class="first_name">' + item.first_name + '</span>',
      '<span class="last_name">' + item.last_name + '</span>',
      '<span class="gender">' + item.gender + '</span>'
    ];
    return $('<li>')
      .append(markup.join(''))
      .appendTo(ul);
  },

  _select: function(e, ui) {
    this._input.val(ui.item.first_name + ' - ' + ui.item.last_name);
    return false;
  }
};