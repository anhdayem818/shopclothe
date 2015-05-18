class Ability
  include CanCan::Ability

  def initialize(user, controller_namespace)

  	user ||= User.new 
  	if controller_namespace == 'admin'
        if user.admin? 
        	can :manage, :all
        end	 
    else 
      	if user.admin?
      		can :manage, :all 
      	else 
      		can :create, Detail
     		can :create, Bill
      	end
        
    end
  end
end
