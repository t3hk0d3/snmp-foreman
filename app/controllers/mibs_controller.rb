
class MibsController < ApplicationController
  # GET /mibs
  # GET /mibs.json
  def index
    @mibs = Mib.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mibs }
    end
  end

  # GET /mibs/1
  # GET /mibs/1.json
  def show
    @mib = Mib.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mib }
    end
  end

  # GET /mibs/new
  # GET /mibs/new.json
  def new
    @mib = Mib.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mib }
    end
  end

  # GET /mibs/1/edit
  def edit
    @mib = Mib.find(params[:id])
  end

  # POST /mibs
  # POST /mibs.json
  def create
    @mib = Mib.new(params[:mib])

    respond_to do |format|
      if @mib.save
        format.html { redirect_to @mib, notice: 'Mib was successfully created.' }
        format.json { render json: @mib, status: :created, location: @mib }
      else
        format.html { render action: "new" }
        format.json { render json: @mib.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mibs/1
  # PUT /mibs/1.json
  def update
    @mib = Mib.find(params[:id])

    respond_to do |format|
      if @mib.update_attributes(params[:mib])
        format.html { redirect_to @mib, notice: 'Mib was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mib.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mibs/1
  # DELETE /mibs/1.json
  def destroy
    @mib = Mib.find(params[:id])
    @mib.destroy

    respond_to do |format|
      format.html { redirect_to mibs_url }
      format.json { head :no_content }
    end
  end
end
