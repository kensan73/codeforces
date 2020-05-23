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
  weight = args

  return print('NO') if weight < 4

  if ((weight - 2) % 2 == 0)
    print('YES')
  else
    print('NO')

`function main() {
  return mainAux();
}`


