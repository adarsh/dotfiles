require 'awesome_print'
AwesomePrint.irb!

def efind(email)
  User.find_by_email(email)
end

def u
  User.first
end

def dj
  Delayed::Job
end

class Object
  def interesting_methods
    (self.methods - Object.new.methods).sort
  end
end
