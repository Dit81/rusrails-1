class NomenclaturesController < ApplicationController
  # GET /nomenclatures
  # GET /nomenclatures.json
  caches_page :index
  def index
    @nomenclatures = Nomenclature.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nomenclatures }
    end
  end

  # GET /nomenclatures/1
  # GET /nomenclatures/1.json
  def show
    @nomenclature = Nomenclature.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nomenclature }
    end
  end

  # GET /nomenclatures/new
  # GET /nomenclatures/new.json
  def new
    @nomenclature = Nomenclature.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nomenclature }
    end
  end

  # GET /nomenclatures/1/edit
  def edit
    @nomenclature = Nomenclature.find(params[:id])
  end

  # POST /nomenclatures
  # POST /nomenclatures.json
  def create
    @nomenclature = Nomenclature.new(params[:nomenclature])

    respond_to do |format|
      if @nomenclature.save
        format.html { redirect_to @nomenclature, notice: 'Nomenclature was successfully created.' }
        format.json { render json: @nomenclature, status: :created, location: @nomenclature }
      else
        format.html { render action: "new" }
        format.json { render json: @nomenclature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /nomenclatures/1
  # PUT /nomenclatures/1.json
  def update
    @nomenclature = Nomenclature.find(params[:id])

    respond_to do |format|
      if @nomenclature.update_attributes(params[:nomenclature])
        format.html { redirect_to @nomenclature, notice: 'Nomenclature was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @nomenclature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nomenclatures/1
  # DELETE /nomenclatures/1.json
  def destroy
    @nomenclature = Nomenclature.find(params[:id])
    @nomenclature.destroy

    respond_to do |format|
      format.html { redirect_to nomenclatures_url }
      format.json { head :no_content }
    end
  end
end
