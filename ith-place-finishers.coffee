rl = require('readline').createInterface
  input: process.stdin
  output: process.stdout

print = console.log
write = (args...) ->
  process.stdout.write(args.join(' '))

lines = []

rl.on 'line', (line) ->
  lines.push(line)

rl.on 'close', main

rli = 0

readline = () ->
  lines[rli++]

mainAux = () ->
  [n, k] = readline().split(' ')
  finishers = readline().split(' ')
  passing = parseInt(finishers[k-1])
  ff = finishers.filter((f) -> f > 0 and f >= passing)
  print(ff.length)

`function main() {
  return mainAux();
}`
