{ Buffer } = require 'buffer'

TEK =
  GS: 29
  PREFIX:
    HIGH:
      x: 1 .<<. 5
      y: 1 .<<. 5
    LOW:
      x: 2 .<<. 5
      y: 3 .<<. 5

# Takes a plt file as a string and returns an array of octets
module.exports = plt2tek = (input) ->
  input = input.toString!.replace /\s/g, ''
  octets = input |> extractNodes |> convertNodes

function extractNodes input
  input
    .split ';'
    .map -> it.match /(P[UD])(\d+),(\d+)/
    .filter -> it isnt null
    .map ->
      pinUp = it[1] is 'PU'
      [x, y] = it.slice 2, 4
      { pinUp, x, y }

function convertNodes input
  input
    .map toBytes = (node) ->
      octets = if node.pinUp then [ TEK.GS ] else [ ]
      octets ++= (valueToBytes 'y', node.y)
      octets ++= (valueToBytes 'x', node.x)
    .reduce flatten = (collector, item) ->
      collector ++ item

function valueToBytes axis, value
  # Convert an x or y value into an array of octets
  values = split value
  high = TEK.PREFIX.HIGH[axis] + values[0]
  low  = TEK.PREFIX.LOW[axis]  + values[1]
  [high, low]

function split value
  # Split a 10-bit group into two 5-bit groups
  high = (value .>>. 5) % 32
  low = value % 32
  [high, low]

