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
    @name = JSON.parse(get_member_profile)
    @photo = JSON.parse(get_drug_image)
    byebug
    render :detail
  end

end
