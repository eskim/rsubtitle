module Rsubtitle

  class SMI

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
        
        @entries << {:start => start, :subtitle => sub, :duration => duration}
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
