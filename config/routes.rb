# frozen_string_literal: true

SolidusKlarnaPayments::Engine.routes.draw do
  post '/callbacks/notification', to: '/solidus_klarna_payments/callbacks#notification', as: :notification
  post '/callbacks/push', to: '/solidus_klarna_payments/callbacks#push', as: :push

  post '/sessions', to: '/solidus_klarna_payments/sessions#create'
  get '/sessions', to: '/solidus_klarna_payments/sessions#show'
  get '/sessions/order_addresses', to: '/solidus_klarna_payments/sessions#order_addresses'

  post '/api/sessions', to: '/solidus_klarna_payments/api/sessions#create'
  get '/api/sessions', to: '/solidus_klarna_payments/api/sessions#show'
  get '/api/sessions/order_addresses', to: '/solidus_klarna_payments/api/sessions#order_addresses'
end
