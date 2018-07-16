class ReportsController < ApplicationController
	# list reports
	def index
		@reports = Report.all
		render json: @reports
	end
	# create new report, passing the ID from survivor reported
	def create
		@report = Report.new(report_params)
		if @report.save
			infection_report
			render json: @report, status: :created
		end
	end
	# reports from infected
	def infected
		survivor = Survivor.where(infected: true).count
		percent = ( survivor/all_survivors ) * 100
		render json: { message: "Percentage of infected survivors: #{percent} %"}
	end
	# reports from not infected
	def no_infected
		survivor = Survivor.where(infected: false).count
		percent = (survivor/all_survivors) * 100
		render json: { message: "Percentage of not infected survivors: #{percent} %"}
	end
	# method to count all survivors registered
	def all_survivors
		survivors = Survivor.count.to_f
	end
	private

	def report_params
		params.require(:report).permit(:survivor_id)
	end

	def infection_report
		survivor = Survivor.find(@report.survivor_id)
		total_reports = Report.where(survivor_id: @report.survivor_id).count
		survivor.update(infected: total_reports >= 3)
	end
end


