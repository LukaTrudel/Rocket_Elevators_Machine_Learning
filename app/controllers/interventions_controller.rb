class InterventionsController < ApplicationController
    require 'zendesk_api'

    # These Methods are called by tje Afax function
    def update_buildings
        @buildingList = Building.where(customer_id: params[:customer_id])
        render json: {buildings: @buildingList}
    end

    def update_battery
        @batteryList = Batterie.where(building_id: params[:building_id])
        render json: {batteries: @batteryList}
    end
 
    def update_column
        @columnList = Column.where(battery_id: params[:battery_id])
        render json: {columns: @columnList}
    end

    def update_elevator
        @elevatorList = Elevator.where(column_id: params[:column_id])
        render json: {elevators: @elevatorList}
    end

    # With this logic, only the last element selected will be saved in the database
    # Coaches words:
    # - building && battery filled in                       ==> we only want to save the battery_id to the database
    # - building && battery && column filled in             ==> we only want to save the column_id to the database
    # - building && battery && column && elevator filled in ==> we only want to save the elevator_id to the database
    def create

       intervention = Intervention.new
       intervention.author = current_user.id
       intervention.customer_id = params[:customer_id]
       intervention.report = params[:description]

       if params[:elevator_id].present?
        intervention.elevator_id = params[:elevator_id]
        intervention.employee_id = params[:employee_id]
        intervention.save!
       elsif params[:column_id].present?
        intervention.column_id = params[:column_id]
        intervention.employee_id = params[:employee_id]
        intervention.save!
       elsif params[:battery_id].present? &&
        intervention.battery_id = params[:battery_id]
        intervention.employee_id = params[:employee_id]
        intervention.save!
       end

       if intervention.save!
            create_ticket()
            flash[:notice] = "Intervention saved successfully!"
            redirect_to '/pages/intervention'
       end

    end

    # This Method will send a ticket after the creation of an intervention
    def create_ticket
        client = ZendeskAPI::Client.new do |config|
            config.url = ENV['ZENDESK_URL']
            config.username = ENV['ZENDESK_USERNAME']
            config.token = ENV['ZENDESK_TOKEN']
        end
        ZendeskAPI::Ticket.create!(client, 
            :subject => "New Intervention", 
            :comment => { 
              :value => "#{current_user.employee.first_name} has requested an intervention for customer: #{params[:customer_id]}.\n\n
              Intervention summary:\n
              - Building: #{params[:building_id]}
              - Battery: #{params[:battery_id]}
              - Column: #{params[:column_id]}
              - Elevator: #{params[:elevator_id]}\n\n
              Employee: #{params[:employee_id]} has been assigned to the task.\n
              Description: #{params[:description]}"
              }, 
            :priority => "urgent",
            :type => "task"
        )
    end

end