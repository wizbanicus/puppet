# Fact: installed_apps
#
if Facter.value(:kernel) == "Darwin"
  Dir.entries('/var/db/').grep(/.puppet_(.*)/){$1}.each do |fact|
    fact_real = fact.gsub(/\s+/, "_").downcase.gsub(/\./, "_").gsub(/\-/,"_")
    Facter.add("#{fact_real}") do
      confine :kernel => :darwin
      setcode do
        true
      end
    end
  end
end
