class BidsController < ApplicationController

    def index
        query = {}
        query[:country] = params[:countries].split(',') if params[:countries].present?
        query[:category] = params[:categories].split(',') if params[:categories].present?
        query[:channel] = params[:channel].split(',') if params[:channel].present?

        bids = Bid.where(query)
        render json: {bids: bids.map(&:to_json)}
    end

    def create
        bid = Bid.new(bid_params)
        return render json: {message: 'success', bid: bid.to_json} if bid.save
        render json: {message: 'error', errors: bid.errorsd}
    end

    private

    def bid_params
        params.require(:bid).permit(:country, :category, :channel, :amount)
    end
end