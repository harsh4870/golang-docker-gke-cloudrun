'use strict';
const os = require('os');
const express = require('express');

const PORT = 3000;
const HOST = '0.0.0.0';

const app = express();
app.get('/', (req, res) => {
  var hostname = os.hostname();
  res.send({Message: 'Hello World...!', Version: '1.0.2', Hostname: hostname});
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
