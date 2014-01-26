$(document).on "ready page:load", ->
  # On clicking the edit button add a class to the parent element this hides the title and shows the form
  $(".js-show-meta-form").on "click", ->
    $(".js-meta-container").addClass "open"
    false

  # When clicking thr cancel button remove the class
  $(".js-close-list-edit").on "click", ->
    $(".js-meta-container").removeClass "open"
    false

  # Allows to click on url and select all for easy copying
  $(".share-url").on "click", ->
    $(this).select()

  # Change hover to different
  dataAttr =
  origData =
  $(".list-event-date").hover (->
    dataAttr = $(this).data("time-to")
    origData = $(this).html()
    $(this).html(dataAttr)
  ), ->
    $(this).html(origData)