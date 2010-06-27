class ReportsController < ApplicationController
  before_filter 'require_user'
  def index
  end

  def report
    start_date = parse_select_date(params[:first])
    end_date = parse_select_date(params[:last])

    # Get data
    if start_date.nil? or end_date.nil?
      activities = current_user.activities.find(:all, :order => 'start_time')
      start_date = activities.map(&:start_time).min
    else
      activities = current_user.activities.find(:all,
        :conditions => { :start_time => start_date..end_date },
        :order => :start_time)
    end

    # Final totals
    @totals = Hash.new
    @totals[:time]     = activities.sum_numbers(&:elapsed)
    @totals[:distance] = activities.sum_numbers(&:distance)

    # Group into weeks
    @weeks = activities.group_by {|a| a.weeks_from start_date }.values

    # Add subtotals
    @weeks.map! do |week_activities|
      { :activities => week_activities,
        :totals =>
        { :time     => week_activities.sum_numbers(&:elapsed),
          :distance => week_activities.sum_numbers(&:distance) } }
    end
  end

  private
    def parse_select_date(p)
      unless p.nil? or p[:year].nil? or p[:month].nil? or p[:day].nil?
        DateTime.civil(p[:year].to_i, p[:month].to_i, p[:day].to_i)
      end
    end
end
