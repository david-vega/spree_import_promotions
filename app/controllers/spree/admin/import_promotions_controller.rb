class Spree::Admin::ImportPromotionsController < Spree::Admin::BaseController
  def new

  end

  def create

  end

  private

  def valid_csv_extension?(file)
    file.original_filename[-3..-1].downcase == 'csv'
  end

  def valid_encoding?(file)
    file.read.force_encoding('iso8859-1').encode('utf-8').valid_encoding?
  end
end
