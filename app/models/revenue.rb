class Revenue
  attr_reader :rev
  def initialize(rev)
    @rev = (rev.to_f/100).to_s
  end
end
