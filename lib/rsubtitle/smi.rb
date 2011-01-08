module Rsubtitle


  class Subtitle
    attr_reader :entries
    
    def format(type, options = {})
      ""
    end

  end



  class SMI < Subtitle


    SMI_RE = %r(
      ^<sync\sstart=(\d+)> <p[^>]+> (?:\r?\n)? ( \&nbsp;(?=\r?\n) | (?<=\n).+?(?=\r?\n)  )
    )xim


    class << self

      def parse(file)
        SMI.new(file)
      end

    end

    def initialize(file)
      @body = open(file).read
      lines = @body.scan(SMI_RE)
      
      @entries = []
      lines.each_with_index do |d, idx|
        next if d[1] == "&nbsp;"

        start = d[0].to_i
        duration = (lines[idx+1].nil?) ? 0 : (lines[idx+1][0].to_i - start)

        sub = d[1]
        sub.gsub!(/<br\s*\/?>/i, "\n") # br -> \n
        sub.gsub!(/<[^>]+?>/i, "") # strip tags
        sub.strip!
        

        e = Entry.new
        e.start = start
        e.body = sub
        e.duration = duration

        @entries << e
      end

    end

    def size
      @entries.size
    end

    def [](idx)
      @entries[idx]
    end



  end

end
