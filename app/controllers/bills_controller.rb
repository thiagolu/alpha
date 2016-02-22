class BillsController < ApplicationController

	# before_filter :find_model

	def index
		
	end

	def new
		@bill = Bill.new
	end

	def create
		
	end

	def show
		
	end

	private
	def find_model
		@model = Bills.find(params[:id]) if params[:id]
	end
end