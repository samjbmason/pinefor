$(document).on "ready page:load", ->
  # On clicking the edit button add a class to the parent element this hides the title and shows the form
  $(".js-show-meta-form").on "click", ->
    $(".js-meta-container").addClass "open"
    false

  # When clicking thr cancel button remove the class
  $(".js-close-list-edit").on "click", ->
    $(".js-meta-container").removeClass "open"
    false