module NamedConf
  class Record

    def initialize(type, options = {})
      @type    = type
      @options = options
    end

    def to_s
      case @type
      when :a, :cname
        template % [@options[:name], @type.to_s.upcase, @options[:address]]
      when :mx
        template % [@options[:priority], @type.to_s.upcase, @options[:address]]
      end
    end

    def template
      "%s\t\t\t%s\t\t%s"
    end

  end
end
