module GoTransverseTractApi

  module Usage

    class ProductUsageRule

      class << self

        #
        # @param {Long} eid
        #
        def find_by_eid eid
          GoTransverseTractApi.get_response_for(self, {eid: eid})
        end

        #
        # @param {Long} product_eid
        #
        def find_by_product_eid product_eid
          GoTransverseTractApi.get_response_for(self, {product_eid: product_eid})
        end

        #
        # @param {Long} product_price_eid
        #
        def find_by_product_price_eid product_price_eid
          GoTransverseTractApi.get_response_for(self, {product_price_eid: product_price_eid})
        end

        #
        # @param {String} status
        #
        def find_by_status status
          GoTransverseTractApi.get_response_for(self, {status: status})
        end

      end

    end

  end

end
