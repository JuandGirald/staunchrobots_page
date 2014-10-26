require 'httparty'

# 'params' params for payload
pars = JSON.parse(payload, symbolize_names: true)

puts pars

host = pars[:host1]
HTTParty.get host
root_path = pars[:host2]
HTTParty.get host
