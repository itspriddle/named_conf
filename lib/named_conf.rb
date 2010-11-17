module NamedConf
  autoload :Base,   'named_conf/base'
  autoload :Zone,   'named_conf/zone'
  autoload :Record, 'named_conf/record'

  def self.configure(&block)
    base = Base.new
    base.instance_eval(&block)
    base.to_s
  end

end
