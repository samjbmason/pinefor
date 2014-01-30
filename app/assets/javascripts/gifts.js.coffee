$(document).on "ready page:load", ->

  # Clicking edit button on gift shows adds class to show form
  $(".js-show-gift-meta-form").on "click", ->
    $(this).closest(".js-gift-container").addClass "open"
    false

  # On clicking cancel button in form removes class.
  $(".js-close-gift-edit").on "click", ->
    $(this).closest(".js-gift-container").removeClass "open"
    false

  # Show closest span next to mark icon
  $(".js-mark-gift").hover (->
    $(this).siblings(".icon-desc").addClass "open"
  ), ->
    $(this).siblings(".icon-desc").removeClass "open"
