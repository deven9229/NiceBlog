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
    return true if user.present? && user.admin?
    user.present?  && user.id == post.user_id
  end

  def destroy?
    return true if user.present? && user.admin?
    user.present?  && user.id == post.user_id
  end

  def update?
    return true if user.present? && user.admin?
    user.present? && user.id == post.user_id
  end

end
