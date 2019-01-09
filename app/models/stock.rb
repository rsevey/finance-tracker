class Stock < ApplicationRecord
    has_many :user_stocks
    has_many :users, through: :user_stocks

    def self.find_by_ticker(ticker_symbol)
      where(ticker: ticker_symbol).first
    end

    def self.new_from_lookup(ticker_symbol)

      looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
      return nil unless looked_up_stock.name

      new_stock = new(name: looked_up_stock.name, ticker: looked_up_stock.symbol)
      new_stock.last_price = new_stock.price
      new_stock
            price = looked_up_stock.latest_price
            new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: price)
      rescue Exception => e
        return nil
      end

    def price
      closing_price = StockQuote::Stock.quote(ticker).closing_price
      return "#{closing_price} (Closing)" if closing_price
      
      opening_price = StockQuote::Stock.quote(ticker).opening_price
      return "#{opening_price} (Opening)" if opening_price
      'Unavailable'
    end
  end

