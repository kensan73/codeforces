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

graph = ->
  Object.assign Object.create(graph::),
    nodes: new Map()

graph::add = (node) ->
  return if @nodes.has(node)
  @nodes.set node, []

graph::adde = (ns, nd) ->
  return if not @nodes.has(ns)
  @add(nd) if not @nodes.has(nd)

  neighbors = @nodes.get(ns)

  return if neighbors.find((n) -> n == nd)
  neighbors.push nd

graph::dfs = (sn) ->
  tovisit = []
  visited = new Map()

  tovisit.push(sn)

  while(tovisit.length > 0)
    n = tovisit.pop()
    continue if visited.has(n)
    visited.set(n)
    print(n)
    nn = @nodes.get(n)
    nn.forEach (n) ->
      tovisit.unshift(n) if (!visited.has(n) and !tovisit.find((tv) -> tv == n))

  return

mainAux = () ->
  myg = graph()
  num = readline()
  for i in [1..num]
    [node, neighbors...] = readline().split(' ')
    myg.add node
    myg.adde node, neighbor for neighbor in neighbors

  myg.dfs('1')

input = '''
12
1 3 5 6
2 4 6 8 10
3 1 5 6 7
4 2 10
5 3 7
6 1 2
7 3 5
8 2 3
9 1 11 12
10 4
11 9 12
12 9 11
'''

```
function main() {
  return mainAux();
}
```
