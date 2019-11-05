class AppointmentsController < ApplicationController

  get '/appointments' do
    authenticate
    @user = User.find_by_id(params[:user_id])
    if logged_in?
      @appointments = current_user.appointments.all
    erb :appointments
  else
    redirect "/login"
  end
end

get '/bookappt' do
  erb :newappts
end

post '/bookappt' do
   appointment = Appointment.new(name: params[:name], user_id: current_user.id, date: params[:date])
   if appointment.save
   redirect '/appointments'
 else
   redirect '/bookapt'
 end
end

get '/appts/:id' do
  @appt = Appointment.find_by_id(params[:id])
  erb :appts
end

delete '/appts/:id' do
  @appt = Appointment.find_by_id(params[:id])
  if @appt.user.id == current_user.id
    @appt.delete
    redirect '/appointments'
  else
    redirect '/login'
end
end

get '/appts/:id/edit' do
@appt = Appointment.find_by_id(params[:id])
if @appt.user.id == current_user.id
  erb :edit
else
  redirect '/appointment'
end
end

patch '/appts/:id' do
  @appt = Appointment.find_by_id(params[:id])
  params.delete("_method")
  if @appt.update(params)
    redirect "/appts/#{@appt.id}"
  else
    redirect '/appointments'
  end
end





end
