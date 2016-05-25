Spree::Api::ShipmentsController.class_eval do

  def deliver
    find_and_update_shipment
    unless @shipment.delivered?
      @shipment.deliver!
    end
    respond_with(@shipment, default_template: :show)
  end

end
