class ReportsController < ApplicationController
  def index
  end

  def report
    @start_date = params(:start)
    @end_date = params(:end)
    
  end
end
