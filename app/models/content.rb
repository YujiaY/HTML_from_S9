class Content < ApplicationRecord
	  has_and_belongs_to_many :courses


 

  # BlogPost.find_by_param("14") => looks for ID 14
  # BlogPost.find_by_param("foobar") => looks for url "foobar"
  # BlogPost.find_by_param("14-foobar") => looks for ID 14 (ignores the "-foobar" part)


end

