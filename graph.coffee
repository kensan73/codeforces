# @flow

graph = () ### : any ### -> Object.assign Object.create(graph::), al: new Map()

graph::addv = (v ### :any ###) ->
  @al.set v, [] unless @al.has v

graph::adde = (sv ### :any ###, ev ### :any ###) ->
  @addv sv
  @addv ev

  @al.get(sv).unshift ev unless (
    @al
      .get sv
      .find (v) -> v == ev
  )

graph::reverse = ### :any ### ->
  rg = graph()
  @al.forEach (ns, v) ->
    ns.forEach (n) ->
      rg.adde n, v

  rg

graph::dfs = (sv ### :any ###) ### :any ### ->
  dfs = (v, visited, al, result) ->
    return if visited.has v
    console.log v
    result.unshift v
    visited.set v

    al
      .get v
      .forEach (n) ->
        dfs n, visited, al, result

  visited = new Map()
  result ### : Array<any> ### = []
  dfs sv, visited, @al, result
  result

graph::dfs1 = (sv) ->
  dfs = (v, visited, al, result ### : Array<any> ###) ->
    return if visited.has v
    console.log v
    result.unshift v
    visited.set v

    al
      .get v
      .forEach (n) ->
        dfs n, visited, al, result

  visited = new Map()
  result = []
  dfs sv, visited, @al, result
  result
