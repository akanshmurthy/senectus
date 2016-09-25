require 'application_helper'
require 'json'

class StaticPagesController < ApplicationController
  include ApplicationHelper

  def root
  end

  def list
    @results = JSON.parse(get_member_profile)
    render :list
  end

  def detail
    @results = JSON.parse(get_member_profile)
    render :detail
  end

end
