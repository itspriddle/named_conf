module NamedConf
  class Record

    def initialize(type, options = {})
      @type    = type
      @options = options
    end

    def to_s
      case @type
      when :a, :cname
        "%s\t\t\t%s\t\t%s" % [@options[:name], @type.to_s.upcase, @options[:address]]
      when :mx
        "\t\t\t\t%s\t\t%s\t%s" % [@type.to_s.upcase, @options[:priority], @options[:address]]
      end
    end

    def template
      "%s\t\t\t%s\t\t%s"
    end

  end
end
