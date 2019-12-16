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
  user.present?
  end

  def destroy?
    user.present?
  end

  def update?
    user.present? && user == post.user
  end

end
