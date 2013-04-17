class Employee < User
  has_many :suggestions
  has_many :comments
end
