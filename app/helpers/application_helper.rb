require 'net/http'
require 'pokitdok'


module ApplicationHelper
  def get_member_profile
    url = URI.parse('https://qa-api.humana.com/hackathon/members/0872257542951/profiles/clinical')
    req = Net::HTTP::Get.new(url.to_s)
    req['Accept'] = 'application/json'
    req.add_field('x-humana-api-key', ENV["HUMANA_KEY"])
    res = Net::HTTP.new(url.host, url.port)
    res.use_ssl = true
    res.verify_mode = OpenSSL::SSL::VERIFY_NONE
    response = res.request(req)
    response.body
  end

  def get_drug_image
    url = URI.parse('https://api.fdbcloudconnector.com/cc/api/v1_3/PackagedDrugs/43353075960/Image?CallSystemName=ABC+System&CallID=3214&DeptName=Dept&getcurrentonly=false&returnssllink=false')
    req = Net::HTTP::Get.new(url.to_s)
    req['Accept'] = 'application/json'
    req.add_field('Authorization', 'SHAREDKEY 1197:n1ndBzCNh+hW7kbVueswEsCGNiDd1yS6U4MKk3kOe14=')
    res = Net::HTTP.new(url.host, url.port)
    res.use_ssl = true
    res.verify_mode = OpenSSL::SSL::VERIFY_NONE
    response = res.request(req)
    response.body
  end

  def get_drug_price
    client = PokitDok::PokitDok.new("zJd3GGhGdcXX6jjshri2", "u7qHAtKIwObRemO8QtZn6VrWVjYVhEpfjrBegMTM")
    client.pharmacy_formulary(trading_partner_id: 'medicare_national', plan_number: 'S5820003', drug: 'carbidopa')
  end

  def get_drug_interactions
    payload = {
      "DDIScreenRequest": {
        "ProspectiveOnly": false,
        "SeverityFilter": "3"
      },
      "CallContext": {
        "CallSystemName": "XYZ Hospital System"
      },
      "ScreenProfile": {
        "ScreenDrugs": [
          {
            "Prospective": true,
            "DrugID": "264600",
            "DrugConceptType": "DispensableDrug"
          },
          {
            "Prospective": true,
            "DrugID": "206813",
            "DrugConceptType": "DispensableDrug"
          }
        ]
      }
    }
    url = URI.parse('https://api.fdbcloudconnector.com/cc/api/v1_3/Screen')
    req = Net::HTTP::Post.new(url.to_s, {'Content-Type' => 'application/json'})
    req.body = payload.to_json
    req.add_field('Authorization', 'SHAREDKEY 1197:n1ndBzCNh+hW7kbVueswEsCGNiDd1yS6U4MKk3kOe14=')
    res = Net::HTTP.new(url.host, url.port)
    res.use_ssl = true
    res.verify_mode = OpenSSL::SSL::VERIFY_NONE
    response = res.request(req)
    response.body
  end
end
