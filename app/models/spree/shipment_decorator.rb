Spree::Shipment.class_eval do

  scope :delivered, -> { with_state('delivered') }

  state_machine initial: :pending, use_transactions: false do
    event :deliver do
      transition from: :shipped, to: :delivered
    end
    after_transition to: :delivered, do: :after_deliver
  end

  private

    def after_deliver
      Spree::ShipmentHandler.factory(self).send :update_order_shipment_state
    end

end
