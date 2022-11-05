class Admin::TicketsController < Admin::BaseController
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    ticket = Ticket.new(permitted_params)
    ticket.image.attach(permitted_params[:image])
    if ticket.save!
      redirect_to admin_tickets_path
    else
      render :new
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update!(permitted_params)
      redirect_to admin_tickets_path
    else
      render :edit
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to admin_tickets_path
  end

  private

  def permitted_params
    params.require(:ticket).permit(:name, :price, :description, :short_description, :image, :user_id)
  end
end
