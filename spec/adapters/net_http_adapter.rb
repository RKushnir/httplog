# frozen_string_literal: true

class NetHTTPAdapter < HTTPBaseAdapter
  def send_get_request
    Net::HTTP.get_response(@host, [@path, @data].compact.join('?'), @port)
  end

  def send_head_request
    Net::HTTP.new(@host, @port).head(@path, @headers)
  end

  def send_post_request
    Net::HTTP.new(@host, @port).post(@path, @data)
  end

  def send_post_form_request
    Net::HTTP.post_form(parse_uri, @params)
  end
end
