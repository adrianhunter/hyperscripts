needle = require 'needle'
fs = require 'fs'
cheerio = require 'cheerio'
csvjson = require 'csvjson'
global._ = require 'underscore'

STATE = 
 tmp_file:'some-file.txt'

# something like helper functions
req = (p, q='p')->
  throw new Error("#{q} req #{if p then 'Type: ' + p else ''}")
default-value = (p)-> p

# basic logic functions
global.GET = (p, q) !->
  needle.get "http://#{p}",(e,r)-> 
      q(r?.body) if q
  
global.write = (p, q=default-value(STATE.tmp_file), r,) ->
  fs.writeFile q, p, 'utf8', r

global._$ = (p)->
  cheerio.load p
  
global.from-pipe = (p=req())->
    istring = ''
    process.stdin.resume()
    process.stdin.setEncoding('utf8')
    process.stdin.on('data', (data)->
        istring += data
    )
    process.stdin.on('end', ->
        p(istring)
    )
    
global.csvtoj = (p=default-value(STATE.tmp_file)) ->
  csvjson.toObject(p).output
  
global.copy = (p=req('String'), q='new_copy')->
  myfile = fs.readFileSync p  
  fs.writeFile q, myfile
  
# functions based on other functions

global._sweb = (p, q)->
  # writes html based on url to filesystem
  GET p,(p2)-> write p2, '_sweb.html'