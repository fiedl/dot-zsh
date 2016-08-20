!#/usr/bin/env ruby

require 'active_support/inflector'

def convert_keycode_string(str)
  str = str.gsub " shift", ", ModifierFlag::SHIFT_L"
  str = str.upcase
  str = "KeyCode::#{str}"
  str = str.gsub "MODIFIERFLAG::", "ModifierFlag::"
  return str
end

physical_key = convert_keycode_string ARGV[0]
simulated_key = convert_keycode_string ARGV[1]

mapping_name = "Change #{physical_key} to #{simulated_key}"
mapping_identifier = "private.#{mapping_name.parameterize}"

private_xml_path = File.expand_path "#{ENV['HOME']}/Library/Application Support/Karabiner/private.xml"

new_private_xml_item = "
  <item>
    <name>#{mapping_name}</name>
    <identifier>#{mapping_identifier}</identifier>
    <autogen>
      __KeyToKey__
      #{physical_key},
      #{simulated_key}
    </autogen>
  </item>
"

blank_private_xml = '
  <?xml version="1.0"?>
  <root>
  </root>
'

if File.exist? private_xml_path
  old_xml_content = File.read private_xml_path
else
  old_xml_content = blank_private_xml
end

unless old_xml_content.include? new_private_xml_item
  new_xml_content = old_xml_content.gsub("</root>", new_private_xml_item + "\n</root>")

  File.write private_xml_path, new_xml_content

  karabiner = "/Applications/Karabiner.app/Contents/Library/bin/karabiner"

  `#{karabiner} set #{mapping_identifier} 1`
  `#{karabiner} reloadxml`
end

