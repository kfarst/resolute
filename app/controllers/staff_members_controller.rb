class StaffMembersController < ApplicationController
  # GET /staff_members
  # GET /staff_members.xml
  def index
    @staff_members = StaffMember.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @staff_members }
    end
  end

  # GET /staff_members/1
  # GET /staff_members/1.xml
  def show
    @staff_member = StaffMember.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @staff_member }
    end
  end

  # GET /staff_members/new
  # GET /staff_members/new.xml
  def new
    @staff_member = StaffMember.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @staff_member }
    end
  end

  # GET /staff_members/1/edit
  def edit
    @staff_member = StaffMember.find(params[:id])
  end

  # POST /staff_members
  # POST /staff_members.xml
  def create
    @staff_member = StaffMember.new(params[:staff_member])

    respond_to do |format|
      if @staff_member.save
        format.html { redirect_to(@staff_member, :notice => 'Staff member was successfully created.') }
        format.xml  { render :xml => @staff_member, :status => :created, :location => @staff_member }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @staff_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /staff_members/1
  # PUT /staff_members/1.xml
  def update
    @staff_member = StaffMember.find(params[:id])

    respond_to do |format|
      if @staff_member.update_attributes(params[:staff_member])
        format.html { redirect_to(@staff_member, :notice => 'Staff member was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @staff_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /staff_members/1
  # DELETE /staff_members/1.xml
  def destroy
    @staff_member = StaffMember.find(params[:id])
    @staff_member.destroy

    respond_to do |format|
      format.html { redirect_to(staff_members_url) }
      format.xml  { head :ok }
    end
  end
end
