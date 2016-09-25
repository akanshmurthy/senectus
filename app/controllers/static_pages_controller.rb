require 'application_helper'
require 'json'

class StaticPagesController < ApplicationController
  include ApplicationHelper

  def root
  end

  def list
    @results = JSON.parse(get_member_profile)
    drug_list = {}
    puts @results
    @results['prescriptions'].each do |result|
        res_name = result['name'].downcase.split
        res_price = get_drug_price
        drug_list[res_name] = res_price
    end
    puts "\n\n\n drug_list #{drug_list}"
    name = @results['prescriptions'][0]['name'].downcase.split
    puts "name #{name}"
    price = get_drug_price()['data'][0]['retail']['oop_30_day']['amount']
    render :list
  end

  def detail
    @name = JSON.parse(get_member_profile)
    @photo = JSON.parse(get_drug_image)
    @druginteractions = JSON.parse(get_drug_interactions)
    @price = get_drug_price
    @price_30 = @price['data'][0]['retail']['oop_30_day']['amount']
    @price_90 = @price['data'][0]['mail']['oop_90_day']['amount']
    @cheaperdrugs = JSON.parse(get_drugs_under_drug_classification)
    @cheapestdrugs = []
    @cheaperdrugs["Items"].each do |cheaperdrug|
      cheaperprices = get_price_for_cheaper_drug(cheaperdrug["DrugDesc"])
      cheaperprice = cheaperprices['data'][0]['retail']['oop_30_day']['amount']
      if cheaperprice.to_f < @price_30.to_f
        @cheapestdrugs.push([cheaperdrug["DrugDesc"], cheaperprice])
      end
    end
    render :detail
  end

end
