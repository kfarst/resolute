class StaffMembersController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  respond_to :html

  def index
    respond_with @staff_members = StaffMember.all
  end

  def admin
    respond_with @staff_members = StaffMember.all
  end

  def new
    @staff_member = StaffMember.new
    @staff_member.stats.build
    respond_with @staff_member
  end

  def edit
    respond_with @staff_member = StaffMember.find(params[:id])
  end

  def create
    @staff_member = StaffMember.new(params[:staff_member])

    if @staff_member.save
      flash[:notice] = 'Staff member was successfully created.'
      redirect_to :action => :index
    else
      render 'new'
    end
  end

  def update
    @staff_member = StaffMember.find(params[:id])

    if @staff_member.update_attributes(params[:staff_member])
      flash[:notice] = 'Staff member was successfully updated.'
      redirect_to :action => :index
    else
      render 'edit'
    end

  end

  def destroy
    @staff_member = StaffMember.find(params[:id])
    @staff_member.destroy

    redirect_to :action => :admin
  end

  def sort
    params[:staff_member].each_with_index do |staff_member_id, i|
      StaffMember.find(staff_member_id).update_attribute(:position, i)
    end
    render :text => params[:staff_member]
  end

end
