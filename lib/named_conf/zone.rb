module NamedConf
  class Zone

    attr_accessor :records, :ttl, :serial, :refresh, :retry, :expire, :ns1, :ns2, :hostmaster

    def initialize(options = {})
      @records    = [Record.new(:a, options)]
      @ttl        = '2H'
      @serial     = Time.now.to_i
      @refresh    = '8H'
      @retry      = '2H'
      @expire     = '4W'
      @ns1        = 'ns1.example.com'
      @ns2        = 'ns2.example.com'
      @hostmaster = 'hostnamster.example.com'
    end

    def record(type, options)
      record = Record.new(type, options)
      @records << record
      record
    end

    def to_s
      template << @records.map(&:to_s).join("\n")
    end

    def template
      out  = "$TTL #{ttl}\n"
      out << "@\t\t\t\tIN\t\tSOA\t\t#{ns1} #{hostmaster} (\n"
      out << "\t\t\t\t\t\t\t#{serial}\t\t; serial\n"
      out << "\t\t\t\t\t\t\t#{refresh}\t\t; refresh\n"
      out << "\t\t\t\t\t\t\t#{self.retry}\t\t; retry\n"
      out << "\t\t\t\t\t\t\t#{expire}\t\t; expire\n"
      out << "\t\t\t\t\t\t\t#{ttl} )\t\t; min TTL\n\n"
    end
  end
end

