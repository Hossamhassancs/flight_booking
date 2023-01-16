class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def genrate_pnr_code
    [*('A'..'Z'),*('0'..'9')].shuffle[0,8].join
  end
end
