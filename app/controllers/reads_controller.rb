class ReadsController < ApplicationController
  force_ssl
  # GET /reads
  # GET /reads.json
  def index
    @reads = Read.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reads }
    end
  end

  # GET /reads/1
  # GET /reads/1.json
  def show
    @read = Read.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @read }
    end
  end

  # GET /reads/new
  # GET /reads/new.json
  def new
    @read = Read.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @read }
    end
  end

  # GET /reads/1/edit
  def edit
    @read = Read.find(params[:id])
  end

  # POST /reads
  # POST /reads.json
  def create
    @read = Read.new(params[:read])

    respond_to do |format|
      if @read.save
        format.html { redirect_to @read, notice: 'Read was successfully created.' }
        format.json { render json: @read, status: :created, location: @read }
      else
        format.html { render action: "new" }
        format.json { render json: @read.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reads/1
  # PUT /reads/1.json
  def update
    @read = Read.find(params[:id])

    respond_to do |format|
      if @read.update_attributes(params[:read])
        format.html { redirect_to @read, notice: 'Read was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @read.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reads/1
  # DELETE /reads/1.json
  def destroy
    @read = Read.find(params[:id])
    @read.destroy

    respond_to do |format|
      format.html { redirect_to reads_url }
      format.json { head :no_content }
    end
  end
end
