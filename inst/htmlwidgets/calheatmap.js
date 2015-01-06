HTMLWidgets.widget({

  name: 'calheatmap',

  type: 'output',

  initialize: function(el, width, height) {
    var instance = new CalHeatMap()
    return instance

  },

  renderValue: function(el, x, instance) {

    x.itemSelector = '#' + el.id
    if (x.start){
      x.start = new Date(x.start)
    }
    instance.init(x);

  },

  resize: function(el, width, height, instance) {

  }

});
