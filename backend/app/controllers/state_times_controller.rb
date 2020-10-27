class StateTimesController < ApplicationController
  before_action :set_state_time, only: [:show, :update, :destroy]

  # GET /state_times
  def index
    @state_times = StateTime.all

    render json: @state_times
  end

  # GET /state_times/1
  def show
    render json: @state_time
  end

  # POST /state_times
  def create
    @state_time = StateTime.new(state_time_params)

    if @state_time.save
      render json: @state_time, status: :created, location: @state_time
    else
      render json: @state_time.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /state_times/1
  def update
    if @state_time.update(state_time_params)
      render json: @state_time
    else
      render json: @state_time.errors, status: :unprocessable_entity
    end
  end

  # DELETE /state_times/1
  def destroy
    @state_time.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state_time
      state = params[:id]
      @state_time = StateTime.where(state: state)
    end

    # Only allow a trusted parameter "white list" through.
    def state_time_params
      params.require(:state_time).permit(:uf, :state, :cases, :deaths, :date)
    end
end
