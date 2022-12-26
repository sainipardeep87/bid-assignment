# frozen_string_literal: true

class Bid < ApplicationRecord

    def to_json
        {
            country: country,
            category: category,
            channel: channel,
            amount: amount
        }
    end
end
