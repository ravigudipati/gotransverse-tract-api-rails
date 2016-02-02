module GoTransverseTractApi

  module Service

    class ServiceResource

      class << self

        #
        # @param {Long} eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_eid eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
        end

        #
        # @param {Long} service_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_service_eid service_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {service_eid: service_eid, queryScope: query_scope})
        end

        #
        # @param {Long} order_item_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_order_item_eid order_item_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {order_item_eid: order_item_eid, queryScope: query_scope})
        end

        #
        # @param {Long} service_resource_category_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_service_resource_category_eid service_resource_category_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {service_resource_category_eid: service_resource_category_eid, queryScope: query_scope})
        end

        #
        # @param {Long} identifier
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_identifier identifier, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {identifier: identifier, queryScope: query_scope})
        end

        #
        # @param {String} status
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_status status, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {status: status, queryScope: query_scope})
        end

        #
        # @param {String} description
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_description description, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {description: description, queryScope: query_scope})
        end

        #
        # @param {Hash} service_resource
        #
        def request service_resource
          data = {
            requestServiceResource: {
              identifier: service_resource[:identifier],
              status: service_resource[:status],
              description: service_resource[:description]
            },
            serviceResourceCategory: {eid: service_resource[:service_resource_category][:eid]}
          }
          xml_data = GoTransverseTractApi.generateXML(data, 'requestServiceResource')
          GoTransverseTractApi.post_request_for(self, {}, xml_data, "request")
        end

        #
        # @param {Long} eid
        # @param {Hash} service_resource
        #
        def change eid, service_resource
          data = {
            changeServiceResource: {},
            serviceResource: {eid: eid},
            changeToServiceResource: {
              attributes: {
                identifier: service_resource[:change_to_service_resource][:identifier],
                status: service_resource[:change_to_service_resource][:status],
                description: service_resource[:change_to_service_resource][:description]
              },
              category: {eid: service_resource[:category][:eid]}
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'changeServiceResource')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "change")
        end

        #
        # @param {Long} eid
        # @param {Hash} service_resource
        #
        def deactivate eid, service_resource
          data = {
            deactivateServiceResource: {},
            serviceResource: {eid: eid}
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'deactivateServiceResource')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "deactivate")
        end

        #
        # @param {Hash} service_resource
        #
        def create_service_resource service_resource
          data = {
            serviceResource: {
              identifier: service_resource[:identifier],
              status: service_resource[:status],
              description: service_resource[:description]
            },
            category: {eid: service_resource[:category][:eid]}
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'serviceResource')
          GoTransverseTractApi.post_request_for(self, {}, xml_data, "")
        end

        #
        # @param {Long} eid
        # @param {Hash} service_resource
        #
        def update eid, service_resource
          data = {
            serviceResource: {
              eid: eid,
              identifier: service_resource[:identifier],
              description: service_resource[:description]
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'serviceResource')
          GoTransverseTractApi.put_request_for(self, {eid: eid}, xml_data)
        end

        #
        # @param {Long} eid
        # @param {Hash} service_resource
        #
        def add_service_resource eid, service_resource
          data = {
            addServiceResourceToService: {},
            service: {eid: eid},
            serviceResource: {
              attributes: {
                identifier: service_resource[:identifier]
              },
              category: {eid: service_resource[:category][:eid]}
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'addServiceResourceToService')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "addServiceResource")
        end

        #
        # @param {Long} eid
        # @param {Hash} service_resource
        #
        def remove_service_resource eid, service_resource
          data = {
            removeServiceResourceFromService: {},
            service: {eid: eid},
            serviceResource: {eid: service_resource[:eid]}
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'removeServiceResourceFromService')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "removeServiceResource")
        end

        #
        # @param {Hash} service_resource
        #
        def get_service_resource service_resources
          svc_resource = service_resources[:service_resource]
          service_resource = {
            attributes: {}, 
            serviceResource: {
              attributes: {
                eid: svc_resource[:eid],
                identifier: svc_resource[:identifier],
                description: svc_resource[:description],
                autoSelect: svc_resource[:autoSelect],
                status: svc_resource[:status]
              }.delete_if{|k,v| v.nil?},
              category: {
                eid: svc_resource[:category].try(:[],:eid),
                name: svc_resource[:category].try(:[],:name),
                type: svc_resource[:category].try(:[],:type),
                status: svc_resource[:category].try(:[],:status)
              }.delete_if{|k,v| v.nil?}
            }
          }

          service_resource
        end
      end

    end

  end

end
