class VotesController < ApplicationController
	before_filter :authenticate_user!
	respond_to :json
	
	def create
		# raise "vasdfasdfasdf"


		@vote = Vote.new(vote_params)
		respond_to do |format|
			if @vote.save
				format.json { render json: @vote.to_json }
			else
				format.json { render json: { problem: "vote didn't save" }.to_json}
			end
		end

	end


	private

	def vote_params
		params.require(:vote).permit(:tally_id, :tally_type).merge!(user_id: current_user.id)
	end

end
