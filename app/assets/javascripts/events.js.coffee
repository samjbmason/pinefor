$(document).on "ready page:load", ->
  # Tracks when a user signs up
  $(".user-sign-up").on "submit", ->
    _gs "event", "New user has signed up"
    return

  # Track when user signs in
  $(".user-sign-in").on "submit", ->
    _gs "event", "User signed in"
    return

  # Track when user deletes account
  $("#delete-account").on "click", ->
    _gs "event", "User deleted account"
    return

  # Track when a new list is created
  $(".create-list-form").on "submit", ->
    _gs "event", "User created list"
    return

  # Track when a list is deleted
  $("#delete-list").on "click", ->
    _gs "event", "List deleted"
    return

  # Track when a gift is created
  $(".create-gift-form").on "submit", ->
    _gs "event", "User created gift"
    return

  # Track when a gift is deleted
  $(".delete-gift").on "click", ->
    _gs "event", "User deleted gift"
    return

  # Track when a gift is selected as bought
  $(".js-mark-gift--buy").on "click", ->
    _gs "event", "User has bought a gift"
    return

  # Track when a gift is deselected from buying
  $(".js-mark-gift--remove").on "click", ->
    _gs "event", "User has deselected gift (not buying anymore)"
    return

  # Track when a user clicks on url to share
  $(".share-url").on "click", ->
    _gs "event", "User has clicked on url to share"
    return