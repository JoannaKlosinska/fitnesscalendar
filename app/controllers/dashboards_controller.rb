class DashboardsController < ApplicationController
  def index
    month = (params[:month].present? && params[:month].to_i) || Time.zone.today.month
    year = (params[:year].present? && params[:year].to_i) || Time.zone.today.year

    @calendar = Calendar.new(month: month, year: year)
  end


end