quicksort = (items) ->
  swap = (i, j) ->
    temp = items[i]
    items[i] = items[j]
    items[j] = temp

  partition = (left, right) ->
    pivot = Math.floor(items[(left+right)/2])
    i = left
    j = right

    while i <= j
      while items[i] <= pivot then i++
      while items[j] >= pivot then j--
      if i <= j
        swap i, j
        i++
        j--

    return i


  qs = (left, right) ->
    return if (right-left) < 2

    index = partition left, right

    qs 0, (index - 1) if left < (index - 1)
    qs index, right if right > index

  qs 0, items.length-1
