Rsubtitle
=========
Ruby video subtitle parser and formatter

Usage
-----

    > smi = Rsubtitle::SMI.parse "utf8.smi"
     => #<Rsubtitle::SMI:0x00000100ab47c0>
    > smi[0]
     => {:start=>10, :subtitle=>"first", :duration=>7390} 
    > smi[1]
     => {:start=>8000, :subtitle=>"second", :duration=>7400} 
    > smi[3]
     => nil 
    > smi.size
     => 2