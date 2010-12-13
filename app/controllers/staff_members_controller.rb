class StaffMembersController < ApplicationController
  respond_to :html

  def index
    respond_with @staff_members = StaffMember.all
  end

  def admin
    respond_with @staff_members = StaffMember.all
  end

  def new
    respond_with @staff_member = StaffMember.new
  end

  def edit
    respond_with @staff_member = StaffMember.find(params[:id])
  end

  def create
    @staff_member = StaffMember.new(params[:staff_member])

    if @staff_member.save
      flash[:notice] = 'Staff member was successfully created.'
    end

    redirect_to :index
  end

  def update
    @staff_member = StaffMember.find(params[:id])

    if @staff_member.update_attributes(params[:staff_member])
      flash[:notice] = 'Staff member was successfully updated.'
    end

    respond_with @staff_member
  end

  def destroy
    @staff_member = StaffMember.find(params[:id])
    @staff_member.destroy

    respond_with @staff_member
  end
end
