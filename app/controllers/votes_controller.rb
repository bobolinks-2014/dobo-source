class VotesController < ApplicationController
	before_filter :authenticate_user!
	respond_to :json
	
	def create
		@vote = Vote.new(vote_params)
		
		respond_to do |format|
			
			if already_voted?
				format.json { render json: { vote: @vote, voted: 0, message: "You previously voted on that"}.to_json }
			else
				@vote.save
				format.json { render json: { vote: @vote , voted: 1, message: "Thanks for voting!"}.to_json}
			end
		
		end

	end


	private

	def vote_params
		params.require(:vote).permit(:tally_id, :tally_type).merge!(user_id: current_user.id)
	end

	def already_voted?
		Vote.all.where(user: current_user, tally_id: @vote.tally_id, tally_type: @vote.tally_type).count != 0
	end

end
