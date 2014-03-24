var express = require('express');
var app = express();
var port = 3000;

app.get('/companies', function (req, res) {
  res.send({data: 'data'});
});

app.listen(port, function () {
  console.log('Api is listening on port ' + port);
});
