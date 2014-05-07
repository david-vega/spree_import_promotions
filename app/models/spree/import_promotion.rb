require 'csv'

class Spree::ImportPromotion

  def self.import_csv(file)
    CSV.foreach(file.path, headers: true) do |row|
      data = row.to_hash

      promotion = find_or_create_promotion(data)
      promotion.actions.destroy_all
      promotion.actions << action(data['AMOUNT'])

      promotion
    end
  end

  private

  def self.find_or_create_promotion(row)
    promotion = Spree::Promotion.find_by_code(row['CODE'])

    unless promotion
      promotion = create_promotion(row)
    end

    promotion
  end

  def self.create_promotion(row)
    promotion = Spree::Promotion.new

    row.each do |key, value|
      model_key = key.to_s.gsub(' ', '_').downcase
      promotion[model_key] = value if promotion.has_attribute?(model_key)
    end
    promotion.save!
    promotion
  end

  def self.action(amount)
    calculator = Spree::Calculator::FlatRate.new(preferred_amount: amount)
    promotion = Spree::Promotion::Actions::CreateAdjustment.new(calculator: calculator)
  end
end
