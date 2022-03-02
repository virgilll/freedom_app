class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ home help ]

  def home
  end

  def help
  end
end
