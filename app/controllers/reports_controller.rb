class ReportsController < ApplicationController
  def index
  end

  def report
    @start_date = parse_select_date(params[:first])
    @end_date = parse_select_date(params[:last])

    if @start_date.nil? or @end_date.nil?
      @activities = Activity.find(:all, :order => 'start_time')
    else
      @activities = Activity.find(:all,
        :conditions => ['start_time BETWEEN ? AND ?', @start_date, @end_date],
        :order => 'start_time')
    end
    @total_time     = sum @activities.map(&:elapsed)
    @total_distance = sum @activities.map(&:distance)
  end

  private
    def parse_select_date(p)
      unless p.nil? or p[:year].nil? or p[:month].nil? or p[:day].nil?
        Date.civil(p[:year].to_i, p[:month].to_i, p[:day].to_i)
      end
    end

    def sum xs
      xs.find_all {|x| x.is_a? Numeric }.sum
    end
end
