module AbnLookup
  module Test
    def self.stub_search_by_abn(abn, result)
      SearchByAbn.stubs[abn] = result
    end

    def self.stub_search_by_acn(acn, result)
      SearchByAcn.stubs[acn] = result
    end

    def self.stub_search_by_name(name, result)
      SearchByName.stubs[name] = result
    end

    def self.clear_stubs
      SearchByAbn.stubs.clear
      SearchByAcn.stubs.clear
      SearchByName.stubs.clear
    end

    def self.set_default_stub(result)
      SearchByAbn.default_stub = result
      SearchByAcn.default_stub = result
      SearchByName.default_stub = result
    end
  end
end
