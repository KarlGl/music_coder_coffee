// TODO:
// Fuck this off. 14/4

var http = require('http'),
  url = require('url'),
  path = require('path'),
  fs = require('fs');
var mimeTypes = {
  "html": "text/html",
  "jpeg": "image/jpeg",
  "jpg": "image/jpeg",
  "png": "image/png",
  "js": "text/javascript",
  "css": "text/css"
};

http.createServer(function(req, res) {

  var download = function(url, dest, cb) {
    var file = fs.createWriteStream(dest);
    http.get(url, function(response) {
      response.pipe(file);
      file.on('finish', function() {
        file.close();
        cb(ext);
      });
    });
  };


  var normal = function(ext) {

    var uri = url.parse(req.url).pathname;
    console.log("uri " + uri);
    if (uri === "/")
      uri = "/index.html";
    var filename = path.join(process.cwd(), unescape(uri));
    var stats;

    try {
      stats = fs.lstatSync(filename); // throws if path doesn't exist
    } catch (e) {
      console.log("does not exits!! " + uri);
      res.end();
      return;
    }

    if (stats.isFile()) {
      // path exists, is a file
      var mimeType = mimeTypes[path.extname(filename).split(".")[1]];
      res.writeHead(200, {
        'Content-Type': mimeType
      });

      console.log("filename is " + filename);
      if (filename.split('/')[filename.split('/').length - 1] === "index.html") {
        res.write('<html><head></head><body><script>window.fileExt = "' + ext + '";</script>');
        res.write('<script type="text/javascript">\
          makeContext = function() {return new webkitAudioContext();}\
          </script>\
          <script type="text/javascript" src="lib/context.js"></script>\
          <script type="text/javascript" src="lib/image_parser.js"></script>\
          <script type="text/javascript" src="lib/image_creator.js"></script>\
          <script type="text/javascript" src="lib/sound_creator.js"></script>\
          <script type="text/javascript" src="lib/image_datum.js"></script>\
          <script type="text/javascript" src="lib/wave.js"></script>\
          <script type="text/javascript" src="lib/osc.js"></script>\
          <script type="text/javascript" src="lib/god.js"></script>\
          <!-- <script type="text/javascript" src="node_modules/requirejs/require.js"></script> -->\
          </body></html>');
      } else {
        console.log("importing the file.");
        var fileStream = fs.createReadStream(filename);
        fileStream.pipe(res);
      }
    }
    return;

  };

  var args = req.url.split("?")[1];

  if (args) {
    args = args.slice(2, args.length);
    console.log(args);
    var split = args.split("/");
    // the ext
    var ext = split[split.length - 1];
    split = ext.split('.');
    ext = split[split.length - 1];
    // console.log(ext);
    download(args, "./images/a." + ext, normal);
  } else {
    normal();
  }



}).listen(3000);