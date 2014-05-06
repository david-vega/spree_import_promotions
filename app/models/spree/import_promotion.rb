require 'csv'

class Spree::ImportPromotion
  def self.import_csv(file)
    CSV.foreach(file.path, headers: true) do |row|
      promotion = generate_promotion(row)
    end
  end

  def self.generate_promotion(row)
    promotion = Spree::Promotion.new

    row.to_hash.each do |key, value|
      model_key = key.to_s.gsub(' ', '_').downcase
      promotion[model_key] = value if promotion.has_attribute?(model_key)
    end

    promotion.save!
  end
end
