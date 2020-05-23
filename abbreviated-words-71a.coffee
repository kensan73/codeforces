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
  args = readline()

  for i in [1..args]
    input = readline()
    if input.length < 11
      print input
      continue

    print input[0] + (input.length - 2) + input.slice(-1)

`function main() {
  return mainAux();
}`
