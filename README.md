# AbnLookup

ABN Lookup is the free public view of the Australian Business Register (ABR). It provides access to publicly available information supplied by businesses when they register for an Australian Business Number (ABN).

This gem provide a easy way to consume the JSON api.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add abn_lookup

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install abn_lookup

## Usage

First step is configure you GUID key. You can request a GUID key [here](https://abr.business.gov.au/Tools/WebServices) in contact us session

```ruby
AbnLookup.guid = "your_GUID_key"
```

This is a global configuration, all api calls will use this configuration.

If you are using Ruby On Rails you can put this in initializer folder.
### Search by ABN

```ruby
AbnLookup.search_by_abn("26008672179")

{"Abn"=>"26008672179",
 "AbnStatus"=>"Active",
 "AbnStatusEffectiveFrom"=>"1999-11-01",
 "Acn"=>"008672179",
 "AddressDate"=>"2022-01-13",
 "AddressPostcode"=>"3121",
 "AddressState"=>"VIC",
 "BusinessName"=>
  ["Dynamic Pods",
   "Dynamic Steel Frame",
   "TOOL KIT DEPOT",
   "CRAFTRIGHT",
   "ONYA PRO",
   "PROJECT GEAR",
   "PROJECT TOOLS",
   "Benchmark Tools",
   "ONYA Tools",
   "GARDENBASICS",
   "ADELAIDE TOOLS",
   "Adelaide Trade Tools",
   "Discount Power Tools (S.A.)",
   "Electric Power Tool Services",
   "Oaklands Mower Centre",
   "Oaklands Road Mower Centre",
   "Tools not Toys",
   "CLEVER LIVING CO",
   "BUNNINGS KITCHEN COLLECTIVE",
   "THE KITCHEN COLLECTIVE CO",
   "home@gladesville",
   "Gladesville Homemaker Centre",
   "Bunnings Outdoors",
   "big prawn",
   "BUNNINGS TRADE",
   "BUNNINGS",
   "NARELLAN HOMEMAKER CENTRE",
   "BUNNINGS WAREHOUSE",
   "HARDWARE CAFE"],
 "EntityName"=>"BUNNINGS GROUP LIMITED",
 "EntityTypeCode"=>"PUB",
 "EntityTypeName"=>"Australian Public Company",
 "Gst"=>"2000-07-01",
 "Message"=>""}
```
### Search by ACN

```ruby
AbnLookup.search_by_acn("008672179")

{"Abn"=>"26008672179",
 "AbnStatus"=>"Active",
 "AbnStatusEffectiveFrom"=>"1999-11-01",
 "Acn"=>"008672179",
 "AddressDate"=>"2022-01-13",
 "AddressPostcode"=>"3121",
 "AddressState"=>"VIC",
 "BusinessName"=>
  ["Dynamic Pods",
   "Dynamic Steel Frame",
   "TOOL KIT DEPOT",
   "CRAFTRIGHT",
   "ONYA PRO",
   "PROJECT GEAR",
   "PROJECT TOOLS",
   "Benchmark Tools",
   "ONYA Tools",
   "GARDENBASICS",
   "ADELAIDE TOOLS",
   "Adelaide Trade Tools",
   "Discount Power Tools (S.A.)",
   "Electric Power Tool Services",
   "Oaklands Mower Centre",
   "Oaklands Road Mower Centre",
   "Tools not Toys",
   "CLEVER LIVING CO",
   "BUNNINGS KITCHEN COLLECTIVE",
   "THE KITCHEN COLLECTIVE CO",
   "home@gladesville",
   "Gladesville Homemaker Centre",
   "Bunnings Outdoors",
   "big prawn",
   "BUNNINGS TRADE",
   "BUNNINGS",
   "NARELLAN HOMEMAKER CENTRE",
   "BUNNINGS WAREHOUSE",
   "HARDWARE CAFE"],
 "EntityName"=>"BUNNINGS GROUP LIMITED",
 "EntityTypeCode"=>"PUB",
 "EntityTypeName"=>"Australian Public Company",
 "Gst"=>"2000-07-01",
 "Message"=>""}
```
### Search by Name

```ruby
AbnLookup.search_by_name("Dynamic Pods", max_result = 10)

{"Message"=>"",
 "Names"=>
  [{"Abn"=>"89619123287", "AbnStatus"=>"0000000001", "IsCurrent"=>true, "Name"=>"Dynamic Pods", "NameType"=>"Business Name", "Postcode"=>"3111", "Score"=>100, "State"=>"VIC"},
   {"Abn"=>"26008672179", "AbnStatus"=>"0000000001", "IsCurrent"=>true, "Name"=>"Dynamic Pods", "NameType"=>"Business Name", "Postcode"=>"3121", "Score"=>100, "State"=>"VIC"},
   {"Abn"=>"89619123287", "AbnStatus"=>"0000000001", "IsCurrent"=>true, "Name"=>"DYNAMIC PODS PTY LTD", "NameType"=>"Entity Name", "Postcode"=>"3111", "Score"=>99, "State"=>"VIC"},
   {"Abn"=>"47051861468", "AbnStatus"=>"0000000002", "IsCurrent"=>true, "Name"=>"@ DYNAMIC PTY LTD", "NameType"=>"Entity Name", "Postcode"=>"2000", "Score"=>94, "State"=>"NSW"},
   {"Abn"=>"91451385418", "AbnStatus"=>"0000000002", "IsCurrent"=>true, "Name"=>"DYNAMIC", "NameType"=>"Trading Name", "Postcode"=>"4105", "Score"=>94, "State"=>"QLD"},
   {"Abn"=>"55666163917", "AbnStatus"=>"0000000001", "IsCurrent"=>true, "Name"=>"DYNAMIC CO PTY LTD", "NameType"=>"Entity Name", "Postcode"=>"4035", "Score"=>94, "State"=>"QLD"},
   {"Abn"=>"47294848908", "AbnStatus"=>"0000000002", "IsCurrent"=>true, "Name"=>"DYNAMIC PTY LTD", "NameType"=>"Trading Name", "Postcode"=>"3204", "Score"=>94, "State"=>"VIC"},
   {"Abn"=>"63006924349", "AbnStatus"=>"0000000002", "IsCurrent"=>true, "Name"=>"DYNAMIC PTY. LTD.", "NameType"=>"Entity Name", "Postcode"=>"3059", "Score"=>94, "State"=>"VIC"},
   {"Abn"=>"84622042537", "AbnStatus"=>"0000000002", "IsCurrent"=>true, "Name"=>"DYnamic", "NameType"=>"Trading Name", "Postcode"=>"2000", "Score"=>94, "State"=>"NSW"},
   {"Abn"=>"55274753082", "AbnStatus"=>"0000000001", "IsCurrent"=>true, "Name"=>"Dynamic", "NameType"=>"Other Name", "Postcode"=>"5085", "Score"=>94, "State"=>"SA"}]}
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lairtonmendes/abn_lookup. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/lairtonmendes/abn_lookup/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AbnLookup project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/lairtonmendes/abn_lookup/blob/master/CODE_OF_CONDUCT.md).
