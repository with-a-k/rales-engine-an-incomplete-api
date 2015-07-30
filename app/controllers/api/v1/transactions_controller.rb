class Api::V1::TransactionsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Transaction.all
  end

  def show
    respond_with Transaction.find_by(id: params['id'])
  end

  def random
    respond_with Transaction.all.sample
  end

  def invoice
    respond_with Transaction.find_by(id: params['transaction_id']).invoice
  end

  def find
    respond_with Transaction.find_by(find_param)
  end

  def find_all
    respond_with Transaction.where(find_param)
  end

  private

  def find_param
    attributes = %w(id invoice_id credit_card_number credit_card_expiration_date result created_at updated_at)
    attributes.each do |attribute|
      if params.has_key?(attribute)
        return { attribute.to_sym => params[attribute] }
      end
    end
  end
end
