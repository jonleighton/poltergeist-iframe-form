var page = require("webpage").create()

page.open("http://127.0.0.1:9393/a", function(status) {
  page.switchToFrame('b_frame')
  page.switchToFrame('c_frame')

  page.evaluate(function() {
    field = document.getElementById('c_field');
    field.focus();
    field.select();
  })

  page.sendEvent('keypress', "omg")

  console.log(page.evaluate(function() { return field.value }))

  phantom.exit()
})
