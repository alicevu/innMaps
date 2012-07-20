class Person
  include Mongoid::Document
  field :name, :type => String
  field :phone, :type => String
  field :gender, :type => String
  field :work, :type => String
  field :requirement, :type => String
end
