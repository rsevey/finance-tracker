class Stock < ApplicationRecord

    def self.new_from_lookup(ticker_symbol)
        puts '========='
        p ticker_symbol
        begin
            looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
            p looked_up_stock
            price = looked_up_stock.latest_price
            p price
            new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: price)
        rescue Exception => e
            puts '----rescue----'
            nil
          end
        end
    end

