class Stock < ApplicationRecord

    def self.new_from_lookup(ticker_symbol)
            looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
            price = looked_up_stock.latest_price
            new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: price)
        end
    end

