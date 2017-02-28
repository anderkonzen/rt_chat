require 'net/http'
require 'uri'

class Translator

  def self.translate(message, dialect)
    encoded_msg = CGI::escape(message)
    uri = URI.parse("http://www.degraeve.com/cgi-bin/babel.cgi?d=#{dialect}&w=#{encoded_msg}")
    response = Net::HTTP.get_response(uri)
    Translator.between(response.body, '<p>', '</p>')
  end

  def self.between(string, marker1, marker2)
    string[/#{Regexp.escape(marker1)}(.*?)#{Regexp.escape(marker2)}/m, 1]
  end
end
