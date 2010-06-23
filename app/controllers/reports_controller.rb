class ReportsController < ApplicationController
  def index
  end

  def report
    @start_date = parse_select_date(params[:first])
    @end_date = parse_select_date(params[:last])

    # Get data
    if @start_date.nil? or @end_date.nil?
      @activities = Activity.find(:all, :order => 'start_time')
      @start_date = @activities.map(&:start_time).min
    else
      @activities = Activity.find(:all,
        :conditions => { :start_time => @start_date..@end_date },
        :order => :start_time)
    end

    # Group into weeks
    @weeks = @activities.group_by {|a| ((a.start_time - @start_date) / 604800).floor }

    # Final totals
    @total_time     = @activities.sum_numbers(&:elapsed)
    @total_distance = @activities.sum_numbers(&:distance)
  end

  private
    def parse_select_date(p)
      unless p.nil? or p[:year].nil? or p[:month].nil? or p[:day].nil?
        DateTime.civil(p[:year].to_i, p[:month].to_i, p[:day].to_i)
      end
    end
end
