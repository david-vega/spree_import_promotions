require 'csv'

class Spree::ImportPromotion

  def self.import_csv(file)
    CSV.foreach(file.path, headers: true) do |row|
      binding.pry
      data = row.to_hash
      promotion = find_or_create_promotion(data)
      action(data['AMOUNT'], promotion)
    end
  end

  def self.find_or_create_promotion(row)
    promotion = Spree::Promotion.find_by_code(row['CODE'])

    unless promotion
      promotion = Spree::Promotion.new

      row.each do |key, value|
        model_key = key.to_s.gsub(' ', '_').downcase
        promotion[model_key] = value if promotion.has_attribute?(model_key)
      end

      promotion.save!
    end
    promotion
  end

  def self.action(amount, promotion)
    calculator = Spree::Calculator::FlatRate.create(preferred_amount: amount)
    promotion = Spree::Promotion::Actions::CreateAdjustment.create(promotion: promotion,
                                                            calculator: calculator)
  end
end
