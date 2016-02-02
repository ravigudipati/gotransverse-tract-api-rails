module GoTransverseTractApi

  module Order

    class OrderItem

      #
      # @param {Long} eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_eid eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
      end

      #
      # @param {Long} order_eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_order_eid order_eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {order_eid: order_eid, queryScope: query_scope})
      end

      #
      # @param {String} order_num
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_order_num order_num, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {order_num: order_num, queryScope: query_scope})
      end

      #
      # @param {Long} product_eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_product_eid product_eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {product_eid: product_eid, queryScope: query_scope})
      end

      #
      # @param {Long} parent_order_item_eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_parent_order_item_eid parent_order_item_eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {parent_order_item_eid: parent_order_item_eid, queryScope: query_scope})
      end

      #
      # @param {String} service_identifier
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_service_identifier service_identifier, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {service_identifier: service_identifier, queryScope: query_scope})
      end

      #
      # @param {Long} service_eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_service_eid service_eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {service_eid: service_eid, queryScope: query_scope})
      end

      #
      # @param {String} discount_identifier
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_discount_identifier discount_identifier
        GoTransverseTractApi.get_response_for(self, {discount_identifier: discount_identifier, queryScope: query_scope})
      end

      #
      # @param {Long} eid
      # @param {Hash} order_item
      #
      def self.approve eid, order_item
        api_data = GoTransverseTractApi::ApiData.new

        data = {
          approveOrderItem: {
            approvalDate: order_item[:approval_date],
          },
          orderItem: {
            attributes: {
              xsitype: order_item[:type],
              awaitingApproval: order_item[:awaiting_approval],
              requestedEffectiveDate: order_item[:requested_effective_date],
              unitPrice: order_item[:unit_price],
              recurringUnitPrice: order_item[:recurring_unit_price],
              quantity: order_item[:quantity],
              sequence: order_item[:sequence],
              approvalDate: order_item[:date_approval],
              description: order_item[:description],
              eid: eid
            },
            orderItems: api_data.get_page_info(order_item[:order_items]),
            orderItemUsageRules: api_data.get_page_info(order_item[:order_item_usage_rules]),
            recurringProductPrice: {
              attributes: {
                fromDate: order_item[:recurring_product_price][:from_date],
                priceOverride: order_item[:recurring_product_price][:price_override],
                type: order_item[:recurring_product_price][:type],
                paymentOnPurchaseRequired: order_item[:recurring_product_price][:payment_on_purchase_required],
                recurringPaymentRequired: order_item[:recurring_product_price][:recurring_payment_required],
                recurrencePeriod: order_item[:recurring_product_price][:recurrence_period],
                eid: order_item[:recurring_product_price][:eid]
              },
              priceRanges: {
                attributes: api_data.get_page_info(order_item[:recurring_product_price][:price_ranges]),
                priceRange: {
                  quantityBeginRange: order_item[:recurring_product_price][:price_ranges][:price_range][:quantity_begin_range],
                  price: order_item[:recurring_product_price][:price_ranges][:price_range][:price],
                  level: order_item[:recurring_product_price][:price_ranges][:price_range][:level],
                  eid: order_item[:recurring_product_price][:price_ranges][:price_range][:eid]
                }
              }
            },
            product: {
              attributes: {
                name: order_item[:product][:name],
                description: order_item[:product][:description],
                shortDescription: order_item[:product][:short_description],
                productTypeCode: order_item[:product][:product_type_code],
                productState: order_item[:product][:product_state],
                requiresAgreement: order_item[:product][:requires_agreement],
                serialized: order_item[:product][:serialized],
                taxable: order_item[:product][:taxable],
                trial: order_item[:product][:trial],
                defaultQuantity: order_item[:product][:default_quantity],
                internalName: order_item[:product][:internal_name],
                minServiceResources: order_item[:product][:min_service_resources],
                maxServiceResources: order_item[:product][:max_service_resources],
                trialOverride: order_item[:product][:trial_override],
                eid: order_item[:product][:eid]
              },
              productPrices: {
                attributes: api_data.get_page_info(order_item[:product][:product_prices]),
                productPrice: {
                  attributes: {
                    fromDate: order_item[:product][:product_prices][:product_price][:from_date],
                    priceOverride: order_item[:product][:product_prices][:product_price][:price_override],
                    type: order_item[:product][:product_prices][:product_price][:type],
                    paymentOnPurchaseRequired: order_item[:product][:product_prices][:product_price][:payment_on_purchase_required],
                    recurringPaymentRequired: order_item[:product][:product_prices][:product_price][:recurring_payment_required],
                    recurrencePeriod: order_item[:product][:product_prices][:product_price][:recurrence_period],
                    eid: order_item[:product][:product_prices][:product_price][:eid]
                  },
                  priceRanges: {
                    attributes: api_data.get_page_info(order_item[:product][:product_prices][:product_price][:price_ranges]),
                    priceRange: {
                      quantityBeginRange: order_item[:product][:product_prices][:product_price][:price_ranges][:price_range][:quantity_begin_range],
                      price: order_item[:product][:product_prices][:product_price][:price_ranges][:price_range][:price],
                      level: order_item[:product][:product_prices][:product_price][:price_ranges][:price_range][:level],
                      eid: order_item[:product][:product_prices][:product_price][:price_ranges][:price_range][:eid]
                    }
                  }
                }
              },
              productCategory: {
                name: order_item[:product][:product_category][:name],
                description: order_item[:product][:product_category][:description],
                status: order_item[:product][:product_category][:status],
                eid: order_item[:product][:product_category][:eid]
              },
              serviceResourceCategory: {
                name: order_item[:product][:service_resource_category][:name],
                type: order_item[:product][:service_resource_category][:type],
                status: order_item[:product][:service_resource_category][:status],
                eid: order_item[:product][:service_resource_category][:eid]
              },
              actions: api_data.get_page_info(order_item[:product][:actions]),
              productUsageRules: api_data.get_page_info(order_item[:product][:product_usage_rules])
            },
            priceList: {
              name: order_item[:price_list][:name],
              eid: order_item[:price_list][:eid]
            },
            serviceResources: api_data.get_page_info(order_item[:service_resources]),
            operationAttributes: api_data.get_page_info(order_item[:operation_attributes]),
            scheduledCharges: api_data.get_page_info(order_item[:scheduled_charges])
          }
        }

        xml_data = GoTransverseTractApi.generateXML(data, 'approveOrderItem')
        GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "approve")
      end

      #
      # @param {Long} eid
      # @param {Hash} orderitem
      #
      def self.deny eid, orderitem
        data = {
          denyOrderItem: {},
          orderItem: {eid: eid}
        }

        xml_data = GoTransverseTractApi.generateXML(data, 'denyOrderItem')
        GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "deny")
      end

      #
      # @param {Hash} order_item
      #

      def self.get_order_item(order_item)
        if order_item.has_key?(:price_list)
          price_list = Product::PriceList.get_price_list(order_item[:price_list])
        end

        if order_item.has_key?(:inventory_item)
          inventory_item = InventoryItem.get_inventory_item(order_item[:inventory_item])
        end

        if order_item.has_key?(:scheduled_charges)
          scheduled_charges = ScheduledCharge.get_scheduled_charges(order_item[:scheduled_charges])
        end

        if order_item.has_key?(:discount_configurations)
          discount_configurations = DiscountConfiguration.get_discount_configurations(order_item[:discount_configurations])
        end

        orderItem = {
          attributes: {
            awaitingApproval: order_item[:awaiting_approval],
            requestedEffectiveDate: order_item[:requested_effective_date],
            unitPrice: order_item[:unit_price],
            recurringUnitPrice: order_item[:recurring_unit_price],
            quantity: order_item[:quantity],
            sequence: order_item[:sequence],
            description: order_item[:description],
            eid: order_item[:eid]
          }.delete_if{|k,v| v.nil?},
          orderItemUsageRules: OrderItemUsageRule.get_order_item_usage_rule(order_item[:order_item_usage_rules]),
          recurringProductPrice: RecurringProductPrice.get_recurring_product_price(order_item[:recurring_product_price]),
          product: Product::Product.get_product_info(order_item[:product]),
          priceList: price_list,
          selectedAgreement: Agreement.get_selected_agreement(order_item[:selected_agreement]),
          serviceResources: Service::ServiceResource.get_service_resource(order_item[:service_resources]),
          inventoryItem: inventory_item, 
          agreementConfiguration: AgreementConfiguration.get_agreement_conf(order_item[:agreement_configuration]),
          scheduledCharges: scheduled_charges, 
          discountConfigurations: discount_configurations
        }

        orderItem.delete_if{|k,v| v.nil?}
      end

    end

  end

end
