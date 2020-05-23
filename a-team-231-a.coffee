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
  numlines = readline()
  tot = 0
  for i in [1..numlines]
      cur = readline().split(' ').reduce(((acc, n) -> acc + parseInt(n)), 0)
      if(cur >= 2) then tot++

  print(tot)

`function main() {
  return mainAux();
}`
