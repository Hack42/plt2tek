{ Buffer } = require 'buffer'

readStdin (input) ->
  input = input.toString!.replace /\s/g, ''
  groups = input.split ';'
  parsed = groups
    .map (item) -> item.match /(P[UD])(\d+),(\d+)/
    .filter (item) -> item?
  numeric = parsed
    .map (item) ->
      result = []
      if item[1] is 'PU' then result.unshift 29 # GS
      result ++= y item[2]
      result ++= x item[3]
    .reduce (collector, item) ->
      collector ++ item
  numeric = [27, 127] ++ numeric

  output = new Buffer numeric
  process.stdout.write output

function x value
  result = prefixAndSplit 1, 2, value

function y value
  result = prefixAndSplit 1, 3, value

function prefixAndSplit high, low, value
  values = split value
  high = (high .<<. 5) + values[0]
  low  = (low .<<. 5)  + values[1]
  [high, low]

function split value
  high = (value .>>. 5) % 32
  low = value % 32
  [high, low]

function readStdin callback
  chunks = []
  size = 0

  process.stdin.on 'data', (data) ->
    size += data.length
    chunks.push data

  process.stdin.on 'end', ->
    input = Buffer.concat chunks, size
    callback input
