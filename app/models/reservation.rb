class Reservation < ApplicationRecord
  enum status: [ :canceled, :pending, :approved ]
  belongs_to :property
  belongs_to :guest
  belongs_to :review, optional: true


  def self.search_params
    binding.pry
  end





  private

  def self.overlapping?(property,str_dates = [])
    is_property = Reservation.where(property: property).exists?
    dates = str_dates.map{|d| d.to_date}
    
    is_property && dates_overlap?(dates) 
  end

  def self.dates_overlap?(dates)
    (dates.first..dates.last).any?{|d| Reservation.where(" ? BETWEEN checking_date AND checkout_date", d.strftime("%Y-%d-%m")).exists? }
  end

end
