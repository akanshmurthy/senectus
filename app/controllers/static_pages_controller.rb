require 'application_helper'

class StaticPagesController < ApplicationController
  include ApplicationHelper

  def root
    @results = get_member_profile
    puts @results
    render :root
  end

end
