module NamedConf
  class Base

    def initialize
      @zones = []
    end

    def zone(name, address, &block)
      zone = Zone.new(name, address)
      zone.instance_eval(&block)
      @zones << zone
      zone
    end

    def to_s
      @zones.map(&:to_s)
    end
  end
end
