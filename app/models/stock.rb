class Stock < ApplicationRecord
    has_many :user_stocks
    has_many :users, through: :user_stocks

    def self.find_by_ticker(ticker_symbol)
      where(ticker: ticker_symbol).first
    end

    def self.new_from_lookup(ticker_symbol)
            looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
            price = looked_up_stock.latest_price
            pclose = looked_up_stock.previous_close
            mcap = looked_up_stock.market_cap
            pe = looked_up_stock.pe_ratio
            change = looked_up_stock.change
            new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: price,
               pe: looked_up_stock.pe_ratio, high: looked_up_stock.high, pclose: looked_up_stock.previous_close,
                mcap: looked_up_stock.market_cap, change: looked_up_stock.change )
      rescue Exception => e
        return nil
      end
    end

