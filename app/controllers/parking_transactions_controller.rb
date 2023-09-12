class ParkingTransactionsController < ApplicationController

  def index
    @parking_transactions = ParkingTransaction.all
    respond_to do |format|
      format.json
    end
  end
end
