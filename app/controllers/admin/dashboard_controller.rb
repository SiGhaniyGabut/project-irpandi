class Admin::DashboardController < Admin::BaseController
  def index
    @tickets = Ticket.all.order(created_at: :desc).limit(3)
    @posts = Post.all.order(created_at: :desc).limit(3)
  end
end
