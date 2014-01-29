#
# Class profile::bt_m_k
# Sets up bluetooth mouse and keyboard.
# We are using a hash of mice and keyboards along with host names,
# this will set defaults in the files
# /Library/Preferences/com.apple.Bluetooth.plist
# (the devices that should be connected)
# and
# ~/Library/Preferences/ByHost/com.apple.Bluetooth.HOSTNAME.plist
# (the favourite devices)
#
# REQUIREMENTS - property_list_key
#
class profile::bt_m_k {
# bt1 and bt2 are bluetooth device 1 and bluetoth device 2
# (not sure which is mouse and which is keyboard)
  $my_hosts = {
    wdc-cch03pc => { bt1 => 'd4-9a-20-87-c7-ab', bt2 => '7c-6d-62-40-10-8b' },
    wdc-cch04pc => { bt1 => '7c-6d-62-ee-af-3f', bt2 => '7c-6d-62-3e-21-8c' },
    wdc-cch05pc => { bt1 => '7c-6d-62-40-10-c5', bt2 => '7c-6d-62-e8-45-3c' },
    wdc-cch06pc => { bt1 => '7c-6d-62-ee-7f-77', bt2 => '7c-6d-62-3e-21-52' },
    wdc-cch07pc => { bt1 => 'd4-9a-20-85-8a-62', bt2 => '90-84-0d-ff-2e-aa' },
    wdc-cch08pc => { bt1 => '7c-6d-62-3e-29-33', bt2 => '7c-6d-62-ef-06-cd' },
    wdc-cch09pc => { bt1 => '7c-6d-62-3e-60-80', bt2 => 'd4-9a-20-87-6a-dc' },
    wdc-cch10pc => { bt1 => '90-84-0d-ff-b7-d9', bt2 => '7c-6d-62-ee-7f-77' },
    wdc-cch11pc => { bt1 => '7c-6d-62-3e-96-49', bt2 => 'd4-9a-20-81-b2-b3' },
    wdc-cch12pc => { bt1 => '7c-6d-62-3e-12-ef', bt2 => 'd4-9a-20-7e-e4-79' },
    wdc-cch13pc => { bt1 => '7c-6d-62-3f-0c-8a', bt2 => '34-15-9e-c9-b2-8b' },
    wdc-cch14pc => { bt1 => '7c-6d-62-3e-21-46', bt2 => '7c-6d-62-e9-7b-51' },
    wdc-cch15pc => { bt1 => '7c-6d-62-ee-79-01', bt2 => '90-84-0d-ff-b9-a6' },
    wdc-cch16pc => { bt1 => '90-84-0d-ff-b9-cc', bt2 => '7c-6d-62-ec-72-41' },
    wdc-cch17pc => { bt1 => '34-15-9e-d0-0a-44', bt2 => '7c-6d-62-3e-bd-66' },
  }
# bt_dev1 the var we are passing to the templates!
  if ( $my_hosts[$::hostname] ) {
    $bt_dev1=$my_hosts[$::hostname][bt1]
    $bt_dev2=$my_hosts[$::hostname][bt2]

# bt_prefs - the location for the bluetooth preferences file
# bt_prefs_bh_ch - the prefs by host location for clubhouse user
# bt_prefs_bh_ad - the prefs by host location for admininistrator user
# bad coding - repetitive and inflexible bu should work for now!
#
    $bt_prefs='/Library/Preferences/com.apple.Bluetooth.plist'
    $bt_prefs_bh_ch="/Users/.clubhouse/Library/Preferences/ByHost/com.apple.Bluetooth.${::sp_platform_uuid}.plist"
    $bt_prefs_bh_ad="/Users/Administrator/Library/Preferences/ByHost/com.apple.Bluetooth.${::sp_platform_uuid}.plist"
    property_list_key { 'ch_mk':
      path       => $bt_prefs_bh_ch,
      key        => 'FavouriteDevices',
      value      => [ $bt_dev1, $bt_dev2 ],
      value_type => 'array',
    }
    property_list_key { 'ad_mk':
      path       => $bt_prefs_bh_ad,
      key        => 'FavouriteDevices',
      value      => [ $bt_dev1, $bt_dev2 ],
      value_type => 'array',
    }
    property_list_key { 'sys_mk_HID':
      path       => $bt_prefs,
      key        => 'HIDDevices',
      value      => [ $bt_dev1, $bt_dev2 ],
      value_type => 'array',
    }
    property_list_key { 'sys_mk_PAIRED':
      path       => $bt_prefs,
      key        => 'PairedDevices',
      value      => [ $bt_dev1, $bt_dev2 ],
      value_type => 'array',
    }
  }
}
