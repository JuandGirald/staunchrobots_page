require 'httparty'

# 'params' params for payload
pars = JSON.parse(payload, symbolize_names: true)

puts pars

host = pars[:host]
HTTParty.get host
