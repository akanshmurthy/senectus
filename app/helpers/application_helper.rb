require 'net/http'

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
end
