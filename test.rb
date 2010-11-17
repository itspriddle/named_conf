$:.unshift 'lib'

require 'named_conf'

conf = NamedConf.configure do

  zone :name => 'example.com', :address => '1.1.1.1' do |z|
    z.ttl     = "2h"
    z.expire  = "4W"
    z.retry   = "2H"
    z.refresh = "8H"

    record :a,
      :name    => 'example.com',
      :address => '1.1.1.1'

    record :cname,
      :name    => 'google.example.com',
      :address => 'google.com.'

    record :mx,
      :priority => 1,
      :address  => 'mail.example.com.'
  end

end

puts conf
