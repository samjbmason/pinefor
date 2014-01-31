module ApplicationHelper

  # All of this code allows me to have the account forms as partials in other views
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  # Spits out a random greeting in the header
  def welcome_intro
    welcomes = [
      "Hi",
      "Hi there",
      "Welcome",
      "Your awesome",
      "Howdy",
      "What's crackin?",
      "Welcome back",
      "Howzit",
      "What's up?",
      "Yo",
      "How goes it?"
    ]

    welcomes.sample
  end
end
