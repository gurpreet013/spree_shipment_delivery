Spree::Shipment.class_eval do

  scope :delivered, -> { with_state('delivered') }

  state_machine initial: :pending, use_transactions: false do
    event :deliver do
      transition from: :shipped, to: :delivered
    end
  end

end
