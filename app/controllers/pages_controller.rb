# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:panel]

  def index
    if user_signed_in?
      redirect_to pages_panel_path
    end
  end

  def panel
    
  end
end
