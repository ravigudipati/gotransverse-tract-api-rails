module GoTransverseTractApi

  module Product

    class RecurringProductPrice < ProductPrice

      class << self

        #
        # @param {Long} recurrence_period
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_recurrence_period recurrence_period, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {recurrence_period: recurrence_period, queryScope: query_scope})
        end

        #
        # @param {Long} recurrence_amount
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_recurrence_amount recurrence_amount, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {recurrence_amount: recurrence_amount, queryScope: query_scope})
        end

        #
        # @param {Boolean} recurring_payment_required
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_recurring_payment_required recurring_payment_required, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {recurring_payment_required: recurring_payment_required, queryScope: query_scope})
        end

        #
        # @param {Boolean} bill_in_advance
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_bill_in_advance bill_in_advance, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {bill_in_advance: bill_in_advance, queryScope: query_scope})
        end

        #
        # @param {Boolean} prorated_on_cancel
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_prorated_on_cancel prorated_on_cancel, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {prorated_on_cancel: prorated_on_cancel, queryScope: query_scope})
        end

        #
        # @param {Boolean} prorated_on_order
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_prorated_on_order prorated_on_order, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {prorated_on_order: prorated_on_order, queryScope: query_scope})
        end

        #
        # @param {Boolean} prorated_on_order_no_charge
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_prorated_on_order_no_charge prorated_on_order_no_charge, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {prorated_on_order_no_charge: prorated_on_order_no_charge, queryScope: query_scope})
        end

      end

    end

  end

end
