$(document).on "ready page:load", ->
  $(".js-show-meta-form").on "click", ->
    $(".js-meta-container").addClass "open"
    false

  $(".js-close-list-edit").on "click", ->
    $(".js-meta-container").removeClass "open"
    false