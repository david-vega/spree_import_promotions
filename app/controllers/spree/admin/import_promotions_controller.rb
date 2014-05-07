class Spree::Admin::ImportPromotionsController < Spree::Admin::BaseController
  def new

  end

  def create
    file = params[:file]
    if !file || !valid_csv_extension?(file) || !valid_encoding?(file)
      flash_message = { error: 'File is invalid, please try again' }
    else
      Spree::ImportPromotion.import_csv(file)
      flash_message = { success: 'Your import has been processed' }
    end

    redirect_to new_admin_import_promotions_path, flash: flash_message
  end

  private

  def valid_csv_extension?(file)
    file.original_filename[-3..-1].downcase == 'csv'
  end

  def valid_encoding?(file)
    file.read.force_encoding('iso8859-1').encode('utf-8').valid_encoding?
  end
end
