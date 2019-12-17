class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    true
  end

  def create?
    user.present?
  end

  def edit?
    #return true if user.admin?
    user.present?  && user.id == post.user_id
  end

  def destroy?
    user.present? &&  user.id == post.user_id
  end

  def update?
    user.present? && user.id == post.user_id
  end

end
