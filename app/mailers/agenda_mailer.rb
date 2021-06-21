class AgendaMailer < ApplicationMailer
  def agenda_mail(agenda)
  @agenda = agenda
  mail to: "anselmehado85@yahoo.com", subject: "Inquiry confirmation email"
end
end



before_action :set_agenda, only: [:show, :edit, :update, :destroy]
## omit
def create
  @contact = Agenda.new(agenda_params)
  if @agenda.save
    AgendaMailer.agenda_mail(@agenda).deliver  ##Addendum
    redirect_to agendas_path, notice: 'agenda was successfully deleted.'
  else
    render :new
  end
end
## omit
private
def set_agenda
  @agenda = Agenda.find(params[:id])
end
def agenda_params
  params.require(:agenda).permit(:title, :description)
end
