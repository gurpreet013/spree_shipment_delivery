Spree::ShipmentController.class_eval do

  before_action :find_and_update_shipment, only: [:deliver]

  def deliver
    unless @shipment.delivered?
      @shipment.deliver!
    end
    respond_with(@shipment, default_template: :show)
  end

end
