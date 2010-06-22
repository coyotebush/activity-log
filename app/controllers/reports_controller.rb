class ReportsController < ApplicationController
  def index
  end

  def report
    if params[:first].nil? or params[:last].nil?
      @activities = Activity.find(:all, :order => 'start_time')
    else
      @start_date = parse_select_date(params[:first])
      @end_date = parse_select_date(params[:last])
      @activities = Activity.find(:all,
        :conditions => ['start_time BETWEEN ? AND ?', @start_date, @end_date],
        :order => 'start_time')
    end
  end

  private
    def parse_select_date(p)
      Date.civil(p[:year].to_i, p[:month].to_i, p[:day].to_i)
    end
end
