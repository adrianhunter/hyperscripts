// Generated by LiveScript 1.5.0
(function(){
  var needle, fs, req, defaultValue;
  needle = require('needle');
  fs = require('fs');
  req = function(){
    throw new Error('p req');
  };
  defaultValue = function(p){
    return p;
  };
  global.GET = function(p, q){
    needle.get("http://" + p, function(e, r){
      if (q) {
        return q(r != null ? r.body : void 8);
      }
    });
  };
  global.write = function(p, q, r){
    q == null && (q = defaultValue('some-file.txt'));
    return fs.writeFile(q, p, 'utf8', r);
  };
}).call(this);