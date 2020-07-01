import Cocoa

let s = "https://tw.pairs.lv/2.0/region/decide?mobile_country_code=450&mobile_network_code=08&iso_country_code=kr&carrier_name=KT&locale_identifier=ko_KR&time_zone_identifier=Asia/Seoul&languages[]=ko"

let url = URL(string: "https://tw.pairs.lv/2.0/region/decide?mobile_country_code=450&mobile_network_code=08&iso_country_code=kr&carrier_name=KT&locale_identifier=ko_KR&time_zone_identifier=Asia/Seoul&languages[]=ko")!

URLComponents(string: s)
URLComponents(url: url, resolvingAgainstBaseURL: true)


