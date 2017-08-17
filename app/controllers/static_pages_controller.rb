class StaticPagesController < ApplicationController
  
  def home
      @msg = 'static page home アクション'
  end

  def help
      @msg = 'static page help アクション'
  end
end