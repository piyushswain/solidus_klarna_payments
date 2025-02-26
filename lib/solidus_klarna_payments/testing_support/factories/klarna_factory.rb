# frozen_string_literal: true

FactoryBot.define do
  factory :rand_store, parent: :store do
    sequence(:code) { |i| "spree_#{i * rand(99_999)}" }
  end

  factory :klarna_credit_payment_method, class: Spree::PaymentMethod::KlarnaCredit do
    name { 'Klarna' }
    description { 'Klarna' }

    preferences do
      {
        api_key: ENV.fetch("SOLIDUS_KLARNA_PAYMENTS_API_KEY") { "DUMMY" },
        api_secret: ENV.fetch("SOLIDUS_KLARNA_PAYMENTS_API_SECRET") { "DUMMY" },
        test_mode: ENV.fetch("SOLIDUS_KLARNA_PAYMENTS_TEST_MODE") { true },
        country: :us
      }
    end
  end

  factory :klarna_credit_payment, class: Spree::KlarnaCreditPayment do
    association(:payment_method, factory: :klarna_credit_payment_method)
    association(:user)
    association(:order)
    sequence(:order_id) { |n| "1234-123-#{n}" }
    sequence(:authorization_token) { |n| "asldfjasfdlasfaslkdfjaslkdfjhasifudp98q3h4irufhaosidufalsdf#{n}" }
    redirect_url { 'http://localhost:3000/someurl' }

    factory :error_klarna_credit_payment do
      error_code { 'NOT_VALID' }
      error_messages { 'Errored message' }
      sequence(:correlation_id) { |n| "2345-2345-#{n}" }
    end
  end

  factory :rand_store_order, parent: :order do
    association(:store, factory: :rand_store)
  end

  factory :klarna_payment, class: Spree::Payment do
    association(:payment_method, factory: :klarna_credit_payment_method)
    association(:source, factory: :klarna_credit_payment)
    association(:order)
  end

  factory :completed_klarna_order_with_promotion, parent: :order_with_line_items, class: "Spree::Order" do
    transient do
      promotion { nil }
    end

    after(:create) do |order, evaluator|
      promotion = evaluator.promotion || create(:promotion, code: "test")
      code = Spree::Promotion.last.codes.first
      promotion.activate(order: order, promotion_code: code)

      # Complete the order after the promotion has been activated
      order.refresh_shipment_rates
      order.update_column(:completed_at, Time.current)
      order.update_column(:state, "complete")
    end
  end
end
