module ActiveRecord
  module ConnectionAdapters
    SQLiteAdapter.class_eval do
      def native_database_types_with_uuid_support
        a = native_database_types_without_uuid_support
        a[:uuid] = {:name => 'varchar', :limit => 36}
        return a
      end
      alias_method_chain :native_database_types, :uuid_support
    end if ActiveRecord::Base.connection.adapter_name == 'SQLite'

    if ActiveRecord::Base.connection.adapter_name == 'PostgreSQL'
      PostgreSQLAdapter.class_eval do
        def native_database_types_with_uuid_support
          a = native_database_types_without_uuid_support
          a[:uuid] = {:name => 'uuid'}
          return a
        end
        alias_method_chain :native_database_types, :uuid_support
      end

      PostgreSQLColumn.class_eval do
        def simplified_type_with_uuid_support(field_type)
          if field_type == 'uuid'
            :uuid
          else
            simplified_type_without_uuid_support(field_type)
          end
        end
        alias_method_chain :simplified_type, :uuid_support
      end
    end
  end
end