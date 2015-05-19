class Ability
  include CanCan::Ability

  def initialize(user)

  	user ||= User.new  
      	if user.admin?
      		can :manage, :all 
      	else 
      	can :create, Detail
     		can :create, Bill
      	end
  end
end
