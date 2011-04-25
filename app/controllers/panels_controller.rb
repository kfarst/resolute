class PanelsController < ApplicationController
  # GET /panels
  # GET /panels.xml
  def index
    @large_panel = Panel.find_by_position("Left")
    @small_panel_top = Panel.find_by_position("Right Top")
    @small_panel_bottom = Panel.find_by_position("Right Bottom")
  end

  # GET /panels/1/edit
  def admin
    @panels = []
    ["Left", "Right Top", "Right Bottom"].each do |position|
      @panels << Panel.find_or_initialize_by_position(position)
    end
  end

  # POST /panels
  # POST /panels.xml
  def updating
    @panels = params[:panels].values.collect { |panel| Panel.new(panel) }
      if @panels.all?(&:valid?)
        Panel.overwrite_existing(@panels)
        flash[:notice] = "Panels sucessfully updated."
        redirect_to :action => 'admin'
      else
        @panels.each(&:valid?)
        render :action => 'admin'
      end
  end

  # PUT /panels/1
  # PUT /panels/1.xml
  def update
    @panel = Panel.find(params[:id])

    respond_to do |format|
      if @panel.update_attributes(params[:panel])
        format.html { redirect_to(@panel, :notice => 'Panel was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @panel.errors, :status => :unprocessable_entity }
      end
    end
  end

end
