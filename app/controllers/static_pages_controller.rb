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
    @druginteractions = JSON.parse(get_drug_interactions)
    @price = get_drug_price
    @price_30 = @price['data'][0]['retail']['oop_30_day']['amount']
    @price_90 = @price['data'][0]['mail']['oop_90_day']['amount']
    byebug
    render :detail
  end

end
