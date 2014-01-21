#!/usr/bin/env ruby

require 'CFPropertyList'
plist = CFPropertyList::List.new(:file => '/Library/Preferences/SystemConfiguration/NetworkInterfaces.plist')
plist_data = CFPropertyList.native_types(plist.value)
puts plist_data['Interfaces'][0]['BSD Name']
