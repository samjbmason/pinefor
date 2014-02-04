$(document).on "ready page:load", ->
  heroElement = ".hero"

  imageFade = ->
    setTimeout (->
      $(heroElement).addClass "focus1"
    ), 2000

    setTimeout (->
      $(heroElement).addClass "focus2"
    ), 4000

    setTimeout (->
      $(heroElement).addClass "focus3"
    ), 6000

    setTimeout (->
      $(heroElement).addClass "focus4"
    ), 8000

    setTimeout (->
      $(heroElement).addClass "focus5"
    ), 10000

    setTimeout (->
      $(heroElement).removeClass("focus1 focus2 focus3 focus4 focus5");
    ), 12000

  imageFade()

  setInterval (->
    imageFade()
  ), 14000