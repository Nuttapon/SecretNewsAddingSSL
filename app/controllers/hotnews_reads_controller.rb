class HotnewsReadsController < ApplicationController
  force_ssl
  # GET /hotnews_reads
  # GET /hotnews_reads.json
  def index
    @hotnews_reads = HotnewsRead.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hotnews_reads }
    end
  end

  # GET /hotnews_reads/1
  # GET /hotnews_reads/1.json
  def show
    @hotnews_read = HotnewsRead.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hotnews_read }
    end
  end

  # GET /hotnews_reads/new
  # GET /hotnews_reads/new.json
  def new
    @hotnews_read = HotnewsRead.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hotnews_read }
    end
  end

  # GET /hotnews_reads/1/edit
  def edit
    @hotnews_read = HotnewsRead.find(params[:id])
  end

  # POST /hotnews_reads
  # POST /hotnews_reads.json
  def create
    @hotnews_read = HotnewsRead.new(params[:hotnews_read])

    respond_to do |format|
      if @hotnews_read.save
        format.html { redirect_to @hotnews_read, notice: 'Hotnews read was successfully created.' }
        format.json { render json: @hotnews_read, status: :created, location: @hotnews_read }
      else
        format.html { render action: "new" }
        format.json { render json: @hotnews_read.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hotnews_reads/1
  # PUT /hotnews_reads/1.json
  def update
    @hotnews_read = HotnewsRead.find(params[:id])

    respond_to do |format|
      if @hotnews_read.update_attributes(params[:hotnews_read])
        format.html { redirect_to @hotnews_read, notice: 'Hotnews read was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hotnews_read.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotnews_reads/1
  # DELETE /hotnews_reads/1.json
  def destroy
    @hotnews_read = HotnewsRead.find(params[:id])
    @hotnews_read.destroy

    respond_to do |format|
      format.html { redirect_to hotnews_reads_url }
      format.json { head :no_content }
    end
  end
end
