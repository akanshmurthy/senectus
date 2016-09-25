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
    @price = get_drug_price
    puts @price
    @price_30 = @price['data'][0]['retail']['oop_30_day']['amount']
    @price_90 = @price['data'][0]['mail']['oop_90_day']['amount']
    render :detail
  end

end
