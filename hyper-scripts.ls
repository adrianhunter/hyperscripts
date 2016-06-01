needle = require 'needle'
fs = require 'fs'

req = ->
  throw new Error('p req')
default-value = (p)-> p

global.GET = (p, q) !->
  needle.get "http://#{p}",(e,r)-> 
      q(r?.body) if q
  
global.write = (p, q=default-value('some-file.txt'), r,) ->
  fs.writeFile q, p, 'utf8', r
